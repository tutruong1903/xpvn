<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Query\Builder;
use function json_decode;
use function json_encode;
use function time;

/**
 * @property int $id 记录ID
 * @property int $user_id 用户ID
 * @property float $before 用户变动前账户余额
 * @property float $after 用户变动后账户余额
 * @property float $amount 变动总额
 * @property string $remark 备注(JSON多语言)
 * @property int $create_time 创建时间
 *
 * @mixin Builder
 */
final class UserMoneyLog extends Model
{
    protected $connection = 'default';
    protected $table = 'user_money_log';

    /**
     * Add a money log entry with multi-language remark.
     *
     * @param array<string, string> $remark  e.g. ['en_US' => '...', 'zh_CN' => '...', 'vn_VN' => '...', 'zh_TW' => '...', 'ja_JP' => '...']
     */
    public function add(int $user_id, float $before, float $after, float $amount, array $remark): void
    {
        $this->user_id = $user_id;
        $this->before = $before;
        $this->after = $after;
        $this->amount = $amount;
        $this->remark = json_encode($remark, JSON_UNESCAPED_UNICODE);
        $this->create_time = time();
        $this->save();
    }

    /**
     * Get remark for a specific locale, falling back to en_US then first available.
     */
    public function getLocalizedRemark(string $locale = 'en_US'): string
    {
        $decoded = json_decode($this->remark, true);

        if (! is_array($decoded)) {
            // Legacy plain-text remark — return as-is
            return $this->remark ?? '';
        }

        return $decoded[$locale]
            ?? $decoded['en_US']
            ?? (string) reset($decoded);
    }
}
