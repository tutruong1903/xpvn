{include file='admin/header.tpl'}

<link href="/assets/css/admin/node-create.css{asset_ver path="/assets/css/admin/node-create.css"}" rel="stylesheet"/>
<script src="//{$config['jsdelivr_url']}/npm/jsoneditor@latest/dist/jsoneditor.min.js"></script>
<link href="//{$config['jsdelivr_url']}/npm/jsoneditor@latest/dist/jsoneditor.min.css" rel="stylesheet" type="text/css">

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.node.create.title">创建节点</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.node.create.subtitle">在您的基础设施中初始化新的网络节点。</p>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-edit-grid">

            <!-- =====================================================
                 Column 1: Basic Info + Custom Config (JSON editor)
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
                            <input id="name" type="text" class="lmn-edit-input" value="">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_server">连接地址</label>
                            <input id="server" type="text" class="lmn-edit-input" value="">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_traffic_rate">流量倍率</label>
                            <input id="traffic_rate" type="number" step="0.1" class="lmn-edit-input" value="1.0">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_sort">接入类型</label>
                            <div style="position:relative;">
                                <select id="sort" class="lmn-edit-select">
                                    <option value="14" data-i18n="admin.node.create.protocol_trojan">Trojan</option>
                                    <option value="11" data-i18n="admin.node.create.protocol_vmess">Vmess</option>
                                    <option value="2"  data-i18n="admin.node.create.protocol_tuic">TUIC</option>
                                    <option value="1"  data-i18n="admin.node.create.protocol_ss2022">Shadowsocks2022</option>
                                    <option value="0"  data-i18n="admin.node.create.protocol_ss">Shadowsocks</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Custom Config Card (keep original JSONEditor) -->
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
                            <input id="type" type="checkbox" class="lmn-toggle-input" checked>
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
                            <input id="is_dynamic_rate" type="checkbox" class="lmn-toggle-input">
                            <span class="lmn-toggle-track"></span>
                        </label>
                    </div>
                    <div class="lmn-edit-fields">
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_dynamic_type">动态流量倍率计算方式</label>
                            <div style="position:relative;">
                                <select id="dynamic_rate_type" class="lmn-edit-select">
                                    <option value="1" data-i18n="admin.node.create.dynamic_type_linear">线性 (Linear)</option>
                                    <option value="0" data-i18n="admin.node.create.dynamic_type_logistic">Logistic</option>
                                </select>
                            </div>
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_max_rate">最大倍率</label>
                            <input id="max_rate" type="number" step="0.1" class="lmn-edit-input" placeholder="2.0">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_max_rate_time">最大倍率时间（时）</label>
                            <input id="max_rate_time" type="number" class="lmn-edit-input" placeholder="18">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_min_rate">最小倍率</label>
                            <input id="min_rate" type="number" step="0.1" class="lmn-edit-input" placeholder="0.5">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_min_rate_time">最小倍率时间（时）</label>
                            <input id="min_rate_time" type="number" class="lmn-edit-input" placeholder="2">
                        </div>
                        <div class="lmn-hint">
                            <span class="material-symbols-outlined">info</span>
                            <p data-i18n="admin.node.create.dynamic_hint">最大倍率时间必须大于最小倍率时间，否则将不会生效</p>
                        </div>
                    </div>
                </div>

            </div>

            <!-- =====================================================
                 Column 3: Other Info + Traffic Settings + Save
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
                            <input id="node_class" type="hidden" value="0">
                            <div class="lmn-level-picker">
                                <button type="button" class="lmn-level-btn is-active" data-level="0">
                                    <span class="lmn-level-btn__name" data-i18n="admin.node.create.level_basic">Basic</span>
                                </button>
                                <button type="button" class="lmn-level-btn" data-level="1">
                                    <span class="lmn-level-btn__name" data-i18n="admin.node.create.level_standard">Standard</span>
                                </button>
                                <button type="button" class="lmn-level-btn" data-level="2">
                                    <span class="lmn-level-btn__name" data-i18n="admin.node.create.level_premium">Premium</span>
                                </button>
                                <button type="button" class="lmn-level-btn" data-level="3">
                                    <span class="lmn-level-btn__name" data-i18n="admin.node.create.level_vip">VIP</span>
                                </button>
                            </div>
                        </div>

                        <!-- Group Input -->
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_node_group">组别 (Group)</label>
                            <input id="node_group" type="number" min="0" class="lmn-edit-input" value="0">
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
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_bandwidth_limit">可用流量 (GB)</label>
                            <div class="lmn-input-unit-wrap">
                                <input id="node_bandwidth_limit" type="number" class="lmn-edit-input" placeholder="5000" min="0">
                                <span class="lmn-input-unit">GB</span>
                            </div>
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_bandwidth_resetday">流量重置日</label>
                            <input id="bandwidthlimit_resetday" type="number" min="1" max="31" class="lmn-edit-input" placeholder="1">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.node.create.field_speedlimit">速率限制 (Mbps)</label>
                            <div class="lmn-input-unit-wrap">
                                <input id="node_speedlimit" type="number" class="lmn-edit-input" placeholder="1000" min="0">
                                <span class="lmn-input-unit">Mbps</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="lmn-edit-actions">
                    <button id="create-node" type="button" class="lmn-btn-save">
                        <span data-i18n="admin.node.create.save_btn">保存配置</span>
                    </button>
                    <button type="button" class="lmn-btn-cancel" onclick="history.back()">
                        <span data-i18n="admin.node.create.cancel_btn">取消</span>
                    </button>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
    // JSON Editor
    const container = document.getElementById('custom_config');
    const editor = new JSONEditor(container, { modes: ['code', 'tree'] });

    // Level picker
    document.querySelectorAll('.lmn-level-btn').forEach(function (btn) {
        btn.addEventListener('click', function () {
            document.querySelectorAll('.lmn-level-btn').forEach(function (b) {
                b.classList.remove('is-active');
            });
            btn.classList.add('is-active');
            document.getElementById('node_class').value = btn.getAttribute('data-level');
        });
    });

    // Save
    $("#create-node").click(function () {
        $.ajax({
            url: '/admin/node',
            type: 'POST',
            dataType: "json",
            data: {
                {foreach $update_field as $key}
                {$key}: $('#{$key}').val(),
                {/foreach}
                is_dynamic_rate: $("#is_dynamic_rate").is(":checked"),
                type: $("#type").is(":checked"),
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
