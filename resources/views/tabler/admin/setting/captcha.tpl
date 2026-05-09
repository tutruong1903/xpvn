{include file='admin/header.tpl'}

<link href="/assets/css/admin/captcha.css{asset_ver path="/assets/css/admin/captcha.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.captcha.index.title">人机验证设置</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.captcha.index.subtitle">设置站点的人机验证系统</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.captcha.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <!-- Tab Navigation (Horizontal) -->
            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="captcha">
                    <span data-i18n="admin.captcha.index.tab_captcha">验证设置</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="turnstile">
                    <span>Turnstile</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="geetest">
                    <span>Geetest</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="hcaptcha">
                    <span>hCaptcha</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="recaptcha">
                    <span>reCAPTCHA Enterprise</span>
                </button>
            </div>

            <!-- Content Area -->
            <div class="lmn-billing-content">

                <!-- Captcha Settings Panel -->
                <div class="lmn-billing-panel is-active" id="panel-captcha">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">security</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.captcha.index.tab_captcha">验证设置</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.captcha.index.provider_label">验证码提供商</label>
                                <select id="captcha_provider" class="lmn-edit-select">
                                    <option value="turnstile" {if $settings['captcha_provider'] === "turnstile"}selected{/if}>Turnstile</option>
                                    <option value="geetest" {if $settings['captcha_provider'] === "geetest"}selected{/if}>Geetest</option>
                                    <option value="hcaptcha" {if $settings['captcha_provider'] === "hcaptcha"}selected{/if}>hCaptcha</option>
                                    <option value="recaptcha_enterprise" {if $settings['captcha_provider'] === "recaptcha_enterprise"}selected{/if}>reCAPTCHA Enterprise</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.captcha.index.reg_captcha">注册验证码</label>
                                <select id="enable_reg_captcha" class="lmn-edit-select">
                                    <option value="0" {if !$settings['enable_reg_captcha']}selected{/if} data-i18n="admin.captcha.index.disable">关闭</option>
                                    <option value="1" {if $settings['enable_reg_captcha']}selected{/if} data-i18n="admin.captcha.index.enable">开启</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.captcha.index.login_captcha">登录验证码</label>
                                <select id="enable_login_captcha" class="lmn-edit-select">
                                    <option value="0" {if !$settings['enable_login_captcha']}selected{/if} data-i18n="admin.captcha.index.disable">关闭</option>
                                    <option value="1" {if $settings['enable_login_captcha']}selected{/if} data-i18n="admin.captcha.index.enable">开启</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.captcha.index.checkin_captcha">签到验证码</label>
                                <select id="enable_checkin_captcha" class="lmn-edit-select">
                                    <option value="0" {if !$settings['enable_checkin_captcha']}selected{/if} data-i18n="admin.captcha.index.disable">关闭</option>
                                    <option value="1" {if $settings['enable_checkin_captcha']}selected{/if} data-i18n="admin.captcha.index.enable">开启</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.captcha.index.reset_captcha">重置密码验证码</label>
                                <select id="enable_reset_password_captcha" class="lmn-edit-select">
                                    <option value="0" {if !$settings['enable_reset_password_captcha']}selected{/if} data-i18n="admin.captcha.index.disable">关闭</option>
                                    <option value="1" {if $settings['enable_reset_password_captcha']}selected{/if} data-i18n="admin.captcha.index.enable">开启</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Turnstile Panel -->
                <div class="lmn-billing-panel" id="panel-turnstile">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">shield</span>
                            <h2 class="lmn-edit-card-title">Turnstile</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Site Key</label>
                                <input id="turnstile_sitekey" type="text" class="lmn-edit-input"
                                       value="{$settings['turnstile_sitekey']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Secret</label>
                                <input id="turnstile_secret" type="text" class="lmn-edit-input"
                                       value="{$settings['turnstile_secret']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Geetest Panel -->
                <div class="lmn-billing-panel" id="panel-geetest">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">shield</span>
                            <h2 class="lmn-edit-card-title">Geetest</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">ID</label>
                                <input id="geetest_id" type="text" class="lmn-edit-input"
                                       value="{$settings['geetest_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Key</label>
                                <input id="geetest_key" type="text" class="lmn-edit-input"
                                       value="{$settings['geetest_key']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- hCaptcha Panel -->
                <div class="lmn-billing-panel" id="panel-hcaptcha">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">shield</span>
                            <h2 class="lmn-edit-card-title">hCaptcha</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Site Key</label>
                                <input id="hcaptcha_sitekey" type="text" class="lmn-edit-input"
                                       value="{$settings['hcaptcha_sitekey']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Secret</label>
                                <input id="hcaptcha_secret" type="text" class="lmn-edit-input"
                                       value="{$settings['hcaptcha_secret']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- reCAPTCHA Enterprise Panel -->
                <div class="lmn-billing-panel" id="panel-recaptcha">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">shield</span>
                            <h2 class="lmn-edit-card-title">reCAPTCHA Enterprise</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Key</label>
                                <input id="recaptcha_enterprise_key_id" type="text" class="lmn-edit-input"
                                       value="{$settings['recaptcha_enterprise_key_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Project ID</label>
                                <input id="recaptcha_enterprise_project_id" type="text" class="lmn-edit-input"
                                       value="{$settings['recaptcha_enterprise_project_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">API Key</label>
                                <input id="recaptcha_enterprise_api_key" type="text" class="lmn-edit-input"
                                       value="{$settings['recaptcha_enterprise_api_key']}">
                            </div>
                        </div>
                    </div>
                </div>

            </div><!-- /.lmn-billing-content -->
        </div><!-- /.lmn-billing-grid -->
    </div><!-- /.container-xl -->

    <script>
        // Tab switching
        document.querySelectorAll('.lmn-billing-tab-btn').forEach(function (btn) {
            btn.addEventListener('click', function () {
                document.querySelectorAll('.lmn-billing-tab-btn').forEach(function (b) {
                    b.classList.remove('is-active');
                });
                document.querySelectorAll('.lmn-billing-panel').forEach(function (p) {
                    p.classList.remove('is-active');
                });
                btn.classList.add('is-active');
                var panel = document.getElementById('panel-' + btn.dataset.tab);
                if (panel) panel.classList.add('is-active');
            });
        });

        // Save settings
        $("#save-setting").click(function () {
            $.ajax({
                url: '/admin/setting/captcha',
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
