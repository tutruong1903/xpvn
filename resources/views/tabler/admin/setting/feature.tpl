{include file='admin/header.tpl'}

<link href="/assets/css/admin/feature.css{asset_ver path="/assets/css/admin/feature.css"}" rel="stylesheet"/>

<div class="container-xl">
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.feature.index.title">其他设置</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.feature.index.subtitle">设置站点的其他设置</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.feature.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="display">
                    <span data-i18n="admin.feature.index.tab_display">功能显示</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="log">
                    <span data-i18n="admin.feature.index.tab_log">用户日志</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="checkin">
                    <span data-i18n="admin.feature.index.tab_checkin">签到</span>
                </button>
            </div>

            <div class="lmn-billing-content">

                <!-- Display Panel -->
                <div class="lmn-billing-panel is-active" data-panel="display">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined">visibility</span>
                            <span data-i18n="admin.feature.index.tab_display">功能显示</span>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.display_detect_log">显示用户审计记录</label>
                                <div class="lmn-edit-input">
                                    <select id="display_detect_log" class="lmn-edit-select">
                                        <option value="0" {if !$settings['display_detect_log']}selected{/if} data-i18n="admin.feature.index.disable">关闭</option>
                                        <option value="1" {if $settings['display_detect_log']}selected{/if} data-i18n="admin.feature.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.display_docs">显示文档</label>
                                <div class="lmn-edit-input">
                                    <select id="display_docs" class="lmn-edit-select">
                                        <option value="0" {if !$settings['display_docs']}selected{/if} data-i18n="admin.feature.index.disable">关闭</option>
                                        <option value="1" {if $settings['display_docs']}selected{/if} data-i18n="admin.feature.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.docs_paid_only">文档仅付费用户可见</label>
                                <div class="lmn-edit-input">
                                    <select id="display_docs_only_for_paid_user" class="lmn-edit-select">
                                        <option value="0" {if !$settings['display_docs_only_for_paid_user']}selected{/if} data-i18n="admin.feature.index.disable">关闭</option>
                                        <option value="1" {if $settings['display_docs_only_for_paid_user']}selected{/if} data-i18n="admin.feature.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Log Panel -->
                <div class="lmn-billing-panel" data-panel="log">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined">history</span>
                            <span data-i18n="admin.feature.index.tab_log">用户日志</span>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.traffic_log">启用每小时使用流量日志</label>
                                <div class="lmn-edit-input">
                                    <select id="traffic_log" class="lmn-edit-select">
                                        <option value="0" {if !$settings['traffic_log']}selected{/if} data-i18n="admin.feature.index.disable">关闭</option>
                                        <option value="1" {if $settings['traffic_log']}selected{/if} data-i18n="admin.feature.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.traffic_log_days">流量日志保留天数</label>
                                <div class="lmn-edit-input">
                                    <input id="traffic_log_retention_days" type="text" class="lmn-edit-text" value="{$settings['traffic_log_retention_days']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.subscribe_log">启用订阅日志</label>
                                <div class="lmn-edit-input">
                                    <select id="subscribe_log" class="lmn-edit-select">
                                        <option value="0" {if !$settings['subscribe_log']}selected{/if} data-i18n="admin.feature.index.disable">关闭</option>
                                        <option value="1" {if $settings['subscribe_log']}selected{/if} data-i18n="admin.feature.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.subscribe_log_days">订阅日志保留天数</label>
                                <div class="lmn-edit-input">
                                    <input id="subscribe_log_retention_days" type="text" class="lmn-edit-text" value="{$settings['subscribe_log_retention_days']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.notify_new_subscribe">通知用户新 IP 订阅</label>
                                <div class="lmn-edit-input">
                                    <select id="notify_new_subscribe" class="lmn-edit-select">
                                        <option value="0" {if !$settings['notify_new_subscribe']}selected{/if} data-i18n="admin.feature.index.disable">关闭</option>
                                        <option value="1" {if $settings['notify_new_subscribe']}selected{/if} data-i18n="admin.feature.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.login_log">启用登录日志</label>
                                <div class="lmn-edit-input">
                                    <select id="login_log" class="lmn-edit-select">
                                        <option value="0" {if !$settings['login_log']}selected{/if} data-i18n="admin.feature.index.disable">关闭</option>
                                        <option value="1" {if $settings['login_log']}selected{/if} data-i18n="admin.feature.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.notify_new_login">通知用户新 IP 登录</label>
                                <div class="lmn-edit-input">
                                    <select id="notify_new_login" class="lmn-edit-select">
                                        <option value="0" {if !$settings['notify_new_login']}selected{/if} data-i18n="admin.feature.index.disable">关闭</option>
                                        <option value="1" {if $settings['notify_new_login']}selected{/if} data-i18n="admin.feature.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Checkin Panel -->
                <div class="lmn-billing-panel" data-panel="checkin">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined">how_to_vote</span>
                            <span data-i18n="admin.feature.index.tab_checkin">签到</span>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.enable_checkin">启用签到</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_checkin" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_checkin']}selected{/if} data-i18n="admin.feature.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_checkin']}selected{/if} data-i18n="admin.feature.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.checkin_min">签到最少流量（MB）</label>
                                <div class="lmn-edit-input">
                                    <input id="checkin_min" type="text" class="lmn-edit-text" value="{$settings['checkin_min']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.feature.index.checkin_max">签到最多流量（MB）</label>
                                <div class="lmn-edit-input">
                                    <input id="checkin_max" type="text" class="lmn-edit-text" value="{$settings['checkin_max']}">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div><!-- /.lmn-billing-content -->
        </div><!-- /.lmn-billing-grid -->
    </div>
</div>

<script>
(function () {
    var tabs   = document.querySelectorAll('.lmn-billing-tab-btn');
    var panels = document.querySelectorAll('.lmn-billing-panel');
    tabs.forEach(function (btn) {
        btn.addEventListener('click', function () {
            var target = btn.getAttribute('data-tab');
            tabs.forEach(function (b) { b.classList.remove('is-active'); });
            panels.forEach(function (p) { p.classList.remove('is-active'); });
            btn.classList.add('is-active');
            document.querySelector('.lmn-billing-panel[data-panel="' + target + '"]').classList.add('is-active');
        });
    });

    document.getElementById('save-setting').addEventListener('click', function () {
        var data = {};
        {foreach $update_field as $key}
        var _el_{$key} = document.getElementById('{$key}');
        if (_el_{$key}) { data['{$key}'] = _el_{$key}.value; }
        {/foreach}
        fetch('/admin/setting/feature', {
            method: 'POST',
            headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest'},
            body: JSON.stringify(data),
        }).then(function (r) { return r.json(); }).then(function (res) {
            if (res.ret === 1) {
                document.getElementById('success-message').textContent = res.msg;
                (new bootstrap.Modal(document.getElementById('success-dialog'))).show();
            } else {
                document.getElementById('fail-message').textContent = res.msg;
                (new bootstrap.Modal(document.getElementById('fail-dialog'))).show();
            }
        });
    });
}());
</script>

{include file='admin/footer.tpl'}
