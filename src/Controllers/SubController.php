<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Models\Config;
use App\Models\Link;
use App\Models\SubscribeLog;
use App\Services\RateLimit;
use App\Services\Subscribe;
use App\Utils\ResponseHelper;
use GuzzleHttp\Exception\GuzzleException;
use Psr\Http\Client\ClientExceptionInterface;
use Psr\Http\Message\ResponseInterface;
use RedisException;
use Telegram\Bot\Exceptions\TelegramSDKException;
use function error_log;
use function in_array;
use function json_encode;
use function str_contains;
use function strtotime;
use function strtolower;
use function substr;

final class SubController extends BaseController
{
    private function detectSubtype(string $userAgent): string
    {
        $ua = strtolower(substr($userAgent, 0, 20));

        if (str_contains($ua, 'hiddify') || str_contains($ua, 'sing-box') || str_contains($ua, 'sfi') || str_contains($ua, 'sfa') || str_contains($ua, 'sfm')) {
            return 'singbox';
        }

        if (str_contains($ua, 'clash') || str_contains($ua, 'stash') || str_contains($ua, 'flclash')) {
            return 'clash';
        }

        if (str_contains($ua, 'shadowrocket')) {
            return 'sip008';
        }

        if (str_contains($ua, 'v2rayng') || str_contains($ua, 'v2rayn') || str_contains($ua, 'nekoray')) {
            return 'v2ray';
        }

        if (str_contains($ua, 'trojan')) {
            return 'trojan';
        }

        return 'clash';
    }

    /**
     * @throws ClientExceptionInterface
     * @throws GuzzleException
     * @throws RedisException
     * @throws TelegramSDKException
     */
    public function universal($request, $response, $args): ResponseInterface
    {
        $headers = $request->getHeaders();
        error_log('[Universal Sub] Token: ' . ($args['token'] ?? 'N/A'));
        error_log('[Universal Sub] Headers: ' . json_encode($headers, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));

        $args['subtype'] = $this->detectSubtype($request->getHeaderLine('User-Agent'));
        error_log('[Universal Sub] Detected subtype: ' . $args['subtype']);

        return $this->index($request, $response, $args);
    }

    /**
     * @throws ClientExceptionInterface
     * @throws GuzzleException
     * @throws RedisException
     * @throws TelegramSDKException
     */
    public function index($request, $response, $args): ResponseInterface
    {
        $err_msg = 'Invalid subscription link';
        $subtype = $args['subtype'];
        $subtype_list = ['json', 'clash', 'sip008', 'singbox', 'v2rayjson', 'sip002', 'ss', 'v2ray', 'trojan'];

        if (! $_ENV['Subscribe'] ||
            ! in_array($subtype, $subtype_list) ||
            'https://' . $request->getHeaderLine('Host') !== $_ENV['subUrl']
        ) {
            return ResponseHelper::error($response, $err_msg);
        }

        $token = $this->antiXss->xss_clean($args['token']);

        if ($_ENV['enable_rate_limit'] &&
            (! (new RateLimit())->checkRateLimit('sub_ip', $request->getServerParam('REMOTE_ADDR')) ||
            ! (new RateLimit())->checkRateLimit('sub_token', $token))
        ) {
            return ResponseHelper::error($response, $err_msg);
        }

        $link = (new Link())->where('token', $token)->first();

        if ($link === null || ! $link->isValid()) {
            return ResponseHelper::error($response, $err_msg);
        }

        $user = $link->user();
        $sub_info = Subscribe::getContent($user, $subtype);

        $content_type = match ($subtype) {
            'clash' => 'application/yaml',
            'json','sip008','singbox','v2rayjson' => 'application/json',
            default => 'text/plain',
        };

        $sub_details = ' upload=' . $user->u
        . '; download=' . $user->d
        . '; total=' . $user->transfer_enable
        . '; expire=' . strtotime($user->class_expire);
        // Clash specific
        $sub_content_disposition = 'attachment; filename=' . $_ENV['appName'];
        $sub_profile_update_interval = 6;
        $sub_profile_web_page_url = $_ENV['baseUrl'];

        if (Config::obtain('subscribe_log')) {
            (new SubscribeLog())->add(
                $user,
                $subtype,
                $this->antiXss->xss_clean($request->getHeaderLine('User-Agent'))
            );
        }

        if ($subtype === 'clash') {
            return $response->withHeader('Subscription-Userinfo', $sub_details)
                ->withHeader('Content-Disposition', $sub_content_disposition)
                ->withHeader('Profile-Update-Interval', $sub_profile_update_interval)
                ->withHeader('Profile-Web-Page-Url', $sub_profile_web_page_url)
                ->withHeader('Content-Type', $content_type)
                ->write($sub_info);
        }

        return $response->withHeader('Subscription-Userinfo', $sub_details)
            ->withHeader('Content-Type', $content_type)
            ->write($sub_info);
    }
}
