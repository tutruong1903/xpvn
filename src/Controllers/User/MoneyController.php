<?php

declare(strict_types=1);

namespace App\Controllers\User;

use App\Controllers\BaseController;
use App\Models\GiftCard;
use App\Models\UserMoneyLog;
use App\Utils\Tools;
use Exception;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;
use function time;

final class MoneyController extends BaseController
{
    private const PER_PAGE = 20;

    /**
     * @throws Exception
     */
    public function index(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $user  = $this->user;
        $page  = max(1, (int) ($request->getQueryParam('page', 1)));
        $limit = self::PER_PAGE;

        $query     = (new UserMoneyLog())->where('user_id', $user->id);
        $total     = $query->count();
        $moneylogs = (clone $query)
            ->orderBy('id', 'desc')
            ->skip(($page - 1) * $limit)
            ->take($limit)
            ->get();

        // Compute aggregated stats
        $total_credit = (float) (new UserMoneyLog())
            ->where('user_id', $user->id)
            ->where('amount', '>', 0)
            ->sum('amount');

        $total_debit = abs((float) (new UserMoneyLog())
            ->where('user_id', $user->id)
            ->where('amount', '<', 0)
            ->sum('amount'));

        $locale = $this->getLocale();

        foreach ($moneylogs as $moneylog) {
            $moneylog->create_time = Tools::toDateTime($moneylog->create_time);
            $moneylog->remark = $moneylog->getLocalizedRemark($locale);
        }

        // i18n-aware field labels passed to template
        $fields = [
            'id'          => '事件ID',
            'before'      => '变动前余额',
            'after'       => '变动后余额',
            'amount'      => '变动金额',
            'remark'      => '备注',
            'create_time' => '变动时间',
        ];

        $total_pages  = (int) ceil($total / $limit);
        $page_start  = max(1, $page - 2);
        $page_end    = min($total_pages, $page + 2);

        return $response->write(
            $this->view()
                ->assign('moneylogs', $moneylogs)
                ->assign('moneylog_count', $total)
                ->assign('current_page', $page)
                ->assign('total_pages', $total_pages)
                ->assign('page_start', $page_start)
                ->assign('page_end', $page_end)
                ->assign('per_page', $limit)
                ->assign('total_credit', $total_credit)
                ->assign('total_debit', $total_debit)
                ->assign('current_balance', (float) $user->money)
                ->assign('details', ['field' => $fields])
                ->fetch('user/money.tpl')
        );
    }

    public function applyGiftCard(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $giftcard_raw = $this->antiXss->xss_clean($request->getParam('giftcard'));
        $giftcard = (new GiftCard())->where('card', $giftcard_raw)->first();

        if ($giftcard === null || $giftcard->status !== 0) {
            return $response->withJson([
                'ret' => 0,
                'msg' => '礼品卡无效',
            ]);
        }

        $user = $this->user;

        if ($user->is_shadow_banned) {
            return $response->withJson([
                'ret' => 0,
                'msg' => '礼品卡无效',
            ]);
        }

        $giftcard->status = 1;
        $giftcard->use_time = time();
        $giftcard->use_user = $user->id;
        $giftcard->save();

        $money_before = $user->money;
        $user->money += $giftcard->balance;
        $user->save();

        (new UserMoneyLog())->add(
            $user->id,
            $money_before,
            (float) $user->money,
            $giftcard->balance,
            [
                'en_US' => 'Gift card top-up ' . $giftcard->card,
                'zh_CN' => '礼品卡充值 ' . $giftcard->card,
                'zh_TW' => '禮品卡儲值 ' . $giftcard->card,
                'ja_JP' => 'ギフトカードチャージ ' . $giftcard->card,
                'vn_VN' => 'Nạp thẻ quà tặng ' . $giftcard->card,
            ]
        );

        return $response->withJson([
            'ret' => 1,
            'msg' => '充值成功',
        ]);
    }
}
