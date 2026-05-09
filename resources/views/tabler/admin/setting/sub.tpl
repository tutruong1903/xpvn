{include file='admin/header.tpl'}

<link href="/assets/css/admin/sub.css{asset_ver path="/assets/css/admin/sub.css"}" rel="stylesheet"/>

<div class="container-xl">
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.sub.index.title">订阅设置</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.sub.index.subtitle">管理站点的订阅协议</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.sub.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="sub">
                    <span data-i18n="admin.sub.index.tab_sub">订阅</span>
                </button>
            </div>

            <div class="lmn-billing-content">
                <div class="lmn-billing-panel is-active" data-panel="sub">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined">rss_feed</span>
                            <span data-i18n="admin.sub.index.tab_sub">订阅</span>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.sub.index.enable_ss">启用 Shadowsocks 订阅</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_ss_sub" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_ss_sub']}selected{/if} data-i18n="admin.sub.index.false">关闭</option>
                                        <option value="1" {if $settings['enable_ss_sub']}selected{/if} data-i18n="admin.sub.index.true">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.sub.index.enable_v2">启用 V2Ray 订阅</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_v2_sub" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_v2_sub']}selected{/if} data-i18n="admin.sub.index.false">关闭</option>
                                        <option value="1" {if $settings['enable_v2_sub']}selected{/if} data-i18n="admin.sub.index.true">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.sub.index.enable_trojan">启用 Trojan 订阅</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_trojan_sub" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_trojan_sub']}selected{/if} data-i18n="admin.sub.index.false">关闭</option>
                                        <option value="1" {if $settings['enable_trojan_sub']}selected{/if} data-i18n="admin.sub.index.true">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.sub.index.forced_replacement">修改账户登录密码时重置订阅地址</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_forced_replacement" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_forced_replacement']}selected{/if} data-i18n="admin.sub.index.false">关闭</option>
                                        <option value="1" {if $settings['enable_forced_replacement']}selected{/if} data-i18n="admin.sub.index.true">开启</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
(function () {
    document.getElementById('save-setting').addEventListener('click', function () {
        var data = {};
        {foreach $update_field as $key}
        var _el_{$key} = document.getElementById('{$key}');
        if (_el_{$key}) { data['{$key}'] = _el_{$key}.value; }
        {/foreach}
        fetch('/admin/setting/sub', {
            method: 'POST',
            headers: {ldelim}'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest'{rdelim},
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
