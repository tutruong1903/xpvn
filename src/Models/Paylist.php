<?php

declare(strict_types=1);

namespace App\Models;

use App\Services\I18n;
use Illuminate\Database\Query\Builder;

/**
 * @property int    $id         记录ID
 * @property int    $userid     用户ID
 * @property float  $total      总金额
 * @property int    $status     状态
 * @property int    $invoice_id 账单ID
 * @property string $tradeno    网关识别码
 * @property string $gateway    支付网关
 * @property int    $datetime   创建时间
 *
 * @mixin Builder
 */
final class Paylist extends Model
{
    protected $connection = 'default';
    protected $table = 'paylist';

    /**
     * 网关记录状态
     */
    public function status(): string
    {
        $locale = $_COOKIE['sspanel_locale'] ?? $_ENV['locale'] ?? 'en_US';

        return match ($this->status) {
            0 => I18n::trans('admin_log.pay_status_unpaid', $locale),
            1 => I18n::trans('admin_log.pay_status_paid', $locale),
            default => I18n::trans('admin_log.pay_status_unknown', $locale),
        };
    }
}
