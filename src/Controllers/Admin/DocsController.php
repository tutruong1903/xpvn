<?php

declare(strict_types=1);

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\Docs;
use App\Services\I18n;
use App\Services\LLM;
use App\Utils\Tools;
use Exception;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;
use function time;

final class DocsController extends BaseController
{
    private static array $details = [
        'field' => [
            'op' => '操作',
            'id' => 'ID',
            'status' => '状态',
            'sort' => '排序',
            'date' => '日期',
            'title' => '标题',
        ],
        'filter' => [
            [
                'field'      => 'status',
                'label'      => '状态',
                'label_key'  => 'filter.status_label',
                'i18n_ns'    => 'docs',
                'values'     => ['' => '全部', 'Published' => '已发布', 'Draft' => '未发布'],
                'value_keys' => ['' => 'filter.all', 'Published' => 'filter.published', 'Draft' => 'filter.draft'],
            ],
        ],
    ];

    private static array $update_field = [
        'status',
        'sort',
        'title',
    ];

    /**
     * 后台文档页面
     *
     * @throws Exception
     */
    public function index(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        return $response->write(
            $this->view()
                ->assign('details', self::$details)
                ->fetch('admin/docs/index.tpl')
        );
    }

    /**
     * 后台文档创建页面
     *
     * @throws Exception
     */
    public function create(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        return $response->write(
            $this->view()
                ->assign('update_field', self::$update_field)
                ->fetch('admin/docs/create.tpl')
        );
    }

    /**
     * 后台添加文档
     */
    public function add(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $status = (int) $request->getParam('status');
        $sort = (int) $request->getParam('sort');
        $title = $request->getParam('title');
        $content = $request->getParam('content');

        $locale = $this->getLocale();

        if ($title === '' || $content === '') {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_docs.title_content_empty', $locale),
            ]);
        }

        $doc = new Docs();
        $doc->status = in_array($status, [0, 1]) ? $status : 1;
        $doc->sort = $sort > 999 || $sort < 0 ? 0 : $sort;
        $doc->date = Tools::toDateTime(time());
        $doc->title = $title;
        $doc->content = $content;

        if (! $doc->save()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_docs.add_failed', $locale),
            ]);
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_docs.add_success', $locale),
        ]);
    }

    /**
     * 使用LLM生成文档
     *
     * @param ServerRequest $request
     * @param Response $response
     * @param array $args
     *
     * @return ResponseInterface
     */
    public function generate(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $content = LLM::genTextResponse($request->getParam('question'));

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_docs.generate_success', $this->getLocale()),
            'content' => $content,
        ]);
    }

    /**
     * 文档编辑页面
     *
     * @throws Exception
     */
    public function edit(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $doc = (new Docs())->find($args['id']);

        return $response->write(
            $this->view()
                ->assign('doc', $doc)
                ->assign('update_field', self::$update_field)
                ->fetch('admin/docs/edit.tpl')
        );
    }

    /**
     * 后台编辑文档提交
     */
    public function update(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $status = (int) $request->getParam('status');
        $sort = (int) $request->getParam('sort');
        $title = $request->getParam('title');
        $content = $request->getParam('content');

        $locale = $this->getLocale();

        if ($title === '' || $content === '') {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_docs.title_content_empty', $locale),
            ]);
        }

        $doc = (new Docs())->find($args['id']);

        if ($doc === null) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_docs.not_found', $locale),
            ]);
        }

        $doc->status = in_array($status, [0, 1]) ? $status : 1;
        $doc->sort = $sort > 999 || $sort < 0 ? 0 : $sort;
        $doc->title = $request->getParam('title');
        $doc->content = $request->getParam('content');
        $doc->date = Tools::toDateTime(time());

        if (! $doc->save()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_docs.update_failed', $locale),
            ]);
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_docs.update_success', $locale),
        ]);
    }

    /**
     * 后台删除文档
     */
    public function delete(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $doc = (new Docs())->find($args['id']);

        $locale = $this->getLocale();

        if (! $doc->delete()) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_docs.delete_failed', $locale),
            ]);
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_docs.delete_success', $locale),
        ]);
    }

    /**
     * 后台文档页面 AJAX
     */
    public function ajax(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $docs = (new Docs())->orderBy('id')->get();

        $total = 0;
        $published = 0;
        $draft = 0;

        foreach ($docs as $doc) {
            $total++;

            if ($doc->status === 1) {
                $published++;
            } else {
                $draft++;
            }

            $doc->op =
                '<div class="lmn-act-wrap">' .
                    '<a class="lmn-act-btn lmn-act-btn--edit" href="/admin/docs/' . $doc->id . '/edit" title="Edit">' .
                        '<span class="material-symbols-outlined">edit</span>' .
                    '</a>' .
                    '<button class="lmn-act-btn lmn-act-btn--del" onclick="deleteDoc(' . $doc->id . ')" title="Delete">' .
                        '<span class="material-symbols-outlined">delete</span>' .
                    '</button>' .
                '</div>';

            $doc->status = match ($doc->status) {
                1 => '<span class="lmn-badge lmn-badge--status_published">Published</span>',
                0 => '<span class="lmn-badge lmn-badge--status_draft">Draft</span>',
                default => '<span class="lmn-badge lmn-badge--status_unknown">Unknown</span>',
            };
        }

        return $response->withJson([
            'docs'      => $docs,
            'total'     => $total,
            'published' => $published,
            'draft'     => $draft,
        ]);
    }
}
