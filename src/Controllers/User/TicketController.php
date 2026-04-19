<?php

declare(strict_types=1);

namespace App\Controllers\User;

use App\Controllers\BaseController;
use App\Models\Config;
use App\Models\Ticket;
use App\Services\I18n;
use App\Services\Notification;
use App\Services\RateLimit;
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
    /**
     * @throws Exception
     */
    public function index(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        if (! Config::obtain('enable_ticket')) {
            return $response->withRedirect('/user');
        }

        $tickets = (new Ticket())->where('userid', $this->user->id)->orderBy('datetime', 'desc')->get();

        foreach ($tickets as $ticket) {
            $ticket->datetime = Tools::toDateTime((int) $ticket->datetime);
        }

        return $response->write(
            $this->view()
                ->assign('tickets', $tickets)
                ->fetch('user/ticket/index.tpl')
        );
    }

    /**
     * @throws ClientExceptionInterface
     * @throws TelegramSDKException
     * @throws GuzzleException
     */
    public function add(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $locale = $this->getLocale();
        $title = $request->getParam('title') ?? '';
        $comment = $request->getParam('comment') ?? '';
        $type = $request->getParam('type') ?? '';

        if (! Config::obtain('enable_ticket') ||
            $this->user->is_shadow_banned ||
            ! (new RateLimit())->checkRateLimit('ticket', (string) $this->user->id)
        ) {
            return ResponseHelper::error($response, I18n::trans('ticket.create_failed', $locale));
        }

        if ($type === '') {
            return ResponseHelper::error($response, I18n::trans('ticket.type_required', $locale));
        }

        if ($title === '') {
            return ResponseHelper::error($response, I18n::trans('ticket.title_required', $locale));
        }

        if ($comment === '') {
            return ResponseHelper::error($response, I18n::trans('ticket.comment_required', $locale));
        }

        $content = [
            [
                'comment_id' => 0,
                'commenter_type' => 'user',
                'commenter_name' => $this->user->user_name,
                'comment' => $this->antiXss->xss_clean($comment),
                'datetime' => time(),
            ],
        ];

        $ticket = new Ticket();
        $ticket->title = $this->antiXss->xss_clean($title);
        $ticket->content = json_encode($content);
        $ticket->userid = $this->user->id;
        $ticket->datetime = time();
        $ticket->status = 'open_wait_admin';
        $ticket->type = $this->antiXss->xss_clean($type);
        $ticket->save();

        if (Config::obtain('mail_ticket')) {
            Notification::notifyAdmin(
                $_ENV['appName'] . '-新工单被开启',
                '管理员，有人开启了新的工单，请你及时处理。'
            );
        }

        return $response->withHeader('HX-Redirect', '/user/ticket/' . $ticket->id . '/view');
    }

    /**
     * @throws GuzzleException
     * @throws TelegramSDKException
     * @throws ClientExceptionInterface
     */
    public function reply(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $locale = $this->getLocale();
        $id = $args['id'];
        $comment = $request->getParam('comment') ?? '';

        if (! Config::obtain('enable_ticket') ||
            $this->user->is_shadow_banned
        ) {
            return ResponseHelper::error($response, I18n::trans('ticket.reply_failed', $locale));
        }

        if ($comment === '') {
            return ResponseHelper::error($response, I18n::trans('ticket.comment_required', $locale));
        }

        $ticket = (new Ticket())->where('id', $id)->where('userid', $this->user->id)->first();

        if ($ticket === null) {
            return ResponseHelper::error($response, I18n::trans('ticket.not_found', $locale));
        }

        $content_old = json_decode($ticket->content, true);
        $content_new = [
            [
                'comment_id' => $content_old[count($content_old) - 1]['comment_id'] + 1,
                'commenter_type' => 'user',
                'commenter_name' => $this->user->user_name,
                'comment' => $this->antiXss->xss_clean($comment),
                'datetime' => time(),
            ],
        ];

        $ticket->content = json_encode(array_merge($content_old, $content_new));
        $ticket->status = 'open_wait_admin';
        $ticket->save();

        if (Config::obtain('mail_ticket')) {
            Notification::notifyAdmin(
                $_ENV['appName'] . '-工单被回复',
                '管理员，有人回复了 <a href="' .
                $_ENV['baseUrl'] . '/admin/ticket/' . $ticket->id . '/view">#' . $ticket->id .
                '</a> 工单，请你及时处理。'
            );
        }

        return $response->withHeader('HX-Refresh', 'true');
    }

    /**
     * @throws Exception
     */
    public function detail(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        if (! Config::obtain('enable_ticket')) {
            return $response->withRedirect('/user');
        }

        $id = $args['id'];
        $ticket = (new Ticket())->where('id', '=', $id)->where('userid', $this->user->id)->first();

        if ($ticket === null) {
            return $response->withRedirect('/user/ticket');
        }

        $comments = json_decode($ticket->content);

        foreach ($comments as $comment) {
            $comment->comment = nl2br($comment->comment);
            $comment->datetime = Tools::toDateTime((int) $comment->datetime);
        }

        $ticket->status = $ticket->status();
        $ticket->type = $ticket->type();
        $ticket->datetime = Tools::toDateTime((int) $ticket->datetime);

        return $response->write(
            $this->view()
                ->assign('ticket', $ticket)
                ->assign('comments', $comments)
                ->fetch('user/ticket/view.tpl')
        );
    }
}
