<?php

declare(strict_types=1);

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\DetectRule;
use App\Services\I18n;
use Exception;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;

final class DetectRuleController extends BaseController
{
    private static array $details =
        [
            'field' => [
                'op' => '操作',
                'id' => '规则ID',
                'name' => '规则名称',
                'text' => '规则介绍',
                'regex' => '正则表达式',
                'type' => '规则类型',
            ],
            'add_dialog' => [
                [
                    'id' => 'name',
                    'info' => '规则名称',
                    'type' => 'input',
                    'placeholder' => '审计规则名称',
                ],
                [
                    'id' => 'text',
                    'info' => '规则介绍',
                    'type' => 'input',
                    'placeholder' => '简洁明了地描述审计规则',
                ],
                [
                    'id' => 'regex',
                    'info' => '正则表达式',
                    'type' => 'input',
                    'placeholder' => '用以匹配审计内容的正则表达式',
                ],
                [
                    'id' => 'type',
                    'info' => '规则类型',
                    'type' => 'select',
                    'select' => [
                        '1' => '数据包明文匹配',
                        '0' => '数据包十六进制匹配',
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
                ->fetch('admin/detect.tpl')
        );
    }

    public function add(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $rule = new DetectRule();
        $rule->name = $request->getParam('name');
        $rule->text = $request->getParam('text');
        $rule->regex = $request->getParam('regex');
        $rule->type = $request->getParam('type');

        if (! $rule->save()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_detect.add_failed', $this->getLocale()),
            ]);
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_detect.add_success', $this->getLocale()),
        ]);
    }

    public function delete(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $args['id'];
        $rule = (new DetectRule())->find($id);

        if (! $rule->delete()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_detect.delete_failed', $this->getLocale()),
            ]);
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_detect.delete_success', $this->getLocale()),
        ]);
    }

    public function ajax(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $rules = (new DetectRule())->orderBy('id', 'desc')->get();

        foreach ($rules as $rule) {
            $locale = $this->getLocale();
            $rule->op = '<button class="btn btn-red" id="delete-rule-' . $rule->id .
                '" onclick="deleteRule(' . $rule->id . ')">' . I18n::trans('admin_detect.delete_btn', $locale) . '</button>';
            $rule->type = $rule->type();
        }

        return $response->withJson([
            'rules' => $rules,
        ]);
    }
}
