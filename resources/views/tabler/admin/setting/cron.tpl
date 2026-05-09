{include file='admin/header.tpl'}

<link href="/assets/css/admin/cron.css{asset_ver path="/assets/css/admin/cron.css"}" rel="stylesheet"/>

<div class="container-xl">
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.cron.index.title">定时任务设置</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.cron.index.subtitle">管理站点的定时任务</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.cron.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="daily_job">
                    <span data-i18n="admin.cron.index.tab_daily">每日任务</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="finance_mail">
                    <span data-i18n="admin.cron.index.tab_finance">财务报告</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="detect">
                    <span data-i18n="admin.cron.index.tab_detect">审计任务</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="inactive">
                    <span data-i18n="admin.cron.index.tab_inactive">闲置账号检测</span>
                </button>
            </div>

            <div class="lmn-billing-content">

                <!-- Daily Job -->
                <div class="lmn-billing-panel is-active" data-panel="daily_job">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">schedule</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.cron.index.tab_daily">每日任务</h2>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.daily_hour">每日任务执行时间（小时）</label>
                                <div class="lmn-edit-input">
                                    <input id="daily_job_hour" type="text" class="lmn-edit-input" value="{$settings['daily_job_hour']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.daily_minute">每日任务执行时间（分钟）</label>
                                <div class="lmn-edit-input">
                                    <input id="daily_job_minute" type="text" class="lmn-edit-input" value="{$settings['daily_job_minute']}">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Finance Report -->
                <div class="lmn-billing-panel" data-panel="finance_mail">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">bar_chart</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.cron.index.tab_finance">财务报告</h2>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.finance_daily">是否启用每日财务报告</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_daily_finance_mail" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_daily_finance_mail']}selected{/if} data-i18n="admin.cron.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_daily_finance_mail']}selected{/if} data-i18n="admin.cron.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.finance_weekly">是否启用每周财务报告</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_weekly_finance_mail" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_weekly_finance_mail']}selected{/if} data-i18n="admin.cron.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_weekly_finance_mail']}selected{/if} data-i18n="admin.cron.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.finance_monthly">是否启用每月财务报告</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_monthly_finance_mail" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_monthly_finance_mail']}selected{/if} data-i18n="admin.cron.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_monthly_finance_mail']}selected{/if} data-i18n="admin.cron.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Detect -->
                <div class="lmn-billing-panel" data-panel="detect">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">security</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.cron.index.tab_detect">审计任务</h2>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.detect_gfw">是否启用节点被墙检测</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_detect_gfw" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_detect_gfw']}selected{/if} data-i18n="admin.cron.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_detect_gfw']}selected{/if} data-i18n="admin.cron.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.detect_ban">是否启用审计封禁</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_detect_ban" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_detect_ban']}selected{/if} data-i18n="admin.cron.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_detect_ban']}selected{/if} data-i18n="admin.cron.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Inactive -->
                <div class="lmn-billing-panel" data-panel="inactive">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">person_off</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.cron.index.tab_inactive">闲置账号检测</h2>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.detect_inactive">是否启用闲置账号检测</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_detect_inactive_user" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_detect_inactive_user']}selected{/if} data-i18n="admin.cron.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_detect_inactive_user']}selected{/if} data-i18n="admin.cron.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.inactive_checkin_days">未签到时长（天）</label>
                                <div class="lmn-edit-input">
                                    <input id="detect_inactive_user_checkin_days" type="text" class="lmn-edit-input" value="{$settings['detect_inactive_user_checkin_days']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.inactive_login_days">未登录时长（天）</label>
                                <div class="lmn-edit-input">
                                    <input id="detect_inactive_user_login_days" type="text" class="lmn-edit-input" value="{$settings['detect_inactive_user_login_days']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.inactive_use_days">未使用时长（天）</label>
                                <div class="lmn-edit-input">
                                    <input id="detect_inactive_user_use_days" type="text" class="lmn-edit-input" value="{$settings['detect_inactive_user_use_days']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.cron.index.remove_sub">是否启用移除闲置账号订阅链接与邀请码</label>
                                <div class="lmn-edit-input">
                                    <select id="remove_inactive_user_link_and_invite" class="lmn-edit-select">
                                        <option value="0" {if !$settings['remove_inactive_user_link_and_invite']}selected{/if} data-i18n="admin.cron.index.disable">关闭</option>
                                        <option value="1" {if $settings['remove_inactive_user_link_and_invite']}selected{/if} data-i18n="admin.cron.index.enable">开启</option>
                                    </select>
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
        fetch('/admin/setting/cron', {
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
