<?php

declare(strict_types=1);

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\Ticket;
use App\Models\User;
use App\Services\LLM;
use App\Services\Notification;
use App\Utils\ResponseHelper;
use App\Utils\Tools;
use GuzzleHttp\Exception\GuzzleException;
use Psr\Http\Client\ClientExceptionInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;
use Smarty\Exception;
use Telegram\Bot\Exceptions\TelegramSDKException;
use function array_merge;
use function count;
use function json_decode;
use function json_encode;
use function nl2br;
use function time;

final class TicketController extends BaseController
{
    private static array $details = [
        'field' => [
            'op' => '操作',
            'id' => '工单ID',
            'title' => '主题',
            'status' => '工单状态',
            'type' => '工单类型',
            'userid' => '提交用户',
            'datetime' => '创建时间',
        ],
        'filter' => [
            [
                'field'      => 'status',
                'label'      => '状态',
                'label_key'  => 'filter.status_label',
                'i18n_ns'    => 'ticket',
                'values'     => [
                    ''           => '全部',
                    'open'       => '进行中',
                    'closed'     => '已结单',
                    'wait_user'  => '等待用户回复',
                    'wait_admin' => '等待管理员',
                ],
                'value_keys' => [
                    ''           => 'filter.all',
                    'open'       => 'filter.status_open',
                    'closed'     => 'filter.status_closed',
                    'wait_user'  => 'filter.status_wait_user',
                    'wait_admin' => 'filter.status_wait_admin',
                ],
            ],
            [
                'field'      => 'type',
                'label'      => '类型',
                'label_key'  => 'filter.type_label',
                'i18n_ns'    => 'ticket',
                'values'     => [
                    ''        => '全部',
                    'howto'   => '使用说明',
                    'billing' => '支付',
                    'account' => '账户',
                    'other'   => '其他',
                ],
                'value_keys' => ['' => 'filter.all'],
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
                ->fetch('admin/ticket/index.tpl')
        );
    }

    public function reply(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $args['id'];
        $comment = $request->getParam('comment') ?? '';

        if ($comment === '') {
            return ResponseHelper::error($response, '请输入评论内容');
        }

        $ticket = (new Ticket())->where('id', $id)->first();

        if ($ticket === null) {
            return ResponseHelper::error($response, '工单不存在');
        }

        $content_old = json_decode($ticket->content, true);
        $content_new = [
            [
                'comment_id' => $content_old[count($content_old) - 1]['comment_id'] + 1,
                'commenter_type' => 'admin',
                'commenter_name' => 'Admin',
                'comment' => $comment,
                'datetime' => time(),
            ],
        ];

        $ticket->content = json_encode(array_merge($content_old, $content_new));
        $ticket->status = 'open_wait_user';
        $ticket->save();

        try {
            Notification::notifyUser(
                (new User())->find($ticket->userid),
                $_ENV['appName'] . '-工单被回复',
                '你好，有人回复了<a href="' . $_ENV['baseUrl'] . '/user/ticket/' . $ticket->id . '/view">工单</a>，请你查看。'
            );
        } catch (TelegramSDKException|GuzzleException|ClientExceptionInterface $e) {
            return $response->withHeader('HX-Refresh', 'true');
        }

        return $response->withHeader('HX-Refresh', 'true');
    }

    public function llmReply(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $args['id'];
        $ticket = (new Ticket())->where('id', $id)->first();

        if ($ticket === null) {
            return ResponseHelper::error($response, '工单不存在');
        }

        $content_old = json_decode($ticket->content, true);

        if (count($content_old) === 1) {
            $context = [
                [
                    'role' => 'user',
                    'content' => $ticket->title,
                ],
                [
                    'role' => 'user',
                    'content' => $content_old[0]['comment'],
                ],
            ];
        } else {
            $context = [
                [
                    'role' => 'user',
                    'content' => $ticket->title,
                ],
            ];

            foreach ($content_old as $comment) {
                $context[] = [
                    'role' => $comment['commenter_type'] ?? $comment['commenter_name'] === 'Admin' ? 'admin' : 'user',
                    'content' => $comment['comment'],
                ];
            }
        }

        $llm_response = LLM::genTextResponseWithContext($context);

        $content_new = [
            [
                'comment_id' => $content_old[count($content_old) - 1]['comment_id'] + 1,
                'commenter_type' => 'llm',
                'commenter_name' => 'AI Assistant',
                'comment' => $llm_response,
                'datetime' => time(),
            ],
        ];

        $ticket->content = json_encode(array_merge($content_old, $content_new));
        $ticket->status = 'open_wait_user';
        $ticket->save();

        try {
            Notification::notifyUser(
                (new User())->find($ticket->userid),
                $_ENV['appName'] . '-工单被回复',
                '你好，AI助理回复了<a href="' . $_ENV['baseUrl'] . '/user/ticket/' . $ticket->id . '/view">工单</a>，请你查看。'
            );
        } catch (TelegramSDKException|GuzzleException|ClientExceptionInterface $e) {
            return $response->withHeader('HX-Refresh', 'true');
        }

        return $response->withHeader('HX-Refresh', 'true');
    }

    /**
     * 后台查看指定工单
     *
     * @throws Exception
     */
    public function detail(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $args['id'];
        $ticket = (new Ticket())->where('id', '=', $id)->first();

        if ($ticket === null) {
            return $response->withRedirect('/admin/ticket');
        }

        $comments = json_decode($ticket->content);

        foreach ($comments as $comment) {
            $comment->comment = nl2br($comment->comment);
            $comment->datetime = Tools::toDateTime((int) $comment->datetime);
        }

        return $response->write(
            $this->view()
                ->assign('ticket', $ticket)
                ->assign('comments', $comments)
                ->fetch('admin/ticket/view.tpl')
        );
    }

    /**
     * 后台关闭工单
     */
    public function close(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $args['id'];
        $ticket = (new Ticket())->where('id', '=', $id)->first();

        if ($ticket === null) {
            return ResponseHelper::error($response, '工单不存在');
        }

        if ($ticket->status === 'closed') {
            return ResponseHelper::error($response, '工单已关闭，无需重复操作');
        }

        $ticket->status = 'closed';
        $ticket->save();

        return ResponseHelper::success($response, '工单关闭成功');
    }

    /**
     * 后台删除工单
     */
    public function delete(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $args['id'];
        (new Ticket())->where('id', '=', $id)->delete();

        return ResponseHelper::success($response, '工单删除成功');
    }

    /**
     * 后台工单页面 Ajax
     */
    public function ajax(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $tickets = (new Ticket())->orderBy('id', 'desc')->get();

        $total = 0;
        $open = 0;
        $closed = 0;
        $waitAdmin = 0;

        foreach ($tickets as $ticket) {
            $total++;

            if ($ticket->status === 'closed') {
                $closed++;
            } else {
                $open++;
            }

            if ($ticket->status === 'open_wait_admin') {
                $waitAdmin++;
            }

            $ticket->op =
                '<div class="lmn-act-wrap">' .
                    '<a class="lmn-act-btn lmn-act-btn--edit" href="/admin/ticket/' . $ticket->id . '/view" title="View">' .
                        '<span class="material-symbols-outlined">visibility</span>' .
                    '</a>';

            if ($ticket->status !== 'closed') {
                $ticket->op .=
                    '<button class="lmn-act-btn lmn-act-btn--warn" onclick="closeTicket(' . $ticket->id . ')" title="Close">' .
                        '<span class="material-symbols-outlined">cancel</span>' .
                    '</button>';
            }

            $ticket->op .=
                    '<button class="lmn-act-btn lmn-act-btn--del" onclick="deleteTicket(' . $ticket->id . ')" title="Delete">' .
                        '<span class="material-symbols-outlined">delete</span>' .
                    '</button>' .
                '</div>';

            $ticket->status = match ($ticket->status) {
                'closed' => '<span class="lmn-badge lmn-badge--status_closed">Closed</span>',
                'open_wait_user' => '<span class="lmn-badge lmn-badge--status_open_wait_user">Waiting for User</span>',
                'open_wait_admin' => '<span class="lmn-badge lmn-badge--status_open_wait_admin">Waiting for Admin</span>',
                default => '<span class="lmn-badge lmn-badge--inactive">Unknown</span>',
            };

            $ticket->type = match ($ticket->type) {
                'howto' => '<span class="lmn-badge lmn-badge--type_howto">Usage Guide</span>',
                'billing' => '<span class="lmn-badge lmn-badge--type_billing">Payment</span>',
                'account' => '<span class="lmn-badge lmn-badge--type_account">Account</span>',
                default => '<span class="lmn-badge lmn-badge--type_other">Other</span>',
            };

            $ticket->datetime = Tools::toDateTime((int) $ticket->datetime);
        }

        return $response->withJson([
            'tickets'    => $tickets,
            'total'      => $total,
            'open'       => $open,
            'closed'     => $closed,
            'wait_admin' => $waitAdmin,
        ]);
    }
}
