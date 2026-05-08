{include file='admin/header.tpl'}

<link href="/assets/css/admin/node-edit.css{asset_ver path="/assets/css/admin/node-edit.css"}" rel="stylesheet"/>
<script src="//{$config['jsdelivr_url']}/npm/jsoneditor@latest/dist/jsoneditor.min.js"></script>
<link href="//{$config['jsdelivr_url']}/npm/jsoneditor@latest/dist/jsoneditor.min.css" rel="stylesheet" type="text/css">

<div class="container-xl">
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title">
                <span data-i18n="admin.node.edit.title">编辑节点</span>
                <span style="color:#712ae2;margin-left:0.375rem;">#</span>{$node->id}
            </h2>
            <p class="lmn-page-subtitle" data-i18n="admin.node.edit.subtitle">修改此代理节点的连接参数和配置信息。</p>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-edit-grid">

            <!-- =====================================================
                 Column 1: Basic Info + Custom Config
                 ===================================================== -->
            <div class="lmn-edit-col">

                <!-- Basic Info Card -->
                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">info</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.node.create.section_basic">基础信息</h2>
                    </div>
                    <div class="lmn-edit-fields">
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_name">名称</label>
                            <input id="name" type="text" class="lmn-edit-input" value="{$node->name}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_server">连接地址</label>
                            <input id="server" type="text" class="lmn-edit-input" value="{$node->server}">
                        </div>
                        <div class="lmn-edit-row-2">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.node.edit.field_ipv4">IPv4</label>
                                <div class="lmn-edit-readonly lmn-mono">{$node->ipv4}</div>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.node.edit.field_ipv6">IPv6</label>
                                <div class="lmn-edit-readonly lmn-mono">{$node->ipv6}</div>
                            </div>
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_traffic_rate">流量倍率</label>
                            <input id="traffic_rate" type="number" step="0.1" class="lmn-edit-input" value="{$node->traffic_rate}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_sort">接入类型</label>
                            <select id="sort" class="lmn-edit-select">
                                <option value="14" {if $node->sort === 14}selected{/if} data-i18n="admin.node.create.protocol_trojan">Trojan</option>
                                <option value="11" {if $node->sort === 11}selected{/if} data-i18n="admin.node.create.protocol_vmess">Vmess</option>
                                <option value="2"  {if $node->sort === 2}selected{/if}  data-i18n="admin.node.create.protocol_tuic">TUIC</option>
                                <option value="1"  {if $node->sort === 1}selected{/if}  data-i18n="admin.node.create.protocol_ss2022">Shadowsocks2022</option>
                                <option value="0"  {if $node->sort === 0}selected{/if}  data-i18n="admin.node.create.protocol_ss">Shadowsocks</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Custom Config Card -->
                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">code</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.node.create.section_config">自定义配置</h2>
                        <span style="margin-left:auto;font-size:0.625rem;font-weight:700;text-transform:uppercase;letter-spacing:0.1em;color:#712ae2;background:rgba(113,42,226,0.08);padding:0.1875rem 0.5rem;border-radius:0.375rem;" data-i18n="admin.node.create.config_badge">JSON Editor</span>
                    </div>
                    <div class="lmn-jsoneditor-wrap">
                        <div id="custom_config"></div>
                    </div>
                    <div class="lmn-hint" style="margin-top:1rem;">
                        <span class="material-symbols-outlined">info</span>
                        <p>
                            <span data-i18n="admin.node.create.config_docs_text">请参考</span>
                            <a href="https://docs.sspanel.io/docs/configuration/nodes" target="_blank" data-i18n="admin.node.create.config_docs_link">节点自定义配置文档</a>
                            <span data-i18n="admin.node.create.config_docs_suffix">修改节点自定义配置</span>
                        </p>
                    </div>
                    <div class="lmn-edit-toggle-row" style="margin-top:1rem;">
                        <span class="lmn-edit-toggle-label" data-i18n="admin.node.create.field_show_node">显示此节点</span>
                        <label class="lmn-toggle">
                            <input id="type" type="checkbox" class="lmn-toggle-input" {if $node->type}checked{/if}>
                            <span class="lmn-toggle-track"></span>
                        </label>
                    </div>
                    <p style="font-size:0.75rem;color:#464554;margin:0.5rem 0 0;" data-i18n="admin.node.create.show_node_desc">允许该节点出现在节点列表中。</p>
                </div>

            </div>

            <!-- =====================================================
                 Column 2: Dynamic Rate Configuration
                 ===================================================== -->
            <div class="lmn-edit-col">

                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">auto_graph</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.node.create.section_dynamic">动态倍率配置</h2>
                        <label class="lmn-toggle" style="margin-left:auto;">
                            <input id="is_dynamic_rate" type="checkbox" class="lmn-toggle-input" {if $node->is_dynamic_rate}checked{/if}>
                            <span class="lmn-toggle-track"></span>
                        </label>
                    </div>
                    <div class="lmn-edit-fields">
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_dynamic_type">动态流量倍率计算方式</label>
                            <select id="dynamic_rate_type" class="lmn-edit-select">
                                <option value="1" {if $node->dynamic_rate_type === 1}selected{/if} data-i18n="admin.node.create.dynamic_type_linear">Linear</option>
                                <option value="0" {if $node->dynamic_rate_type === 0}selected{/if} data-i18n="admin.node.create.dynamic_type_logistic">Logistic</option>
                            </select>
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_max_rate">最大倍率</label>
                            <input id="max_rate" type="number" step="0.1" class="lmn-edit-input" value="{$node->max_rate}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_max_rate_time">最大倍率时间（时）</label>
                            <input id="max_rate_time" type="number" class="lmn-edit-input" value="{$node->max_rate_time}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_min_rate">最小倍率</label>
                            <input id="min_rate" type="number" step="0.1" class="lmn-edit-input" value="{$node->min_rate}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_min_rate_time">最小倍率时间（时）</label>
                            <input id="min_rate_time" type="number" class="lmn-edit-input" value="{$node->min_rate_time}">
                        </div>
                        <div class="lmn-hint">
                            <span class="material-symbols-outlined">info</span>
                            <p data-i18n="admin.node.create.dynamic_hint">最大倍率时间必须大于最小倍率时间，否则将不会生效</p>
                        </div>
                    </div>
                </div>

            </div>

            <!-- =====================================================
                 Column 3: Other Info + Traffic + Advanced + Actions
                 ===================================================== -->
            <div class="lmn-edit-col">

                <!-- Other Info Card -->
                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">category</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.node.create.section_other">其他信息</h2>
                    </div>
                    <div class="lmn-edit-fields">
                        <!-- Level Picker -->
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_node_class">等级 (Level)</label>
                            <input id="node_class" type="hidden" value="{$node->node_class}">
                            <div class="lmn-level-picker">
                                <button type="button" class="lmn-level-btn{if $node->node_class == 0} is-active{/if}" data-level="0">
                                    <span class="lmn-level-btn__name" data-i18n="admin.node.create.level_basic">Basic</span>
                                </button>
                                <button type="button" class="lmn-level-btn{if $node->node_class == 1} is-active{/if}" data-level="1">
                                    <span class="lmn-level-btn__name" data-i18n="admin.node.create.level_standard">Standard</span>
                                </button>
                                <button type="button" class="lmn-level-btn{if $node->node_class == 2} is-active{/if}" data-level="2">
                                    <span class="lmn-level-btn__name" data-i18n="admin.node.create.level_premium">Premium</span>
                                </button>
                                <button type="button" class="lmn-level-btn{if $node->node_class >= 3} is-active{/if}" data-level="3">
                                    <span class="lmn-level-btn__name" data-i18n="admin.node.create.level_vip">VIP</span>
                                </button>
                            </div>
                        </div>
                        <!-- Group Input -->
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_node_group">组别 (Group)</label>
                            <input id="node_group" type="number" min="0" class="lmn-edit-input" value="{$node->node_group}">
                        </div>
                    </div>
                </div>

                <!-- Traffic Settings Card -->
                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">speed</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.node.create.section_traffic">流量设置</h2>
                    </div>
                    <div class="lmn-edit-fields">
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.edit.field_used_bandwidth">已用流量</label>
                            <div class="lmn-field-with-btn">
                                <div class="lmn-edit-readonly">{$node->node_bandwidth}</div>
                                <button id="reset-bandwidth" type="button" class="lmn-btn-action lmn-btn-action--danger">
                                    <span class="material-symbols-outlined">restart_alt</span>
                                    <span data-i18n="admin.node.edit.reset_btn">重置</span>
                                </button>
                            </div>
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_bandwidth_limit">可用流量 (GB)</label>
                            <div class="lmn-input-unit-wrap">
                                <input id="node_bandwidth_limit" type="number" min="0" class="lmn-edit-input" value="{$node->node_bandwidth_limit}">
                                <span class="lmn-input-unit">GB</span>
                            </div>
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_bandwidth_resetday">流量重置日</label>
                            <input id="bandwidthlimit_resetday" type="number" min="1" max="31" class="lmn-edit-input" value="{$node->bandwidthlimit_resetday}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_speedlimit">速率限制 (Mbps)</label>
                            <div class="lmn-input-unit-wrap">
                                <input id="node_speedlimit" type="number" min="0" class="lmn-edit-input" value="{$node->node_speedlimit}">
                                <span class="lmn-input-unit">Mbps</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Advanced Options Card -->
                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">key</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.node.edit.section_advanced">高级选项</h2>
                    </div>
                    <div class="lmn-edit-fields">
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.edit.field_password_key">节点通讯密钥</label>
                            <div class="lmn-field-with-btn">
                                <input id="password" type="text" class="lmn-edit-input lmn-password-input"
                                       value="{$node->password}" readonly>
                                <button id="reset-password" type="button" class="lmn-btn-action lmn-btn-action--danger">
                                    <span class="material-symbols-outlined">restart_alt</span>
                                    <span data-i18n="admin.node.edit.reset_btn">重置</span>
                                </button>
                                <button id="copy-password" type="button" class="lmn-btn-action copy"
                                        data-clipboard-text="{$node->password}">
                                    <span class="material-symbols-outlined">content_copy</span>
                                    <span data-i18n="admin.node.edit.copy_btn">复制</span>
                                </button>
                            </div>
                            <p class="lmn-hint" style="margin-top:0.5rem;">
                                <span class="material-symbols-outlined">info</span>
                                <span data-i18n="admin.node.edit.password_key_desc">通讯密钥用于 NodeAPI 鉴权，如需更改请点击重置</span>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="lmn-edit-actions">
                    <button id="save-node" type="button" class="lmn-btn-save">
                        <span data-i18n="admin.node.edit.save_btn">保存更改</span>
                    </button>
                    <button type="button" class="lmn-btn-cancel" onclick="history.back()">
                        <span data-i18n="admin.node.edit.cancel_btn">取消</span>
                    </button>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
    // Clipboard
    var clipboard = new ClipboardJS('.copy');
    clipboard.on('success', function () {
        var locale  = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var nodeLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.node && window.i18nLocales.admin.node[locale]) || {};
        var msg = (nodeLoc.edit && nodeLoc.edit.clipboard_success) || 'Copied to clipboard';
        $('#success-message').text(msg);
        $('#success-dialog').modal('show');
    });

    // JSON Editor
    const container = document.getElementById('custom_config');
    const editor = new JSONEditor(container, { modes: ['code', 'tree'] });
    editor.set({$node->custom_config});

    // Level picker
    document.querySelectorAll('.lmn-level-btn').forEach(function (btn) {
        btn.addEventListener('click', function () {
            document.querySelectorAll('.lmn-level-btn').forEach(function (b) { b.classList.remove('is-active'); });
            btn.classList.add('is-active');
            document.getElementById('node_class').value = btn.getAttribute('data-level');
        });
    });

    // Reset bandwidth
    $('#reset-bandwidth').click(function () {
        $.ajax({
            url: '/admin/node/{$node->id}/reset_bandwidth',
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                if (data.ret === 1) {
                    $('#success-message').text(data.msg);
                    $('#success-dialog').modal('show');
                } else {
                    $('#fail-message').text(data.msg);
                    $('#fail-dialog').modal('show');
                }
            }
        });
    });

    // Reset password
    $('#reset-password').click(function () {
        $.ajax({
            url: '/admin/node/{$node->id}/reset_password',
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                if (data.ret === 1) {
                    $('#success-message').text(data.msg);
                    $('#success-dialog').modal('show');
                } else {
                    $('#fail-message').text(data.msg);
                    $('#fail-dialog').modal('show');
                }
            }
        });
    });

    // Save
    $('#save-node').click(function () {
        $.ajax({
            url: '/admin/node/{$node->id}',
            type: 'PUT',
            dataType: 'json',
            data: {
                {foreach $update_field as $key}
                {$key}: $('#{$key}').val(),
                {/foreach}
                type: $('#type').is(':checked'),
                is_dynamic_rate: $('#is_dynamic_rate').is(':checked'),
                custom_config: JSON.stringify(editor.get()),
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
