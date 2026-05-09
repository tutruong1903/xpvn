<?php

declare(strict_types=1);

namespace App\Models;

use App\Services\I18n;
use Illuminate\Database\Query\Builder;

/**
 * @property int    $id              订单ID
 * @property int    $user_id         提交用户ID
 * @property int    $product_id      商品ID
 * @property string $product_type    商品类型
 * @property string $product_name    商品名称
 * @property string $product_content 商品内容
 * @property string $coupon          订单优惠码
 * @property float  $price           订单金额
 * @property string $status          订单状态
 * @property int    $create_time     创建时间
 * @property int    $update_time     更新时间
 *
 * @mixin Builder
 */
final class Order extends Model
{
    protected $connection = 'default';
    protected $table = 'order';

    private function locale(): string
    {
        return $_COOKIE['sspanel_locale'] ?? $_ENV['locale'] ?? 'en_US';
    }

    /**
     * 订单状态
     */
    public function status(): string
    {
        $locale = $this->locale();
        return match ($this->status) {
            'pending_payment'    => I18n::trans('admin_order.status_pending_payment', $locale),
            'pending_activation' => I18n::trans('admin_order.status_pending_activation', $locale),
            'activated'          => I18n::trans('admin_order.status_activated', $locale),
            'expired'            => I18n::trans('admin_order.status_expired', $locale),
            'cancelled'          => I18n::trans('admin_order.status_cancelled', $locale),
            default              => I18n::trans('admin_order.status_unknown', $locale),
        };
    }

    /**
     * 订单商品类型
     */
    public function productType(): string
    {
        $locale = $this->locale();
        return match ($this->product_type) {
            'tabp'      => I18n::trans('admin_order.type_tabp', $locale),
            'time'      => I18n::trans('admin_order.type_time', $locale),
            'bandwidth' => I18n::trans('admin_order.type_bandwidth', $locale),
            'topup'     => I18n::trans('admin_order.type_topup', $locale),
            default     => I18n::trans('admin_order.type_other', $locale),
        };
    }
}
