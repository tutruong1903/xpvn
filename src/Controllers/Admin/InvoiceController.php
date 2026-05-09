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

final class InvoiceController extends BaseController
{
    private static array $details = [
        'field' => [
            'op' => '操作',
            'id' => '账单ID',
            'user_id' => '归属用户',
            'order_id' => '订单ID',
            'price' => '账单金额',
            'status' => '账单状态',
            'create_time' => '创建时间',
            'update_time' => '更新时间',
            'pay_time' => '支付时间',
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
                ->fetch('admin/invoice/index.tpl')
        );
    }

    /**
     * @throws Exception
     */
    public function detail(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $args['id'];
        $invoice = (new Invoice())->find($id);
        $paylist = [];

        if ($invoice->status === 'paid_gateway') {
            $paylist = (new Paylist())->where('invoice_id', $invoice->id)->where('status', 1)->first();
        }

        $invoice->status_text = $invoice->status();
        $invoice->create_time = Tools::toDateTime($invoice->create_time);
        $invoice->update_time = Tools::toDateTime($invoice->update_time);
        $invoice->pay_time = Tools::toDateTime($invoice->pay_time);
        $invoice_content = json_decode($invoice->content);

        return $response->write(
            $this->view()
                ->assign('invoice', $invoice)
                ->assign('invoice_content', $invoice_content)
                ->assign('paylist', $paylist)
                ->fetch('admin/invoice/view.tpl')
        );
    }

    public function markPaid(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $invoice_id = $args['id'];
        $invoice = (new Invoice())->find($invoice_id);

        if (in_array($invoice->status, ['paid_gateway', 'paid_balance', 'paid_admin'])) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_invoice.cannot_mark_paid', $this->getLocale()),
            ]);
        }

        $order = (new Order())->find($invoice->order_id);

        if ($order->status === 'cancelled') {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_invoice.order_cancelled', $this->getLocale()),
            ]);
        }

        $order->update_time = time();
        $order->status = 'pending_activation';
        $order->save();

        $invoice->update_time = time();
        $invoice->pay_time = time();
        $invoice->status = 'paid_admin';
        $invoice->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_invoice.mark_paid_success', $this->getLocale()),
        ]);
    }

    public function ajax(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $invoices = (new Invoice())->orderBy('id', 'desc')->get();
        $total = count($invoices);
        $paid = 0;
        $unpaid = 0;
        $cancelled = 0;

        foreach ($invoices as $invoice) {
            if (in_array($invoice->status, ['paid_gateway', 'paid_balance', 'paid_admin'])) {
                $paid++;
            } elseif (in_array($invoice->status, ['cancelled', 'refunded_balance'])) {
                $cancelled++;
            } else {
                $unpaid++;
            }

            $op = '<a class="lmn-act-btn lmn-act-btn--edit" href="/admin/invoice/' . $invoice->id . '/view">
                <span class="material-symbols-outlined">visibility</span></a>';
            if (in_array($invoice->status, ['unpaid', 'partially_paid'])) {
                $op .= ' <button class="lmn-act-btn lmn-act-btn--warn" onclick="markPaid(' . $invoice->id . ')">
                    <span class="material-symbols-outlined">check_circle</span></button>';
            }
            $invoice->op = $op;

            $statusClass = match ($invoice->status) {
                'paid_gateway', 'paid_balance', 'paid_admin' => 'lmn-badge--active',
                'cancelled' => 'lmn-badge--inactive',
                'refunded_balance' => 'lmn-badge--class-basic',
                'partially_paid' => 'lmn-badge--class-std',
                default => 'lmn-badge--inactive',
            };
            $rawStatus = $invoice->status;
            $invoice->status = '<span class="lmn-badge ' . $statusClass . '">' . $rawStatus . '</span>';

            $invoice->create_time = Tools::toDateTime($invoice->create_time);
            $invoice->update_time = Tools::toDateTime($invoice->update_time);
            $invoice->pay_time = Tools::toDateTime($invoice->pay_time);
        }

        return $response->withJson([
            'invoices' => $invoices,
            'total'    => $total,
            'paid'     => $paid,
            'unpaid'   => $unpaid,
            'cancelled'=> $cancelled,
        ]);
    }
}
