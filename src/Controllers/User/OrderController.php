<?php

declare(strict_types=1);

namespace App\Controllers\User;

use App\Controllers\BaseController;
use App\Models\Invoice;
use App\Models\Order;
use App\Models\Product;
use App\Models\UserCoupon;
use App\Services\I18n;
use App\Utils\Cookie;
use App\Utils\Tools;
use Exception;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;
use function explode;
use function in_array;
use function json_decode;
use function json_encode;
use function property_exists;
use function time;

final class OrderController extends BaseController
{
    private static array $details = [
        'field' => [
            'op' => '操作',
            'id' => '订单ID',
            'product_id' => '商品ID',
            'product_type' => '商品类型',
            'product_name' => '商品名称',
            'coupon' => '优惠码',
            'price' => '金额',
            'status' => '状态',
            'create_time' => '创建时间',
            'update_time' => '更新时间',
        ],
    ];

    /**
     * @throws Exception
     */
    public function index(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        return $response->write(
            $this->view()
                ->assign('details', self::$details)
                ->fetch('user/order/index.tpl')
        );
    }

    /**
     * @throws Exception
     */
    public function create(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $product_id = $this->antiXss->xss_clean($request->getQueryParams()['product_id']) ?? null;
        $redir = Cookie::get('redir');

        if ($redir !== '') {
            Cookie::set(['redir' => ''], time() - 1);
        }

        if ($product_id === null || $product_id === '') {
            return $response->withRedirect('/user/product');
        }

        $product = (new Product())->where('id', $product_id)->first();
        $product->type_text = $product->type();
        $product->content = json_decode($product->content);

        $user = $this->user;
        $limit = json_decode($product->limit);
        $can_buy = true;
        $eligibility = [];

        if ($limit->class_required !== '') {
            $required = (int) $limit->class_required;
            $pass = $user->class >= $required;
            if (! $pass) {
                $can_buy = false;
            }
            $eligibility[] = [
                'type'     => 'class',
                'current'  => $user->class,
                'required' => $required,
                'pass'     => $pass,
            ];
        }

        if ($limit->node_group_required !== '') {
            $required = (int) $limit->node_group_required;
            $pass = $user->node_group === $required;
            if (! $pass) {
                $can_buy = false;
            }
            $eligibility[] = [
                'type'     => 'node_group',
                'current'  => $user->node_group,
                'required' => $required,
                'pass'     => $pass,
            ];
        }

        if ($limit->new_user_required !== 0) {
            $order_count = (new Order())->where('user_id', $user->id)->count();
            $pass = $order_count === 0;
            if (! $pass) {
                $can_buy = false;
            }
            $eligibility[] = [
                'type' => 'new_user',
                'pass' => $pass,
            ];
        }

        return $response->write(
            $this->view()
                ->assign('product', $product)
                ->assign('can_buy', $can_buy)
                ->assign('eligibility', $eligibility)
                ->fetch('user/order/create.tpl')
        );
    }

    /**
     * @throws Exception
     */
    public function detail(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $this->antiXss->xss_clean($args['id']);

        $order = (new Order())->where('user_id', $this->user->id)->where('id', $id)->first();

        if ($order === null) {
            return $response->withRedirect('/user/order');
        }

        $order->product_type_text = $order->productType();
        $order->status = $order->status();
        $order->create_time = Tools::toDateTime($order->create_time);
        $order->update_time = Tools::toDateTime($order->update_time);
        $order->content = json_decode($order->product_content);

        $invoice = (new Invoice())->where('order_id', $id)->first();
        $invoice->status = $invoice->status();
        $invoice->create_time = Tools::toDateTime($invoice->create_time);
        $invoice->update_time = Tools::toDateTime($invoice->update_time);
        $invoice->pay_time = Tools::toDateTime($invoice->pay_time);
        $invoice->content = json_decode($invoice->content);

        return $response->write(
            $this->view()
                ->assign('order', $order)
                ->assign('invoice', $invoice)
                ->fetch('user/order/view.tpl')
        );
    }

    public function process(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $locale = $this->getLocale();
        return match ($request->getParam('type')) {
            'product' => $this->product($request, $response, $args),
            'topup' => $this->topup($request, $response, $args),
            default => $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('user_order.unknown_type', $locale),
            ]),
        };
    }

    public function product(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $locale = $this->getLocale();
        $coupon_raw = $this->antiXss->xss_clean($request->getParam('coupon'));
        $product_id = $this->antiXss->xss_clean($request->getParam('product_id'));

        $product = (new Product())->find($product_id);

        if ($product === null || $product->stock === 0) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('user_order.product_not_found', $locale),
            ]);
        }

        $buy_price = $product->price;
        $user = $this->user;

        if ($user->is_shadow_banned) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('user_order.product_not_found', $locale),
            ]);
        }

        $coupon = null;

        if ($coupon_raw !== '') {
            $coupon = (new UserCoupon())->where('code', $coupon_raw)->first();

            if ($coupon === null || ($coupon->expire_time !== 0 && $coupon->expire_time < time())) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans('user_order.coupon_not_found', $locale),
                ]);
            }

            $coupon_limit = json_decode($coupon->limit);

            if ($coupon_limit->disabled) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans('user_order.coupon_disabled', $locale),
                ]);
            }

            if ($coupon_limit->product_id !== '' && ! in_array($product_id, explode(',', $coupon_limit->product_id))) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans('user_order.coupon_not_applicable', $locale),
                ]);
            }

            $coupon_use_limit = $coupon_limit->use_time;

            if ($coupon_use_limit > 0) {
                $user_use_count = (new Order())->where('user_id', $user->id)->where('coupon', $coupon->code)->count();
                if ($user_use_count >= $coupon_use_limit) {
                    return $response->withJson([
                        'ret' => 0,
                        'msg' => I18n::trans('user_order.coupon_use_limit', $locale),
                    ]);
                }
            }

            if (property_exists($coupon_limit, 'total_use_time')) {
                $coupon_total_use_limit = $coupon_limit->total_use_time;
            } else {
                $coupon_total_use_limit = -1;
            }

            if ($coupon_total_use_limit > 0 && $coupon->use_count >= $coupon_total_use_limit) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans('user_order.coupon_use_limit', $locale),
                ]);
            }

            $content = json_decode($coupon->content);

            if ($content->type === 'percentage') {
                $discount = $product->price * $content->value / 100;
            } else {
                $discount = $content->value;
            }

            $buy_price = $product->price - $discount;
        }

        $product_limit = json_decode($product->limit);

        if ($product_limit->class_required !== '' && $user->class < (int) $product_limit->class_required) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('user_order.class_required', $locale),
            ]);
        }

        if ($product_limit->node_group_required !== ''
            && $user->node_group !== (int) $product_limit->node_group_required) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('user_order.node_group_required', $locale),
            ]);
        }

        if ($product_limit->new_user_required !== 0) {
            $order_count = (new Order())->where('user_id', $user->id)->count();
            if ($order_count > 0) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans('user_order.new_user_required', $locale),
                ]);
            }
        }

        $order = new Order();
        $order->user_id = $user->id;
        $order->product_id = $product->id;
        $order->product_type = $product->type;
        $order->product_name = $product->name;
        $order->product_content = $product->content;
        $order->coupon = $coupon_raw;
        $order->price = $buy_price;
        $order->status = $buy_price === 0 ? 'pending_activation' : 'pending_payment';
        $order->create_time = time();
        $order->update_time = time();
        $order->save();

        $invoice_content = [];
        $invoice_content[] = [
            'content_id' => 0,
            'name' => $product->name,
            'price' => $product->price,
        ];

        if ($coupon_raw !== '') {
            $invoice_content[] = [
                'content_id' => 1,
                'name' => '优惠码 ' . $coupon_raw,
                'price' => '-' . $discount,
            ];
        }

        $invoice = new Invoice();
        $invoice->user_id = $user->id;
        $invoice->order_id = $order->id;
        $invoice->content = json_encode($invoice_content);
        $invoice->price = $buy_price;
        $invoice->status = $buy_price === 0 ? 'paid_gateway' : 'unpaid';
        $invoice->create_time = time();
        $invoice->update_time = time();
        $invoice->pay_time = 0;
        $invoice->type = 'product';
        $invoice->save();

        if ($product->stock > 0) {
            $product->stock -= 1;
        }

        $product->sale_count += 1;
        $product->save();

        if ($coupon_raw !== '') {
            $coupon->use_count += 1;
            $coupon->save();
        }

        return $response->withHeader('HX-Redirect', '/user/invoice/' . $invoice->id . '/view');
    }

    public function topup(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $locale = $this->getLocale();
        $amount = $this->antiXss->xss_clean($request->getParam('amount'));
        $amount = is_numeric($amount) ? round((float) $amount, 2) : null;

        if ($amount === null || $amount <= 0) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('user_order.invalid_amount', $locale),
            ]);
        }

        $order = new Order();
        $order->user_id = $this->user->id;
        $order->product_id = 0;
        $order->product_type = 'topup';
        $order->product_name = '余额充值';
        $order->product_content = json_encode(['amount' => $amount]);
        $order->coupon = '';
        $order->price = $amount;
        $order->status = 'pending_payment';
        $order->create_time = time();
        $order->update_time = time();
        $order->save();

        $invoice_content = [];
        $invoice_content[] = [
            'content_id' => 0,
            'name' => '余额充值',
            'price' => $amount,
        ];

        $invoice = new Invoice();
        $invoice->user_id = $this->user->id;
        $invoice->order_id = $order->id;
        $invoice->content = json_encode($invoice_content);
        $invoice->price = $amount;
        $invoice->status = 'unpaid';
        $invoice->create_time = time();
        $invoice->update_time = time();
        $invoice->pay_time = 0;
        $invoice->type = 'topup';
        $invoice->save();

        return $response->withHeader('HX-Redirect', '/user/invoice/' . $invoice->id . '/view');
    }

    public function ajax(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $orders = (new Order())->orderBy('id', 'desc')->where('user_id', $this->user->id)->get();

        $total              = $orders->count();
        $pending_payment    = $orders->where('status', 'pending_payment')->count();
        $activated          = $orders->where('status', 'activated')->count();
        $total_spent        = $orders->where('status', 'activated')->sum('price');

        foreach ($orders as $order) {
            $order->op = '<div class="lmn-act-wrap">';

            if ($order->status === 'pending_payment') {
                $invoice_id = (new Invoice())->where('order_id', $order->id)->first()->id;
                $order->op .=
                    '<a class="lmn-act-btn lmn-act-btn--warn" href="/user/invoice/' . $invoice_id . '/view" title="Pay">' .
                        '<span class="material-symbols-outlined">payment</span>' .
                    '</a>';
            }

            $order->op .=
                    '<a class="lmn-act-btn lmn-act-btn--edit" href="/user/order/' . $order->id . '/view" title="View">' .
                        '<span class="material-symbols-outlined">visibility</span>' .
                    '</a>' .
                '</div>';

            $statusText = $order->status();
            $order->status = match ($order->status) {
                'pending_payment'    => '<span class="lmn-badge lmn-badge--class-std">'   . $statusText . '</span>',
                'pending_activation' => '<span class="lmn-badge lmn-badge--class-basic">' . $statusText . '</span>',
                'activated'          => '<span class="lmn-badge lmn-badge--active">'      . $statusText . '</span>',
                'expired'            => '<span class="lmn-badge lmn-badge--inactive">'    . $statusText . '</span>',
                'cancelled'          => '<span class="lmn-badge lmn-badge--banned">'      . $statusText . '</span>',
                default              => '<span class="lmn-badge lmn-badge--inactive">'    . $statusText . '</span>',
            };

            $typeText = $order->productType();
            $order->product_type = match ($order->product_type) {
                'tabp'      => '<span class="lmn-badge lmn-badge--class-premium">' . $typeText . '</span>',
                'time'      => '<span class="lmn-badge lmn-badge--class-std">'     . $typeText . '</span>',
                'bandwidth' => '<span class="lmn-badge lmn-badge--class-basic">'   . $typeText . '</span>',
                'topup'     => '<span class="lmn-badge lmn-badge--class-vip">'     . $typeText . '</span>',
                default     => '<span class="lmn-badge lmn-badge--inactive">'      . $typeText . '</span>',
            };

            $order->create_time = Tools::toDateTime($order->create_time);
            $order->update_time = Tools::toDateTime($order->update_time);
        }

        return $response->withJson([
            'orders'          => $orders,
            'total'           => $total,
            'pending_payment' => $pending_payment,
            'activated'       => $activated,
            'total_spent'     => $total_spent,
        ]);
    }
}
