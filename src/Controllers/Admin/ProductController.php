<?php

declare(strict_types=1);

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\Product;
use App\Services\I18n;
use App\Utils\Tools;
use Exception;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;
use function json_decode;
use function json_encode;
use function time;

final class ProductController extends BaseController
{
    private static array $details = [
        'field' => [
            'op' => '操作',
            'id' => '商品ID',
            'type' => '类型',
            'name' => '名称',
            'price' => '售价',
            'status' => '销售状态',
            'create_time' => '创建时间',
            'update_time' => '更新时间',
            'sale_count' => '累计销售',
            'stock' => '库存',
        ],
        'filter' => [
            [
                'field'      => 'status',
                'label'      => 'Status',
                'label_key'  => 'filter.status_label',
                'i18n_ns'    => 'product',
                'values'     => ['' => 'All', 'Active' => 'Active', 'Inactive' => 'Inactive'],
                'value_keys' => ['' => 'filter.all', 'Active' => 'filter.active', 'Inactive' => 'filter.inactive'],
            ],
            [
                'field'      => 'type',
                'label'      => 'Type',
                'label_key'  => 'filter.type_label',
                'i18n_ns'    => 'product',
                'values'     => [
                    ''             => 'All',
                    'Time+Traffic' => 'Time+Traffic',
                    'Time'         => 'Time',
                    'Bandwidth'    => 'Bandwidth',
                ],
                'value_keys' => [
                    ''             => 'filter.all',
                    'Time+Traffic' => 'filter.type_tabp',
                    'Time'         => 'filter.type_time',
                    'Bandwidth'    => 'filter.type_bandwidth',
                ],
            ],
        ],
    ];

    private static array $update_field = [
        'type',
        'name',
        'price',
        'status',
        'stock',
        'time',
        'bandwidth',
        'class',
        'class_time',
        'node_group',
        'speed_limit',
        'ip_limit',
        'class_required',
        'node_group_required',
    ];

    private static string $invalid_data_msg = 'admin_product.invalid_data';

    /**
     * @throws Exception
     */
    public function index(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        return $response->write(
            $this->view()
                ->assign('details', self::$details)
                ->fetch('admin/product/index.tpl')
        );
    }

    /**
     * @throws Exception
     */
    public function create(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        return $response->write(
            $this->view()
                ->assign('update_field', self::$update_field)
                ->fetch('admin/product/create.tpl')
        );
    }

    /**
     * @throws Exception
     */
    public function edit(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $id = $args['id'];
        $product = (new Product())->find($id);
        $content = json_decode($product->content);
        $limit = json_decode($product->limit);

        $content->time = $content->time ?? 0;
        $content->class = $content->class ?? 0;
        $content->class_time = $content->class_time ?? 0;
        $content->bandwidth = $content->bandwidth ?? 0;
        $content->node_group = $content->node_group ?? 0;
        $content->speed_limit = $content->speed_limit ?? 0;
        $content->ip_limit = $content->ip_limit ?? 0;

        return $response->write(
            $this->view()
                ->assign('product', $product)
                ->assign('content', $content)
                ->assign('limit', $limit)
                ->assign('update_field', self::$update_field)
                ->fetch('admin/product/edit.tpl')
        );
    }

    public function add(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        // base product
        $type = $request->getParam('type') ?? '';
        $name = $request->getParam('name') ?? '';
        $price = $request->getParam('price') ?? 0;
        $status = $request->getParam('status') ?? 1;
        $stock = $request->getParam('stock') ?? -1;
        // content
        $time = $request->getParam('time') ?? 0;
        $bandwidth = $request->getParam('bandwidth') ?? 0;
        $class = $request->getParam('class') ?? 0;
        $class_time = $request->getParam('class_time') ?? 0;
        $node_group = $request->getParam('node_group') ?? 0;
        $speed_limit = $request->getParam('speed_limit') ?? 0;
        $ip_limit = $request->getParam('ip_limit') ?? 0;
        // limit
        $class_required = $request->getParam('class_required') ?? '';
        $node_group_required = $request->getParam('node_group_required') ?? '';
        $new_user_required = $request->getParam('new_user_required') === 'true' ? 1 : 0;

        $product = new Product();

        if ($price < 0) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans(self::$invalid_data_msg, $this->getLocale()),
            ]);
        }

        if ($type === 'tabp') {
            if ($time <= 0 || $class_time <= 0 || $bandwidth <= 0) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans(self::$invalid_data_msg, $this->getLocale()),
                ]);
            }

            $content = [
                'time' => $time,
                'bandwidth' => $bandwidth,
                'class' => $class,
                'class_time' => $class_time,
                'node_group' => $node_group,
                'speed_limit' => $speed_limit,
                'ip_limit' => $ip_limit,
            ];
        } elseif ($type === 'time') {
            if ($time <= 0 || $class_time === '' || $class_time <= 0) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans(self::$invalid_data_msg, $this->getLocale()),
                ]);
            }

            $content = [
                'time' => $time,
                'class' => $class,
                'class_time' => $class_time,
                'node_group' => $node_group,
                'speed_limit' => $speed_limit,
                'ip_limit' => $ip_limit,
            ];
        } elseif ($type === 'bandwidth') {
            if ($bandwidth <= 0) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans(self::$invalid_data_msg, $this->getLocale()),
                ]);
            }

            $content = [
                'bandwidth' => $bandwidth,
            ];
        } else {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans(self::$invalid_data_msg, $this->getLocale()),
            ]);
        }

        $limit = [
            'class_required' => $class_required,
            'node_group_required' => $node_group_required,
            'new_user_required' => $new_user_required,
        ];

        $product->type = $type;
        $product->name = $name;
        $product->price = $price;
        $product->content = json_encode($content);
        $product->limit = json_encode($limit);
        $product->status = $status;
        $product->create_time = time();
        $product->update_time = time();
        $product->sale_count = 0;
        $product->stock = $stock;
        $product->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_product.add_success', $this->getLocale()),
        ]);
    }

    public function update(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $product_id = $args['id'];
        // base product
        $type = $request->getParam('type') ?? '';
        $name = $request->getParam('name') ?? '';
        $price = $request->getParam('price') ?? 0;
        $status = $request->getParam('status') ?? 1;
        $stock = $request->getParam('stock') ?? -1;
        // content
        $time = $request->getParam('time') ?? 0;
        $bandwidth = $request->getParam('bandwidth') ?? 0;
        $class = $request->getParam('class') ?? 0;
        $class_time = $request->getParam('class_time') ?? 0;
        $node_group = $request->getParam('node_group') ?? 0;
        $speed_limit = $request->getParam('speed_limit') ?? 0;
        $ip_limit = $request->getParam('ip_limit') ?? 0;
        // limit
        $class_required = $request->getParam('class_required') ?? '';
        $node_group_required = $request->getParam('node_group_required') ?? '';
        $new_user_required = $request->getParam('new_user_required') === 'true' ? 1 : 0;

        $product = (new Product())->find($product_id);

        if ($price < 0) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans(self::$invalid_data_msg, $this->getLocale()),
            ]);
        }

        if ($type === 'tabp') {
            if ($time <= 0 || $class_time <= 0 || $bandwidth <= 0) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans(self::$invalid_data_msg, $this->getLocale()),
                ]);
            }

            $content = [
                'time' => $time,
                'bandwidth' => $bandwidth,
                'class' => $class,
                'class_time' => $class_time,
                'node_group' => $node_group,
                'speed_limit' => $speed_limit,
                'ip_limit' => $ip_limit,
            ];
        } elseif ($type === 'time') {
            if ($time <= 0 || $class_time <= 0) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans(self::$invalid_data_msg, $this->getLocale()),
                ]);
            }

            $content = [
                'time' => $time,
                'class' => $class,
                'class_time' => $class_time,
                'node_group' => $node_group,
                'speed_limit' => $speed_limit,
                'ip_limit' => $ip_limit,
            ];
        } elseif ($type === 'bandwidth') {
            if ($bandwidth <= 0) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans(self::$invalid_data_msg, $this->getLocale()),
                ]);
            }

            $content = [
                'bandwidth' => $bandwidth,
            ];
        } else {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans(self::$invalid_data_msg, $this->getLocale()),
            ]);
        }

        $limit = [
            'class_required' => $class_required,
            'node_group_required' => $node_group_required,
            'new_user_required' => $new_user_required,
        ];

        $product->type = $type;
        $product->name = $name;
        $product->price = $price;
        $product->content = json_encode($content);
        $product->limit = json_encode($limit);
        $product->stock = $stock;
        $product->status = $status;
        $product->update_time = time();
        $product->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_product.update_success', $this->getLocale()),
        ]);
    }

    public function delete(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $product_id = $args['id'];
        (new Product())->find($product_id)->delete();

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_product.delete_success', $this->getLocale()),
        ]);
    }

    public function copy(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $old_product_id = $args['id'];
        $old_product = (new Product())->find($old_product_id);

        $new_product = $old_product->replicate([
            'create_time',
            'update_time',
        ]);
        $base_name   = preg_replace('/\s*\(\d+\)\s*$/', '', $old_product->name);
        $copy_count  = (new Product())->where('name', 'LIKE', $base_name . ' (%)')->count();
        $new_product->name        = $base_name . ' (' . ($copy_count + 1) . ')';
        $new_product->create_time = time();
        $new_product->update_time = time();
        $new_product->sale_count  = 0;
        $new_product->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_product.copy_success', $this->getLocale()),
        ]);
    }

    public function ajax(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $products = (new Product())->orderBy('id', 'desc')->get();

        $total    = 0;
        $active   = 0;
        $inactive = 0;
        $sales    = 0;

        foreach ($products as $product) {
            $total++;
            if ($product->status === 1) {
                $active++;
            } else {
                $inactive++;
            }
            $sales += (int) $product->sale_count;

            $product->op =
                '<div class="lmn-act-wrap">' .
                    '<a class="lmn-act-btn lmn-act-btn--edit" href="/admin/product/' . $product->id . '/edit" title="Edit">' .
                        '<span class="material-symbols-outlined">edit</span>' .
                    '</a>' .
                    '<button class="lmn-act-btn lmn-act-btn--warn" onclick="copyProduct(' . $product->id . ')" title="Copy">' .
                        '<span class="material-symbols-outlined">content_copy</span>' .
                    '</button>' .
                    '<button class="lmn-act-btn lmn-act-btn--del" onclick="deleteProduct(' . $product->id . ')" title="Delete">' .
                        '<span class="material-symbols-outlined">delete</span>' .
                    '</button>' .
                '</div>';

            $product->status = $product->status === 1
                ? '<span class="lmn-badge lmn-badge--active">Active</span>'
                : '<span class="lmn-badge lmn-badge--inactive">Inactive</span>';

            $product->type = match ($product->type) {
                'tabp'      => '<span class="lmn-badge lmn-badge--type-tabp">Time+Traffic</span>',
                'time'      => '<span class="lmn-badge lmn-badge--type-time">Time</span>',
                'bandwidth' => '<span class="lmn-badge lmn-badge--type-bandwidth">Bandwidth</span>',
                default     => '<span class="lmn-badge lmn-badge--inactive">Other</span>',
            };

            $product->stock = $product->stock < 0
                ? '<span class="lmn-badge lmn-badge--unlimited">' . I18n::trans('admin_product.stock_unlimited', $this->getLocale()) . '</span>'
                : $product->stock;
            $product->create_time = Tools::toDateTime($product->create_time);
            $product->update_time = Tools::toDateTime($product->update_time);
        }

        return $response->withJson([
            'products' => $products,
            'total'    => $total,
            'active'   => $active,
            'inactive' => $inactive,
            'sales'    => $sales,
        ]);
    }
}
