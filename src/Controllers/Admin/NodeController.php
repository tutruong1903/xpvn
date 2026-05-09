<?php

declare(strict_types=1);

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\Config;
use App\Models\Node;
use App\Services\I18n;
use App\Services\Notification;
use App\Utils\Tools;
use GuzzleHttp\Exception\GuzzleException;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;
use Smarty\Exception as SmartyException;
use Telegram\Bot\Exceptions\TelegramSDKException;
use function json_decode;
use function json_encode;
use function round;
use function str_replace;
use function trim;

final class NodeController extends BaseController
{
    private static array $details = [
        'field' => [
            'op' => '操作',
            'id' => '节点ID',
            'name' => '名称',
            'server' => '地址',
            'type' => '状态',
            'sort' => '类型',
            'traffic_rate' => '倍率',
            'is_dynamic_rate' => '动态倍率',
            'dynamic_rate_type' => '动态倍率计算方式',
            'node_class' => '等级',
            'node_group' => '组别',
            'node_bandwidth_limit' => '流量限制/GB',
            'node_bandwidth' => '已用流量/GB',
            'bandwidthlimit_resetday' => '重置日',
        ],
        'filter' => [
            [
                'field'      => 'type',
                'label'      => '状态',
                'label_key'  => 'filter.type_label',
                'i18n_ns'    => 'node',
                'values'     => ['' => '全部', '显示' => '显示', '隐藏' => '隐藏'],
                'value_keys' => ['' => 'filter.all', '显示' => 'filter.visible', '隐藏' => 'filter.hidden'],
            ],
            [
                'field'      => 'sort',
                'label'      => '协议',
                'label_key'  => 'filter.sort_label',
                'i18n_ns'    => 'node',
                'values'     => [
                    ''              => '全部',
                    'Shadowsocks'   => 'Shadowsocks',
                    'Shadowsocks2022' => 'Shadowsocks2022',
                    'TUIC'          => 'TUIC',
                    'WireGuard'     => 'WireGuard',
                    'Vmess'         => 'Vmess',
                    'Trojan'        => 'Trojan',
                ],
                'value_keys' => ['' => 'filter.all'],
            ],
        ],
    ];

    private static array $update_field = [
        'name',
        'server',
        'traffic_rate',
        'is_dynamic_rate',
        'dynamic_rate_type',
        'max_rate',
        'max_rate_time',
        'min_rate',
        'min_rate_time',
        'node_group',
        'node_speedlimit',
        'sort',
        'node_class',
        'node_bandwidth_limit',
        'bandwidthlimit_resetday',
    ];

    /**
     * 后台节点页面
     *
     * @throws SmartyException
     */
    public function index(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        return $response->write(
            $this->view()
                ->assign('details', self::$details)
                ->fetch('admin/node/index.tpl')
        );
    }

    /**
     * 后台创建节点页面
     *
     * @throws SmartyException
     */
    public function create(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        return $response->write(
            $this->view()
                ->assign('update_field', self::$update_field)
                ->fetch('admin/node/create.tpl')
        );
    }

    /**
     * 后台添加节点
     */
    public function add(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $node = new Node();

        $node->name = $request->getParam('name');
        $node->node_group = $request->getParam('node_group');
        $node->server = trim($request->getParam('server'));
        $node->traffic_rate = $request->getParam('traffic_rate') ?? 1;
        $node->is_dynamic_rate = $request->getParam('is_dynamic_rate') === 'true' ? 1 : 0;
        $node->dynamic_rate_type = $request->getParam('dynamic_rate_type') ?? 0;
        $node->dynamic_rate_config = json_encode([
            'max_rate' => $request->getParam('max_rate') ?? 1,
            'max_rate_time' => $request->getParam('max_rate_time') ?? 22,
            'min_rate' => $request->getParam('min_rate') ?? 1,
            'min_rate_time' => $request->getParam('min_rate_time') ?? 3,
        ]);

        $custom_config = $request->getParam('custom_config') ?? '{}';

        if ($custom_config !== '') {
            $node->custom_config = $custom_config;
        } else {
            $node->custom_config = '{}';
        }

        $node->node_speedlimit = $request->getParam('node_speedlimit');
        $node->type = $request->getParam('type') === 'true' ? 1 : 0;
        $node->sort = $request->getParam('sort');
        $node->node_class = $request->getParam('node_class');
        $node->node_bandwidth_limit = Tools::gbToB($request->getParam('node_bandwidth_limit'));
        $node->bandwidthlimit_resetday = $request->getParam('bandwidthlimit_resetday');
        $node->password = Tools::genRandomChar(32);

        $locale = $this->getLocale();

        if (! $node->save()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_node.add_failed', $locale),
            ]);
        }

        if (Config::obtain('im_bot_group_notify_add_node')) {
            try {
                Notification::notifyUserGroup(
                    str_replace(
                        '%node_name%',
                        $request->getParam('name'),
                        I18n::trans('bot.node_added', $_ENV['locale'])
                    )
                );
            } catch (TelegramSDKException | GuzzleException) {
                return $response->withJson([
                    'ret' => 1,
                    'msg' => I18n::trans('admin_node.add_success_bot_failed', $locale),
                    'node_id' => $node->id,
                ]);
            }
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_node.add_success', $locale),
            'node_id' => $node->id,
        ]);
    }

    /**
     * 后台编辑指定节点页面
     *
     * @throws SmartyException
     */
    public function edit(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $node = (new Node())->find($args['id']);

        $dynamic_rate_config = json_decode($node->dynamic_rate_config);
        $node->max_rate = $dynamic_rate_config?->max_rate ?? 1;
        $node->max_rate_time = $dynamic_rate_config?->max_rate_time ?? 22;
        $node->min_rate = $dynamic_rate_config?->min_rate ?? 1;
        $node->min_rate_time = $dynamic_rate_config?->min_rate_time ?? 3;

        $node->node_bandwidth = Tools::autoBytes($node->node_bandwidth);
        $node->node_bandwidth_limit = Tools::bToGB($node->node_bandwidth_limit);

        return $response->write(
            $this->view()
                ->assign('node', $node)
                ->assign('update_field', self::$update_field)
                ->fetch('admin/node/edit.tpl')
        );
    }

    /**
     * 后台更新指定节点内容
     */
    public function update(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $node = (new Node())->find($args['id']);

        $node->name = $request->getParam('name');
        $node->node_group = $request->getParam('node_group') ?? 0;
        $node->server = trim($request->getParam('server'));
        $node->traffic_rate = $request->getParam('traffic_rate') ?? 1;
        $node->is_dynamic_rate = $request->getParam('is_dynamic_rate') === 'true' ? 1 : 0;
        $node->dynamic_rate_type = $request->getParam('dynamic_rate_type') ?? 0;
        $node->dynamic_rate_config = json_encode([
            'max_rate' => $request->getParam('max_rate') ?? 1,
            'max_rate_time' => $request->getParam('max_rate_time') ?? 0,
            'min_rate' => $request->getParam('min_rate') ?? 1,
            'min_rate_time' => $request->getParam('min_rate_time') ?? 0,
        ]);

        $custom_config = $request->getParam('custom_config') ?? '{}';

        if ($custom_config !== '') {
            $node->custom_config = $custom_config;
        } else {
            $node->custom_config = '{}';
        }

        $node->node_speedlimit = $request->getParam('node_speedlimit');
        $node->type = $request->getParam('type') === 'true' ? 1 : 0;
        $node->sort = $request->getParam('sort');
        $node->node_class = $request->getParam('node_class');
        $node->node_bandwidth_limit = Tools::gbToB($request->getParam('node_bandwidth_limit'));
        $node->bandwidthlimit_resetday = $request->getParam('bandwidthlimit_resetday');

        $locale = $this->getLocale();

        if (! $node->save()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_node.update_failed', $locale),
            ]);
        }

        if (Config::obtain('im_bot_group_notify_update_node')) {
            try {
                Notification::notifyUserGroup(
                    str_replace(
                        '%node_name%',
                        $request->getParam('name'),
                        I18n::trans('bot.node_updated', $_ENV['locale'])
                    )
                );
            } catch (TelegramSDKException | GuzzleException) {
                return $response->withJson([
                    'ret' => 1,
                    'msg' => I18n::trans('admin_node.update_success_bot_failed', $locale),
                ]);
            }
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_node.update_success', $locale),
        ]);
    }

    public function resetPassword(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $node = (new Node())->find($args['id']);
        $node->password = Tools::genRandomChar(32);
        $node->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_node.reset_password_success', $this->getLocale()),
            'password' => $node->password,
        ]);
    }

    public function resetBandwidth(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $node = (new Node())->find($args['id']);
        $node->node_bandwidth = 0;
        $node->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_node.reset_bandwidth_success', $this->getLocale()),
        ]);
    }

    /**
     * 后台删除指定节点
     */
    public function delete(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $node = (new Node())->find($args['id']);

        $locale = $this->getLocale();

        if (! $node->delete()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_node.delete_failed', $locale),
            ]);
        }

        if (Config::obtain('im_bot_group_notify_delete_node')) {
            try {
                Notification::notifyUserGroup(
                    str_replace(
                        '%node_name%',
                        $node->name,
                        I18n::trans('bot.node_deleted', $_ENV['locale'])
                    )
                );
            } catch (TelegramSDKException | GuzzleException) {
                return $response->withJson([
                    'ret' => 1,
                    'msg' => I18n::trans('admin_node.delete_success_bot_failed', $locale),
                ]);
            }
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_node.delete_success', $locale),
        ]);
    }

    public function copy($request, $response, $args)
    {
        $old_node = (new Node())->find($args['id']);
        $new_node = $old_node->replicate([
            'node_bandwidth',
        ]);
        $new_node->name .= ' (副本)';
        $new_node->node_bandwidth = 0;
        $new_node->password = Tools::genRandomChar(32);

        $locale = $this->getLocale();

        if (! $new_node->save()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_node.copy_failed', $locale),
            ]);
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_node.copy_success', $locale),
        ]);
    }

    /**
     * 后台节点页面 AJAX
     */
    public function ajax(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $nodes = (new Node())->orderBy('id', 'desc')->get();

        $total  = 0;
        $online = 0;
        $hidden = 0;
        $totalBandwidthBytes = 0;

        foreach ($nodes as $node) {
            $total++;
            if ($node->getNodeOnlineStatus() === 1) {
                $online++;
            }
            if ($node->type === 0) {
                $hidden++;
            }
            $totalBandwidthBytes += $node->node_bandwidth;

            $node->op =
                '<div class="lmn-act-wrap">' .
                    '<a class="lmn-act-btn lmn-act-btn--edit" href="/admin/node/' . $node->id . '/edit" title="Edit">' .
                        '<span class="material-symbols-outlined">edit</span>' .
                    '</a>' .
                    '<button class="lmn-act-btn lmn-act-btn--warn" onclick="copyNode(' . $node->id . ')" title="Copy">' .
                        '<span class="material-symbols-outlined">content_copy</span>' .
                    '</button>' .
                    '<button class="lmn-act-btn lmn-act-btn--del" onclick="deleteNode(' . $node->id . ')" title="Delete">' .
                        '<span class="material-symbols-outlined">delete</span>' .
                    '</button>' .
                '</div>';

            $node->type = $node->type
                ? '<span class="lmn-badge lmn-badge--active">Visible</span>'
                : '<span class="lmn-badge lmn-badge--inactive">Hidden</span>';

            $node->sort = $node->sort();

            $node->is_dynamic_rate = $node->is_dynamic_rate
                ? '<span class="lmn-badge lmn-badge--class-premium">On</span>'
                : '<span class="lmn-badge lmn-badge--inactive">Off</span>';

            $node->dynamic_rate_type = $node->dynamicRateType();
            $node->node_bandwidth = round(Tools::bToGB($node->node_bandwidth), 2);
            $node->node_bandwidth_limit = Tools::bToGB($node->node_bandwidth_limit);
        }

        return $response->withJson([
            'nodes'            => $nodes,
            'total'            => $total,
            'online'           => $online,
            'hidden'           => $hidden,
            'total_bandwidth'  => round(Tools::bToGB($totalBandwidthBytes), 2),
        ]);
    }
}
