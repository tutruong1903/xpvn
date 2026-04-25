<?php

declare(strict_types=1);

namespace App\Controllers\Admin;

use App\Controllers\AuthController;
use App\Controllers\BaseController;
use App\Models\Config;
use App\Models\User;
use App\Models\UserMoneyLog;
use App\Services\I18n;
use App\Utils\Hash;
use App\Utils\Tools;
use Exception;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;

final class UserController extends BaseController
{
    private static array $details = [
        'field' => [
            'op'        => 'Thao tác',
            'id'        => 'ID',
            'user_name' => 'Biệt danh',
            'email'     => 'Email',
            'money'     => 'Số dư',
            'class'     => 'Cấp bậc',
            'is_admin'  => 'Admin?',
            'is_banned' => 'Trạng thái',
            'reg_date'  => 'Ngày tạo',
        ],
        'filter' => [
            [
                'field'  => 'is_admin',
                'label'  => 'Loại tài khoản',
                'values' => [
                    ''             => 'Tất cả',
                    'check_circle' => 'Admin',
                    'cancel'       => 'User',
                ],
            ],
            [
                'field'  => 'is_banned',
                'label'  => 'Trạng thái',
                'values' => [
                    ''         => 'Tất cả',
                    'Active'   => 'Active',
                    'Banned'   => 'Banned',
                    'Inactive' => 'Inactive',
                ],
            ],
        ],
        'create_dialog' => [
            [
                'id' => 'email',
                'info' => '登录邮箱',
                'type' => 'input',
                'placeholder' => '',
            ],
            [
                'id' => 'password',
                'info' => '登录密码',
                'type' => 'input',
                'placeholder' => '留空则随机生成',
            ],
            [
                'id' => 'ref_by',
                'info' => '邀请人',
                'type' => 'input',
                'placeholder' => '邀请人的用户id，可留空',
            ],
            [
                'id' => 'balance',
                'info' => '账户余额',
                'type' => 'input',
                'placeholder' => '-1为按默认设置，其他为指定值',
            ],
        ],
    ];

    private static array $update_field = [
        'email',
        'user_name',
        'pass',
        'money',
        'ref_by',
        'port',
        'method',
        'transfer_enable',
        'node_group',
        'class',
        'class_expire',
        'auto_reset_day',
        'auto_reset_bandwidth',
        'node_speedlimit',
        'node_iplimit',
        'locale',
        'banned_reason',
        'remark',
    ];

    /**
     * @throws Exception
     */
    public function index(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        return $response->write(
            $this->view()
                ->assign('details', self::$details)
                ->fetch('admin/user/index.tpl')
        );
    }

    /**
     * @throws Exception
     */
    public function create(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $email = $request->getParam('email');
        $ref_by = $request->getParam('ref_by');
        $password = $request->getParam('password');
        $balance = $request->getParam('balance');

        $locale = $this->getLocale();

        if ($email === '') {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_user.create_email_empty', $locale),
            ]);
        }

        $exist = (new User())->where('email', $email)->first();

        if ($exist !== null) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_user.create_email_exists', $locale),
            ]);
        }

        if ($password === '') {
            $password = Tools::genRandomChar(16);
        }

        (new AuthController())->registerHelper(
            $response,
            'user',
            $email,
            $password,
            '',
            0,
            '',
            $balance,
            1
        );
        $user = (new User())->where('email', $email)->first();

        if ($ref_by !== '') {
            $user->ref_by = (int) $ref_by;
            $user->save();
        }

        $msg = str_replace(
            ['%email%', '%password%'],
            [$email, $password],
            I18n::trans('admin_user.create_success', $locale)
        );

        return $response->withJson([
            'ret' => 1,
            'msg' => $msg,
        ]);
    }

    /**
     * @throws Exception
     */
    public function edit(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $user = (new User())->find($args['id']);
        $user->last_use_time = Tools::toDateTime($user->last_use_time);
        $user->last_check_in_time = Tools::toDateTime($user->last_check_in_time);
        $user->last_login_time = Tools::toDateTime($user->last_login_time);

        return $response->write(
            $this->view()
                ->assign('update_field', self::$update_field)
                ->assign('edit_user', $user)
                ->assign('ss_methods', Tools::getSsMethod())
                ->assign('locales', I18n::getLocaleList())
                ->fetch('admin/user/edit.tpl')
        );
    }

    public function update(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = (int) $args['id'];
        $user = (new User())->find($id);

        if ($request->getParam('pass') !== '' && $request->getParam('pass') !== null) {
            $user->pass = Hash::passwordHash($request->getParam('pass'));

            if (Config::obtain('enable_forced_replacement')) {
                $user->removeLink();
            }
        }

        if ($request->getParam('money') !== '' &&
            $request->getParam('money') !== null &&
            (float) $request->getParam('money') !== (float) $user->money
        ) {
            $money = (float) $request->getParam('money');
            $diff = $money - $user->money;
            $remark = ($diff > 0 ? '管理员添加余额' : '管理员扣除余额');
            (new UserMoneyLog())->add($id, (float) $user->money, $money, $diff, $remark);
            $user->money = $money;
        }

        $user->email = $request->getParam('email');
        $user->user_name = $request->getParam('user_name');
        $user->ref_by = $request->getParam('ref_by');
        $user->port = $request->getParam('port');
        $user->method = $request->getParam('method');
        $user->transfer_enable = Tools::autoBytesR($request->getParam('transfer_enable') ?? '0B');
        $user->node_group = $request->getParam('node_group');
        $user->class = $request->getParam('class');
        $user->class_expire = $request->getParam('class_expire');
        $user->auto_reset_day = $request->getParam('auto_reset_day');
        $user->auto_reset_bandwidth = $request->getParam('auto_reset_bandwidth');
        $user->node_speedlimit = $request->getParam('node_speedlimit');
        $user->node_iplimit = $request->getParam('node_iplimit');
        $user->locale = $request->getParam('locale');
        $user->is_admin = $request->getParam('is_admin') === 'true' ? 1 : 0;
        $user->is_shadow_banned = $request->getParam('is_shadow_banned') === 'true' ? 1 : 0;
        $user->is_banned = $request->getParam('is_banned') === 'true' ? 1 : 0;
        $user->banned_reason = $request->getParam('banned_reason');
        $user->remark = $request->getParam('remark');

        $locale = $this->getLocale();

        if (! $user->save()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_user.update_failed', $locale),
            ]);
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_user.update_success', $locale),
        ]);
    }

    public function delete(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $args['id'];
        $user = (new User())->find((int) $id);

        $locale = $this->getLocale();

        if (! $user->kill()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_user.delete_failed', $locale),
            ]);
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_user.delete_success', $locale),
        ]);
    }

    public function ajax(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $users     = (new User())->orderBy('id', 'desc')->get();
        $total     = $users->count();
        $active    = $users->where('is_banned', 0)->count();
        $banned    = $users->where('is_banned', 1)->count();
        $admins    = $users->where('is_admin', 1)->count();

        foreach ($users as $user) {
            $user->op =
                '<div class="lmn-act-wrap">' .
                    '<a class="lmn-act-btn lmn-act-btn--edit" href="/admin/user/' . $user->id . '/edit" title="编辑">' .
                        '<span class="material-symbols-outlined">edit</span>' .
                    '</a>' .
                    '<button class="lmn-act-btn lmn-act-btn--del" onclick="deleteUser(' . $user->id . ')" title="删除">' .
                        '<span class="material-symbols-outlined">delete</span>' .
                    '</button>' .
                '</div>';

            $user->transfer_enable = $user->enableTraffic();
            $user->transfer_used   = $user->usedTraffic();

            $classLevel = (int) $user->class;
            $classMap   = [0 => ['Basic', 'lmn-badge--class-basic'], 1 => ['Standard', 'lmn-badge--class-std'], 2 => ['Premium', 'lmn-badge--class-premium']];
            [$classLabel, $classStyle] = $classMap[$classLevel] ?? ['VIP ' . $classLevel, 'lmn-badge--class-vip'];
            $user->class = '<span class="lmn-badge ' . $classStyle . '">' . $classLabel . '</span>';

            $user->money = '<span class="lmn-money' . ($user->money > 0 ? ' lmn-money--positive' : '') . '">$' . number_format((float) $user->money, 2) . '</span>';

            $user->is_admin = (int) $user->is_admin === 1
                ? '<span class="material-symbols-outlined lmn-icon--yes" style="font-variation-settings:\'FILL\' 1">check_circle</span>'
                : '<span class="material-symbols-outlined lmn-icon--no">cancel</span>';

            if ((int) $user->is_banned === 1) {
                $user->is_banned = '<span class="lmn-badge lmn-badge--banned">Banned</span>';
            } elseif ((int) $user->is_inactive === 1) {
                $user->is_banned = '<span class="lmn-badge lmn-badge--inactive">Inactive</span>';
            } else {
                $user->is_banned = '<span class="lmn-badge lmn-badge--active">Active</span>';
            }

            $user->is_inactive = (int) $user->is_inactive === 1
                ? '<span class="lmn-badge lmn-badge--inactive">Yes</span>'
                : '<span class="lmn-badge lmn-badge--active">No</span>';

            /* Format reg_date to human-readable */
            if ($user->reg_date) {
                $user->reg_date = date('d/m/Y', strtotime((string) $user->reg_date));
            }
        }

        return $response->withJson([
            'users'  => $users,
            'total'  => $total,
            'active' => $active,
            'banned' => $banned,
            'admins' => $admins,
        ]);
    }
}
