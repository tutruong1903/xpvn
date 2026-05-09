{include file='admin/header.tpl'}

<link href="/assets/css/admin/product-edit.css{asset_ver path="/assets/css/admin/product-edit.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title">
                <span data-i18n="admin.product.edit.title">编辑商品</span>
                <span style="color:#712ae2;margin-left:0.375rem;">#</span>{$product->id}
            </h2>
            <p class="lmn-page-subtitle" data-i18n="admin.product.edit.subtitle">修改此商品的配置。</p>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-edit-grid">

            <!-- =====================================================
                 Column 1: Basic Information
                 ===================================================== -->
            <div class="lmn-edit-col">
                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">info</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.product.create.section_basic">基础信息</h2>
                    </div>
                    <div class="lmn-edit-fields">
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_name">名称</label>
                            <input id="name" type="text" class="lmn-edit-input" value="{$product->name}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_price">价格</label>
                            <input id="price" type="number" step="0.01" min="0" class="lmn-edit-input" value="{$product->price}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_stock">库存（-1为不限制）</label>
                            <input id="stock" type="number" min="-1" class="lmn-edit-input" value="{$product->stock}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_status">销售状态</label>
                            <select id="status" class="lmn-edit-select">
                                <option value="1" {if $product->status === 1}selected{/if} data-i18n="admin.product.create.status_active">正常</option>
                                <option value="0" {if $product->status === 0}selected{/if} data-i18n="admin.product.create.status_inactive">下架</option>
                            </select>
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_type">类型</label>
                            <input id="type" type="hidden" value="{$product->type}">
                            <div class="lmn-type-switcher">
                                <button type="button" class="lmn-type-btn{if $product->type === 'tabp'} is-active{/if}" data-type="tabp">
                                    <span class="material-symbols-outlined lmn-type-btn__icon">package_2</span>
                                    <span class="lmn-type-btn__name" data-i18n="admin.product.create.type_tabp">时间流量包</span>
                                </button>
                                <button type="button" class="lmn-type-btn{if $product->type === 'bandwidth'} is-active{/if}" data-type="bandwidth">
                                    <span class="material-symbols-outlined lmn-type-btn__icon">cloud_download</span>
                                    <span class="lmn-type-btn__name" data-i18n="admin.product.create.type_bandwidth">流量包</span>
                                </button>
                                <button type="button" class="lmn-type-btn{if $product->type === 'time'} is-active{/if}" data-type="time">
                                    <span class="material-symbols-outlined lmn-type-btn__icon">schedule</span>
                                    <span class="lmn-type-btn__name" data-i18n="admin.product.create.type_time">时间包</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- =====================================================
                 Column 2: Product Content (dynamic fields)
                 ===================================================== -->
            <div class="lmn-edit-col">
                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">inventory_2</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.product.create.section_content">商品内容</h2>
                    </div>
                    <div class="lmn-edit-fields">
                        <div id="time_option" class="lmn-edit-field lmn-dynamic-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_time">商品时长 (天)</label>
                            <input id="time" type="number" min="1" class="lmn-edit-input" value="{$content->time}">
                        </div>
                        <div id="class_option" class="lmn-dynamic-field">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.product.create.field_class">授予等级</label>
                                <input id="class" type="hidden" value="{$content->class}">
                                <div class="lmn-level-picker" data-for="class">
                                    <button type="button" class="lmn-level-btn{if $content->class == 0} is-active{/if}" data-level="0">
                                        <span class="lmn-level-btn__name" data-i18n="admin.product.create.level_basic">Basic</span>
                                    </button>
                                    <button type="button" class="lmn-level-btn{if $content->class == 1} is-active{/if}" data-level="1">
                                        <span class="lmn-level-btn__name" data-i18n="admin.product.create.level_standard">Standard</span>
                                    </button>
                                    <button type="button" class="lmn-level-btn{if $content->class == 2} is-active{/if}" data-level="2">
                                        <span class="lmn-level-btn__name" data-i18n="admin.product.create.level_premium">Premium</span>
                                    </button>
                                    <button type="button" class="lmn-level-btn{if $content->class >= 3} is-active{/if}" data-level="3">
                                        <span class="lmn-level-btn__name" data-i18n="admin.product.create.level_vip">VIP</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div id="class_time_option" class="lmn-edit-field lmn-dynamic-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_class_time">等级时长 (天)</label>
                            <input id="class_time" type="number" min="1" class="lmn-edit-input" value="{$content->class_time}">
                        </div>
                        <div id="bandwidth_option" class="lmn-edit-field lmn-dynamic-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_bandwidth">可用流量 (GB)</label>
                            <div class="lmn-input-unit-wrap">
                                <input id="bandwidth" type="number" min="1" class="lmn-edit-input" value="{$content->bandwidth}">
                                <span class="lmn-input-unit">GB</span>
                            </div>
                        </div>
                        <div id="node_group_option" class="lmn-edit-field lmn-dynamic-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_node_group">授予节点分组</label>
                            <input id="node_group" type="number" min="0" class="lmn-edit-input" value="{$content->node_group}">
                        </div>
                        <div id="speed_limit_option" class="lmn-edit-field lmn-dynamic-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_speed_limit">速率限制 (Mbps)</label>
                            <div class="lmn-input-unit-wrap">
                                <input id="speed_limit" type="number" min="0" class="lmn-edit-input" value="{$content->speed_limit}">
                                <span class="lmn-input-unit">Mbps</span>
                            </div>
                        </div>
                        <div id="ip_limit_option" class="lmn-edit-field lmn-dynamic-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_ip_limit">同时连接IP限制</label>
                            <input id="ip_limit" type="number" min="0" class="lmn-edit-input" value="{$content->ip_limit}">
                        </div>
                    </div>
                </div>
            </div>

            <!-- =====================================================
                 Column 3: Purchase Restrictions + Save
                 ===================================================== -->
            <div class="lmn-edit-col">
                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">lock</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.product.create.section_restriction">购买限制</h2>
                    </div>
                    <div class="lmn-edit-fields">
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_class_required">最低等级要求</label>
                            <input id="class_required" type="hidden" value="{$limit->class_required}">
                            <div class="lmn-level-picker lmn-level-picker--5col" data-for="class_required">
                                <button type="button" class="lmn-level-btn{if $limit->class_required === '' || $limit->class_required === null} is-active{/if}" data-level="">
                                    <span class="lmn-level-btn__name" data-i18n="admin.product.create.level_any">任意</span>
                                </button>
                                <button type="button" class="lmn-level-btn{if $limit->class_required == '0' && $limit->class_required !== ''} is-active{/if}" data-level="0">
                                    <span class="lmn-level-btn__name" data-i18n="admin.product.create.level_basic">Basic</span>
                                </button>
                                <button type="button" class="lmn-level-btn{if $limit->class_required == '1'} is-active{/if}" data-level="1">
                                    <span class="lmn-level-btn__name" data-i18n="admin.product.create.level_standard">Standard</span>
                                </button>
                                <button type="button" class="lmn-level-btn{if $limit->class_required == '2'} is-active{/if}" data-level="2">
                                    <span class="lmn-level-btn__name" data-i18n="admin.product.create.level_premium">Premium</span>
                                </button>
                                <button type="button" class="lmn-level-btn{if $limit->class_required >= '3'} is-active{/if}" data-level="3">
                                    <span class="lmn-level-btn__name" data-i18n="admin.product.create.level_vip">VIP</span>
                                </button>
                            </div>
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.product.create.field_node_group_required">所需节点分组</label>
                            <input id="node_group_required" type="text" class="lmn-edit-input" value="{$limit->node_group_required}">
                        </div>
                        <div class="lmn-edit-toggle-row">
                            <span class="lmn-edit-toggle-label" data-i18n="admin.product.create.field_new_user_required">仅限新用户购买</span>
                            <label class="lmn-toggle">
                                <input id="new_user_required" type="checkbox" class="lmn-toggle-input" {if $limit->new_user_required === 1}checked{/if}>
                                <span class="lmn-toggle-track"></span>
                            </label>
                        </div>
                        <p style="font-size:0.75rem;color:#464554;margin:0;" data-i18n="admin.product.create.new_user_required_desc">仅允许新用户购买此商品。</p>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="lmn-edit-actions">
                    <button id="save-product" type="button" class="lmn-btn-save">
                        <span data-i18n="admin.product.edit.save_btn">保存更改</span>
                    </button>
                    <button type="button" class="lmn-btn-cancel" onclick="history.back()">
                        <span data-i18n="admin.product.edit.cancel_btn">取消</span>
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    // Type switcher
    document.querySelectorAll('.lmn-type-btn').forEach(function (btn) {
        btn.addEventListener('click', function () {
            document.querySelectorAll('.lmn-type-btn').forEach(function (b) {
                b.classList.remove('is-active');
            });
            btn.classList.add('is-active');
            var type = btn.getAttribute('data-type');
            document.getElementById('type').value = type;
            updateDynamicFields(type);
        });
    });

    // Level picker (scoped — each picker only deactivates its own buttons)
    document.querySelectorAll('.lmn-level-picker').forEach(function (picker) {
        var forId = picker.getAttribute('data-for');
        picker.querySelectorAll('.lmn-level-btn').forEach(function (btn) {
            btn.addEventListener('click', function () {
                picker.querySelectorAll('.lmn-level-btn').forEach(function (b) {
                    b.classList.remove('is-active');
                });
                btn.classList.add('is-active');
                document.getElementById(forId).value = btn.getAttribute('data-level');
            });
        });
    });

    function updateDynamicFields(type) {
        var timeOpt      = document.getElementById('time_option');
        var classOpt     = document.getElementById('class_option');
        var classTimeOpt = document.getElementById('class_time_option');
        var bwOpt        = document.getElementById('bandwidth_option');
        var ngOpt        = document.getElementById('node_group_option');
        var slOpt        = document.getElementById('speed_limit_option');
        var ilOpt        = document.getElementById('ip_limit_option');

        if (type === 'bandwidth') {
            timeOpt.classList.add('is-hidden');
            classOpt.classList.add('is-hidden');
            classTimeOpt.classList.add('is-hidden');
            bwOpt.classList.remove('is-hidden');
            ngOpt.classList.add('is-hidden');
            slOpt.classList.add('is-hidden');
            ilOpt.classList.add('is-hidden');
        } else if (type === 'time') {
            timeOpt.classList.remove('is-hidden');
            classOpt.classList.remove('is-hidden');
            classTimeOpt.classList.remove('is-hidden');
            bwOpt.classList.add('is-hidden');
            ngOpt.classList.remove('is-hidden');
            slOpt.classList.remove('is-hidden');
            ilOpt.classList.remove('is-hidden');
        } else {
            // tabp — all fields visible
            timeOpt.classList.remove('is-hidden');
            classOpt.classList.remove('is-hidden');
            classTimeOpt.classList.remove('is-hidden');
            bwOpt.classList.remove('is-hidden');
            ngOpt.classList.remove('is-hidden');
            slOpt.classList.remove('is-hidden');
            ilOpt.classList.remove('is-hidden');
        }
    }

    // Initialize fields based on current product type
    updateDynamicFields('{$product->type}');

    // Save
    document.getElementById('save-product').addEventListener('click', function () {
        $.ajax({
            url: '/admin/product/{$product->id}',
            type: 'PUT',
            dataType: 'json',
            data: {
                {foreach $update_field as $key}
                {$key}: $('#{$key}').val(),
                {/foreach}
                new_user_required: $('#new_user_required').is(':checked'),
            },
            success: function (data) {
                if (data.ret === 1) {
                    $('#success-message').text(data.msg);
                    $('#success-dialog').modal('show');
                    window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
                } else {
                    $('#fail-message').text(data.msg);
                    $('#fail-dialog').modal('show');
                }
            }
        });
    });
</script>

{include file='admin/footer.tpl'}

