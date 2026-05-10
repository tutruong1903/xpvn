<?php

declare(strict_types=1);

namespace App\Models;

use App\Services\I18n;
use Illuminate\Database\Query\Builder;
use function in_array;
use function json_decode;
use function json_encode;
use function time;

/**
 * @property int    $id          账单ID
 * @property string $type        账单类型
 * @property int    $user_id     归属用户ID
 * @property string $order_id    订单ID
 * @property string $content     账单内容
 * @property float  $price       账单金额
 * @property string $status      账单状态
 * @property int    $create_time 创建时间
 * @property int    $update_time 更新时间
 * @property int    $pay_time    支付时间
 *
 * @mixin Builder
 */
final class Invoice extends Model
{
    protected $connection = 'default';
    protected $table = 'invoice';

    private function locale(): string
    {
        return $_COOKIE['sspanel_locale'] ?? $_ENV['locale'] ?? 'en_US';
    }

    /**
     * 账单状态
     */
    public function status(): string
    {
        $locale = $this->locale();
        return match ($this->status) {
            'unpaid'           => I18n::trans('admin_invoice.status_unpaid', $locale),
            'paid_gateway'     => I18n::trans('admin_invoice.status_paid_gateway', $locale),
            'paid_balance'     => I18n::trans('admin_invoice.status_paid_balance', $locale),
            'paid_admin'       => I18n::trans('admin_invoice.status_paid_admin', $locale),
            'cancelled'        => I18n::trans('admin_invoice.status_cancelled', $locale),
            'refunded_balance' => I18n::trans('admin_invoice.status_refunded_balance', $locale),
            'partially_paid'   => I18n::trans('admin_invoice.status_partially_paid', $locale),
            default            => I18n::trans('admin_invoice.status_unknown', $locale),
        };
    }

    public function type(): string
    {
        $locale = $this->locale();
        return match ($this->type) {
            'product' => I18n::trans('admin_invoice.type_product', $locale),
            'topup'   => I18n::trans('admin_invoice.type_topup', $locale),
            default   => I18n::trans('admin_invoice.type_unknown', $locale),
        };
    }

    public function refundToBalance(): void
    {
        if (in_array($this->status, ['paid_gateway', 'paid_balance', 'paid_admin'])) {
            $user = (new User())->find($this->user_id);
            $user->money += $this->price;
            $user->save();

            (new UserMoneyLog())->add(
                $user->id,
                $user->money - $this->price,
                $user->money,
                $this->price,
                'Invoice #' . $this->id . ' refunded to account balance'
            );

            $content = json_decode($this->content, true);
            $content[] = [
                'content_id' => count($content),
                'name' => 'Refunded to account balance',
                'price' => '-' . $this->price,
            ];

            $this->content = json_encode($content);
            $this->status = 'refunded_balance';
            $this->update_time = time();
            $this->save();
        }
    }
}
