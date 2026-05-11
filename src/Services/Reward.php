<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\Config;
use App\Models\Payback;
use App\Models\User;
use App\Models\UserMoneyLog;
use App\Utils\Tools;
use Exception;
use function random_int;
use function time;

final class Reward
{
    public static function issuePaybackReward($user_id, $ref_user_id, $total, $invoice_id): void
    {
        $ref_get = 0;

        $ref_user = (new User())->where('id', $ref_user_id)
            ->where('is_banned', 0)
            ->where('is_shadow_banned', 0)
            ->first();

        $exsit_payback = (new Payback())->where('userid', $user_id)
            ->where('invoice_id', $invoice_id)
            ->first();

        if ($ref_user !== null && $exsit_payback === null) {
            $invite_reward_mode = Config::obtain('invite_reward_mode');
            $invite_reward_rate = Config::obtain('invite_reward_rate');

            if ($invite_reward_mode === 'reward_count') {
                $invite_reward_count_limit = Config::obtain('invite_reward_count_limit');

                $invite_reward_count = (new Payback())->where('userid', $user_id)
                    ->where('ref_by', $ref_user_id)
                    ->count();

                if ($invite_reward_count < $invite_reward_count_limit) {
                    $ref_get = $total * $invite_reward_rate;
                }
            }

            if ($invite_reward_mode === 'reward_total') {
                $invite_reward_total_limit = Config::obtain('invite_reward_total_limit');

                $invite_reward_total = (new Payback())->where('userid', $user_id)
                    ->where('ref_by', $ref_user_id)
                    ->sum('ref_get');

                if ($invite_reward_total < $invite_reward_total_limit) {
                    $ref_get = $total * $invite_reward_rate;

                    if ($invite_reward_total + $ref_get > $invite_reward_total_limit) {
                        $ref_get = $invite_reward_total_limit - $invite_reward_total;
                    }
                }
            }
        }

        if ($ref_get !== 0) {
            $money_before = $ref_user->money;
            $ref_user->money += $ref_get;
            $ref_user->save();
            // 添加余额记录
            (new UserMoneyLog())->add(
                $ref_user->id,
                (float) $money_before,
                (float) $ref_user->money,
                $ref_get,
                [
                    'en_US' => 'Referral reward from user #' . $user_id,
                    'zh_CN' => '邀请用户 #' . $user_id . ' 返利',
                    'zh_TW' => '邀請用戶 #' . $user_id . ' 返利',
                    'ja_JP' => 'ユーザー #' . $user_id . ' の紹介報酬',
                    'vn_VN' => 'Hoa hồng giới thiệu từ người dùng #' . $user_id,
                ],
            );
            // 添加返利记录
            (new Payback())->add(
                (float) $total,
                $user_id,
                $ref_user_id,
                (float) $ref_get,
                $invoice_id,
            );
        }
    }

    public static function issueRegReward($user_id, $ref_user_id): void
    {
        $invite_reg_money_reward = Config::obtain('invite_reg_money_reward');
        $invite_reg_traffic_reward = Config::obtain('invite_reg_traffic_reward');

        $user = (new User())->where('id', $user_id)->first();

        $ref_user = (new User())->where('id', $ref_user_id)
            ->where('is_banned', 0)
            ->where('is_shadow_banned', 0)
            ->first();

        if ($user !== null && $ref_user !== null) {
            if ($invite_reg_money_reward !== 0) {
                $money_before = $user->money;
                $user->money += $invite_reg_money_reward;
                $user->save();
                // 添加余额记录
                (new UserMoneyLog())->add(
                    $user->id,
                    (float) $money_before,
                    (float) $user->money,
                    $invite_reg_money_reward,
                    [
                        'en_US' => 'Registration reward via invite from user #' . $ref_user_id,
                        'zh_CN' => '被用户 #' . $ref_user_id . ' 邀请注册奖励',
                        'zh_TW' => '被用戶 #' . $ref_user_id . ' 邀請註冊獎勵',
                        'ja_JP' => 'ユーザー #' . $ref_user_id . ' からの招待登録報酬',
                        'vn_VN' => 'Thưởng đăng ký từ lời mời của người dùng #' . $ref_user_id,
                    ],
                );
            }

            if ($invite_reg_traffic_reward !== 0) {
                $ref_user->transfer_enable += Tools::gbToB($invite_reg_traffic_reward);
                $ref_user->save();
            }
        }
    }

    public static function issueCheckinReward($user_id): int|false
    {
        $user = (new User())->where('id', $user_id)->first();

        if ($user === null) {
            return false;
        }

        $checkin_min = Config::obtain('checkin_min');
        $checkin_max = Config::obtain('checkin_max');

        if ($checkin_min === $checkin_max) {
            $traffic = $checkin_min;
        } else {
            try {
                $traffic = random_int($checkin_min, $checkin_max);
            } catch (Exception) {
                $traffic = 0;
            }
        }

        if ($traffic !== 0) {
            $user->transfer_enable += Tools::mbToB($traffic);
            $user->last_check_in_time = time();
            $user->save();
        }

        return $traffic;
    }
}
