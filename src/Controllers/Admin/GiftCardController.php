<?php

declare(strict_types=1);

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\GiftCard;
use App\Services\I18n;
use App\Utils\Tools;
use Exception;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;
use function time;
use const PHP_EOL;

final class GiftCardController extends BaseController
{
    private static array $details = [
        'field' => [
            'op' => '操作',
            'id' => '礼品卡ID',
            'card' => '卡号',
            'balance' => '面值',
            'create_time' => '创建时间',
            'status' => '使用状态',
            'use_time' => '使用时间',
            'use_user' => '使用用户',
        ],
        'create_dialog' => [
            [
                'id' => 'card_number',
                'info' => '创建数量',
                'i18n_key' => 'field_card_number',
                'type' => 'input',
                'placeholder' => '',
            ],
            [
                'id' => 'card_value',
                'info' => '礼品卡面值',
                'i18n_key' => 'field_card_value',
                'type' => 'input',
                'placeholder' => '',
            ],
            [
                'id' => 'card_length',
                'info' => '礼品卡长度',
                'i18n_key' => 'field_card_length',
                'type' => 'select',
                'select' => [
                    '12' => '12位',
                    '18' => '18位',
                    '24' => '24位',
                    '30' => '30位',
                    '36' => '36位',
                ],
            ],
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
                ->fetch('admin/giftcard.tpl')
        );
    }

    public function add(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $card_number = $request->getParam('card_number') ?? 0;
        $card_value = $request->getParam('card_value') ?? 0;
        $card_length = $request->getParam('card_length') ?? 0;
        $card_added = '';

        if ($card_number === '' || $card_number <= 0) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_giftcard.invalid_number', $this->getLocale()),
            ]);
        }

        if ($card_value === '' || $card_value <= 0) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_giftcard.invalid_value', $this->getLocale()),
            ]);
        }

        if ($card_length === '' || $card_length <= 0) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_giftcard.invalid_length', $this->getLocale()),
            ]);
        }

        for ($i = 0; $i < $card_number; $i++) {
            $card = Tools::genRandomChar((int) $card_length);
            // save to database
            $giftcard = new GiftCard();
            $giftcard->card = $card;
            $giftcard->balance = $card_value;
            $giftcard->create_time = time();
            $giftcard->status = 0;
            $giftcard->use_time = 0;
            $giftcard->use_user = 0;
            $giftcard->save();
            $card_added .= $card . PHP_EOL;
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_giftcard.add_success', $this->getLocale()) . PHP_EOL . $card_added,
        ]);
    }

    public function delete(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $card_id = $args['id'];
        (new GiftCard())->find($card_id)->delete();

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_giftcard.delete_success', $this->getLocale()),
        ]);
    }

    public function ajax(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $giftcards = (new GiftCard())->orderBy('id', 'desc')->get();
        $total  = count($giftcards);
        $unused = 0;
        $used   = 0;

        foreach ($giftcards as $giftcard) {
            if ($giftcard->status) {
                $used++;
            } else {
                $unused++;
            }

            $giftcard->op = '<button class="lmn-act-btn lmn-act-btn--del" onclick="deleteGiftCard(' . $giftcard->id . ')">
                <span class="material-symbols-outlined">delete</span></button>';

            $rawStatus   = $giftcard->status ? 'used' : 'unused';
            $statusClass = $giftcard->status ? 'lmn-badge--inactive' : 'lmn-badge--active';
            $giftcard->status = '<span class="lmn-badge ' . $statusClass . '">' . $rawStatus . '</span>';

            $giftcard->create_time = Tools::toDateTime((int) $giftcard->create_time);
            $giftcard->use_time    = $giftcard->use_time ? Tools::toDateTime((int) $giftcard->use_time) : '—';
        }

        return $response->withJson([
            'giftcards' => $giftcards,
            'total'  => $total,
            'unused' => $unused,
            'used'   => $used,
        ]);
    }
}
