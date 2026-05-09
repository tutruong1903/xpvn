{include file='admin/header.tpl'}

<link href="/assets/css/admin/reg.css{asset_ver path="/assets/css/admin/reg.css"}" rel="stylesheet"/>

<div class="container-xl">
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.reg.index.title">注册设置</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.reg.index.subtitle">管理站点的注册设置</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.reg.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="reg">
                    <span data-i18n="admin.reg.index.tab_reg">注册设置</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="default">
                    <span data-i18n="admin.reg.index.tab_default">默认值</span>
                </button>
            </div>

            <div class="lmn-billing-content">

                <!-- Registration Settings Panel -->
                <div class="lmn-billing-panel is-active" id="panel-reg">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">how_to_reg</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.reg.index.tab_reg">注册设置</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.reg_mode">注册模式</label>
                                <select id="reg_mode" class="lmn-edit-select">
                                    <option value="close" {if $settings['reg_mode'] === 'close'}selected{/if} data-i18n="admin.reg.index.reg_mode_close">关闭注册</option>
                                    <option value="open" {if $settings['reg_mode'] === 'open'}selected{/if} data-i18n="admin.reg.index.reg_mode_open">公开注册</option>
                                    <option value="invite" {if $settings['reg_mode'] === 'invite'}selected{/if} data-i18n="admin.reg.index.reg_mode_invite">仅限用户邀请注册</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.reg_email_verify">邮箱验证</label>
                                <select id="reg_email_verify" class="lmn-edit-select">
                                    <option value="0" {if !$settings['reg_email_verify']}selected{/if} data-i18n="admin.reg.index.disable">关闭</option>
                                    <option value="1" {if $settings['reg_email_verify']}selected{/if} data-i18n="admin.reg.index.enable">开启</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.reg_daily_report">默认接收每日用量邮件推送</label>
                                <select id="reg_daily_report" class="lmn-edit-select">
                                    <option value="0" {if !$settings['reg_daily_report']}selected{/if} data-i18n="admin.reg.index.disable">关闭</option>
                                    <option value="1" {if $settings['reg_daily_report']}selected{/if} data-i18n="admin.reg.index.enable">开启</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Default Values Panel -->
                <div class="lmn-billing-panel" id="panel-default">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">tune</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.reg.index.tab_default">默认值</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.random_group">注册时随机分配到的分组，多个分组请用英文半角逗号分隔</label>
                                <input id="random_group" type="text" class="lmn-edit-input"
                                       value="{$settings['random_group']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.min_port">用户端口池最小值，设为 0 时用户不会被分配端口</label>
                                <input id="min_port" type="text" class="lmn-edit-input"
                                       value="{$settings['min_port']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.max_port">用户端口池最大值，设为 0 时用户不会被分配端口</label>
                                <input id="max_port" type="text" class="lmn-edit-input"
                                       value="{$settings['max_port']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.reg_traffic">注册时赠送的流量（GB）</label>
                                <input id="reg_traffic" type="text" class="lmn-edit-input"
                                       value="{$settings['reg_traffic']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.free_user_reset_day">免费用户的流量重置日，设为 0 时不重置</label>
                                <input id="free_user_reset_day" type="text" class="lmn-edit-input"
                                       value="{$settings['free_user_reset_day']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.free_user_reset_bandwidth">需要重置的免费流量，设为 0 时不重置</label>
                                <input id="free_user_reset_bandwidth" type="text" class="lmn-edit-input"
                                       value="{$settings['free_user_reset_bandwidth']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.reg_class">注册等级</label>
                                <input id="reg_class" type="text" class="lmn-edit-input"
                                       value="{$settings['reg_class']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.reg_class_time">注册等级过期时间（天）</label>
                                <input id="reg_class_time" type="text" class="lmn-edit-input"
                                       value="{$settings['reg_class_time']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.reg_method">默认加密</label>
                                <input id="reg_method" type="text" class="lmn-edit-input"
                                       value="{$settings['reg_method']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.reg_ip_limit">连接 IP 限制</label>
                                <input id="reg_ip_limit" type="text" class="lmn-edit-input"
                                       value="{$settings['reg_ip_limit']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.reg.index.reg_speed_limit">使用速率限制</label>
                                <input id="reg_speed_limit" type="text" class="lmn-edit-input"
                                       value="{$settings['reg_speed_limit']}">
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script>
        document.querySelectorAll('.lmn-billing-tab-btn').forEach(function (btn) {
            btn.addEventListener('click', function () {
                document.querySelectorAll('.lmn-billing-tab-btn').forEach(function (b) { b.classList.remove('is-active'); });
                document.querySelectorAll('.lmn-billing-panel').forEach(function (p) { p.classList.remove('is-active'); });
                btn.classList.add('is-active');
                var panel = document.getElementById('panel-' + btn.dataset.tab);
                if (panel) panel.classList.add('is-active');
            });
        });

        $("#save-setting").click(function () {
            $.ajax({
                url: '/admin/setting/reg',
                type: 'POST',
                dataType: "json",
                data: {
                    {foreach $update_field as $key}
                    {$key}: $('#{$key}').val(),
                    {/foreach}
                },
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
    </script>

    {include file='admin/footer.tpl'}
