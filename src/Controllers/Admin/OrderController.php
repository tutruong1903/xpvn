<?php

declare(strict_types=1);

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\Invoice;
use App\Models\Order;
use App\Models\Paylist;
use App\Services\I18n;
use App\Utils\Tools;
use Exception;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;
use function in_array;
use function json_decode;
use function time;

final class OrderController extends BaseController
{
    private static array $details = [
        'field' => [
            'op' => '操作',
            'id' => '订单ID',
            'user_id' => '提交用户',
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
                ->fetch('admin/order/index.tpl')
        );
    }

    public function search(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $out_order_id = $request->getParam('gateway_order_id');
        $paylist = (new Paylist())->where('tradeno', $out_order_id)->first();
        $invoice = (new Invoice())->where('id', $paylist?->invoice_id)->first();
        $order = (new Order())->where('id', $invoice?->order_id)->first();

        if ($order === null) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_order.search_not_found', $this->getLocale()),
            ]);
        }

        return $response->withHeader('HX-Redirect', '/admin/order/' . $order->id . '/view')->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_order.search_found', $this->getLocale()),
        ]);
    }

    /**
     * @throws Exception
     */
    public function detail(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $args['id'];
        $order = (new Order())->find($id);

        if ($order === null) {
            return $response->withStatus(301)->withHeader('Location', '/admin/order');
        }

        $order->product_type_text = $order->productType();
        $order->status_text = $order->status();
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
                ->fetch('admin/order/view.tpl')
        );
    }

    public function cancel(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $order_id = $args['id'];
        $order = (new Order())->find($order_id);

        if ($order === null) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_order.not_found', $this->getLocale()),
            ]);
        }

        if (in_array($order->status, ['activated', 'expired', 'cancelled'])) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_order.cannot_cancel', $this->getLocale()) . $order->status(),
            ]);
        }

        $invoice = (new Invoice())->where('order_id', $order_id)->first();

        if ($invoice === null) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_order.invoice_not_found', $this->getLocale()),
            ]);
        }

        if ($invoice->status === 'partially_paid') {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_order.invoice_partially_paid', $this->getLocale()),
            ]);
        }

        $order->update_time = time();
        $order->status = 'cancelled';
        $order->save();

        if (in_array($invoice->status, ['paid_gateway', 'paid_balance', 'paid_admin'])) {
            $invoice->refundToBalance();

            return $response->withJson([
                'ret' => 1,
                'msg' => I18n::trans('admin_order.cancel_success_refunded', $this->getLocale()),
            ]);
        }

        $invoice->update_time = time();
        $invoice->status = 'cancelled';
        $invoice->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_order.cancel_success', $this->getLocale()),
        ]);
    }

    public function delete(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $order_id = $args['id'];
        $order = (new Order())->find($order_id);

        if ($order === null) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_order.not_found', $this->getLocale()),
            ]);
        }

        $invoice = (new Invoice())->where('order_id', $order_id)->first();

        if ($order->delete() && $invoice->delete()) {
            return $response->withJson([
                'ret' => 1,
                'msg' => I18n::trans('admin_order.delete_success', $this->getLocale()),
            ]);
        }

        return $response->withJson([
            'ret' => 0,
            'msg' => I18n::trans('admin_order.delete_failed', $this->getLocale()),
        ]);
    }

    public function ajax(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $orders = (new Order())->orderBy('id', 'desc')->get();

        $total     = 0;
        $pending   = 0;
        $active    = 0;
        $cancelled = 0;

        foreach ($orders as $order) {
            $total++;
            if (in_array($order->status, ['pending_payment', 'pending_activation'])) {
                $pending++;
            } elseif ($order->status === 'activated') {
                $active++;
            } elseif ($order->status === 'cancelled') {
                $cancelled++;
            }

            $order->op =
                '<div class="lmn-act-wrap">' .
                    '<button class="lmn-act-btn lmn-act-btn--del" onclick="deleteOrder(' . $order->id . ')" title="Delete">' .
                        '<span class="material-symbols-outlined">delete</span>' .
                    '</button>';

            if (in_array($order->status, ['pending_payment', 'pending_activation'])) {
                $order->op .=
                    '<button class="lmn-act-btn lmn-act-btn--warn" onclick="cancelOrder(' . $order->id . ')" title="Cancel">' .
                        '<span class="material-symbols-outlined">cancel</span>' .
                    '</button>';
            }

            $order->op .=
                    '<a class="lmn-act-btn lmn-act-btn--edit" href="/admin/order/' . $order->id . '/view" title="View">' .
                        '<span class="material-symbols-outlined">visibility</span>' .
                    '</a>' .
                '</div>';

            $order->status = match ($order->status) {
                'pending_payment'    => '<span class="lmn-badge lmn-badge--class-std">pending_payment</span>',
                'pending_activation' => '<span class="lmn-badge lmn-badge--class-basic">pending_activation</span>',
                'activated'          => '<span class="lmn-badge lmn-badge--active">activated</span>',
                'expired'            => '<span class="lmn-badge lmn-badge--inactive">expired</span>',
                'cancelled'          => '<span class="lmn-badge lmn-badge--inactive">cancelled</span>',
                default              => '<span class="lmn-badge lmn-badge--inactive">' . $order->status . '</span>',
            };

            $order->product_type = match ($order->product_type) {
                'tabp'      => '<span class="lmn-badge lmn-badge--class-premium">type_tabp</span>',
                'time'      => '<span class="lmn-badge lmn-badge--class-std">type_time</span>',
                'bandwidth' => '<span class="lmn-badge lmn-badge--class-basic">type_bandwidth</span>',
                'topup'     => '<span class="lmn-badge lmn-badge--class-vip">type_topup</span>',
                default     => '<span class="lmn-badge lmn-badge--inactive">' . $order->product_type . '</span>',
            };

            $order->create_time = Tools::toDateTime($order->create_time);
            $order->update_time = Tools::toDateTime($order->update_time);
        }

        return $response->withJson([
            'orders'    => $orders,
            'total'     => $total,
            'pending'   => $pending,
            'active'    => $active,
            'cancelled' => $cancelled,
        ]);
    }
}
