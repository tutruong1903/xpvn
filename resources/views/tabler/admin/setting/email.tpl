{include file='admin/header.tpl'}

<link href="/assets/css/admin/email.css{asset_ver path="/assets/css/admin/email.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.email.index.title">邮件设置</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.email.index.subtitle">设置站点的邮件系统</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.email.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <!-- Tab Navigation (Horizontal) -->
            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="email">
                    <span data-i18n="admin.email.index.tab_email">邮件设置</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="limit">
                    <span data-i18n="admin.email.index.tab_limit">发送限制</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="smtp">
                    <span>SMTP</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="mailgun">
                    <span>Mailgun</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="sendgrid">
                    <span>Sendgrid</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="postal">
                    <span>Postal</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="ses">
                    <span>AWS SES</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="mailchimp">
                    <span>Mailchimp</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="alibaba">
                    <span>AlibabaCloud DM</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="postmark">
                    <span>Postmark</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="resend">
                    <span>Resend</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="google_app_password">
                    <span>Google App Password</span>
                </button>
            </div>

            <!-- Content Area -->
            <div class="lmn-billing-content">

                <!-- Email Settings Panel -->
                <div class="lmn-billing-panel is-active" id="panel-email">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">mail</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.email.index.tab_email">邮件设置</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.email.index.driver_label">邮件服务提供商</label>
                                <select id="email_driver" class="lmn-edit-select">
                                    <option value="none" {if $settings['email_driver'] === "none"}selected{/if}>None</option>
                                    <option value="smtp" {if $settings['email_driver'] === "smtp"}selected{/if}>SMTP</option>
                                    <option value="mailgun" {if $settings['email_driver'] === "mailgun"}selected{/if}>Mailgun</option>
                                    <option value="sendgrid" {if $settings['email_driver'] === "sendgrid"}selected{/if}>Sendgrid</option>
                                    <option value="postal" {if $settings['email_driver'] === "postal"}selected{/if}>Postal</option>
                                    <option value="ses" {if $settings['email_driver'] === "ses"}selected{/if}>AWS SES</option>
                                    <option value="mailchimp" {if $settings['email_driver'] === "mailchimp"}selected{/if}>Mailchimp</option>
                                    <option value="alibabacloud" {if $settings['email_driver'] === "alibabacloud"}selected{/if}>AlibabaCloud DM</option>
                                    <option value="resend" {if $settings['email_driver'] === "resend"}selected{/if}>Resend</option>
                                    <option value="postmark" {if $settings['email_driver'] === "postmark"}selected{/if}>Postmark</option>
                                    <option value="google_app_password" {if $settings['email_driver'] === "google_app_password"}selected{/if}>Google App Password</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.email.index.test_recipient">测试邮件接收地址</label>
                                <div class="lmn-email-test-row">
                                    <div class="lmn-edit-field" style="margin: 0;">
                                        <input type="text" id="recipient" class="lmn-edit-input" value="">
                                    </div>
                                    <button id="test-email" class="lmn-email-test-btn">
                                        <span class="material-symbols-outlined">send</span>
                                        <span data-i18n="admin.email.index.test_send_btn">发送测试邮件</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Send Limit Panel -->
                <div class="lmn-billing-panel" id="panel-limit">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">speed</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.email.index.tab_limit">发送限制</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.email.index.verify_code_ttl">邮箱验证码有效期（秒）</label>
                                <input id="email_verify_code_ttl" type="text" class="lmn-edit-input"
                                       value="{$settings['email_verify_code_ttl']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.email.index.password_reset_ttl">邮箱重设密码链接有效期（秒）</label>
                                <input id="email_password_reset_ttl" type="text" class="lmn-edit-input"
                                       value="{$settings['email_password_reset_ttl']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.email.index.ip_limit">单个IP每小时可请求的发信次数</label>
                                <input id="email_request_ip_limit" type="text" class="lmn-edit-input"
                                       value="{$settings['email_request_ip_limit']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.email.index.address_limit">单个邮箱地址每小时可请求的发信次数</label>
                                <input id="email_request_address_limit" type="text" class="lmn-edit-input"
                                       value="{$settings['email_request_address_limit']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SMTP Panel -->
                <div class="lmn-billing-panel" id="panel-smtp">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">dns</span>
                            <h2 class="lmn-edit-card-title">SMTP</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Host</label>
                                <input id="smtp_host" type="text" class="lmn-edit-input"
                                       value="{$settings['smtp_host']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Username</label>
                                <input id="smtp_username" type="text" class="lmn-edit-input"
                                       value="{$settings['smtp_username']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Password</label>
                                <input id="smtp_password" type="text" class="lmn-edit-input"
                                       value="{$settings['smtp_password']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Port</label>
                                <select id="smtp_port" class="lmn-edit-select">
                                    <option value="465" {if $settings['smtp_port'] === "465"}selected{/if}>465</option>
                                    <option value="587" {if $settings['smtp_port'] === "587"}selected{/if}>587</option>
                                    <option value="443" {if $settings['smtp_port'] === "443"}selected{/if}>443</option>
                                    <option value="80" {if $settings['smtp_port'] === "80"}selected{/if}>80</option>
                                    <option value="2525" {if $settings['smtp_port'] === "2525"}selected{/if}>2525</option>
                                    <option value="25" {if $settings['smtp_port'] === "25"}selected{/if}>25</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Name</label>
                                <input id="smtp_name" type="text" class="lmn-edit-input"
                                       value="{$settings['smtp_name']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.email.index.smtp_sender">Sender</label>
                                <input id="smtp_sender" type="text" class="lmn-edit-input"
                                       value="{$settings['smtp_sender']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.email.index.smtp_ssl">Enable TLS/SSL</label>
                                <select id="smtp_ssl" class="lmn-edit-select">
                                    <option value="0" {if !$settings['smtp_ssl']}selected{/if}>False</option>
                                    <option value="1" {if $settings['smtp_ssl']}selected{/if}>True</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.email.index.smtp_bbc">BCC</label>
                                <input id="smtp_bbc" type="text" class="lmn-edit-input"
                                       value="{$settings['smtp_bbc']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Mailgun Panel -->
                <div class="lmn-billing-panel" id="panel-mailgun">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">mail_lock</span>
                            <h2 class="lmn-edit-card-title">Mailgun</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">API Key</label>
                                <input id="mailgun_key" type="text" class="lmn-edit-input"
                                       value="{$settings['mailgun_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Domain</label>
                                <input id="mailgun_domain" type="text" class="lmn-edit-input"
                                       value="{$settings['mailgun_domain']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Sender</label>
                                <input id="mailgun_sender" type="text" class="lmn-edit-input"
                                       value="{$settings['mailgun_sender']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Sender Name</label>
                                <input id="mailgun_sender_name" type="text" class="lmn-edit-input"
                                       value="{$settings['mailgun_sender_name']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sendgrid Panel -->
                <div class="lmn-billing-panel" id="panel-sendgrid">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">mail_lock</span>
                            <h2 class="lmn-edit-card-title">Sendgrid</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">API Key</label>
                                <input id="sendgrid_key" type="text" class="lmn-edit-input"
                                       value="{$settings['sendgrid_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Sender</label>
                                <input id="sendgrid_sender" type="text" class="lmn-edit-input"
                                       value="{$settings['sendgrid_sender']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Name</label>
                                <input id="sendgrid_name" type="text" class="lmn-edit-input"
                                       value="{$settings['sendgrid_name']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Postal Panel -->
                <div class="lmn-billing-panel" id="panel-postal">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">mail_lock</span>
                            <h2 class="lmn-edit-card-title">Postal</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Host</label>
                                <input id="postal_host" type="text" class="lmn-edit-input"
                                       value="{$settings['postal_host']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">API Key</label>
                                <input id="postal_key" type="text" class="lmn-edit-input"
                                       value="{$settings['postal_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Sender</label>
                                <input id="postal_sender" type="text" class="lmn-edit-input"
                                       value="{$settings['postal_sender']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Name</label>
                                <input id="postal_name" type="text" class="lmn-edit-input"
                                       value="{$settings['postal_name']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- AWS SES Panel -->
                <div class="lmn-billing-panel" id="panel-ses">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">cloud</span>
                            <h2 class="lmn-edit-card-title">AWS SES</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Access Key ID</label>
                                <input id="aws_ses_access_key_id" type="text" class="lmn-edit-input"
                                       value="{$settings['aws_ses_access_key_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Access Key Secret</label>
                                <input id="aws_ses_access_key_secret" type="text" class="lmn-edit-input"
                                       value="{$settings['aws_ses_access_key_secret']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Region</label>
                                <input id="aws_ses_region" type="text" class="lmn-edit-input"
                                       value="{$settings['aws_ses_region']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Sender</label>
                                <input id="aws_ses_sender" type="text" class="lmn-edit-input"
                                       value="{$settings['aws_ses_sender']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Mailchimp Panel -->
                <div class="lmn-billing-panel" id="panel-mailchimp">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">mail_lock</span>
                            <h2 class="lmn-edit-card-title">Mailchimp</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">API Key</label>
                                <input id="mailchimp_key" type="text" class="lmn-edit-input"
                                       value="{$settings['mailchimp_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">From Email</label>
                                <input id="mailchimp_from_email" type="text" class="lmn-edit-input"
                                       value="{$settings['mailchimp_from_email']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">From Name</label>
                                <input id="mailchimp_from_name" type="text" class="lmn-edit-input"
                                       value="{$settings['mailchimp_from_name']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- AlibabaCloud DM Panel -->
                <div class="lmn-billing-panel" id="panel-alibaba">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">cloud</span>
                            <h2 class="lmn-edit-card-title">AlibabaCloud DM</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Access Key ID</label>
                                <input id="alibabacloud_dm_access_key_id" type="text" class="lmn-edit-input"
                                       value="{$settings['alibabacloud_dm_access_key_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Access Key Secret</label>
                                <input id="alibabacloud_dm_access_key_secret" type="text" class="lmn-edit-input"
                                       value="{$settings['alibabacloud_dm_access_key_secret']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Endpoint</label>
                                <input id="alibabacloud_dm_endpoint" type="text" class="lmn-edit-input"
                                       value="{$settings['alibabacloud_dm_endpoint']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Account Name</label>
                                <input id="alibabacloud_dm_account_name" type="text" class="lmn-edit-input"
                                       value="{$settings['alibabacloud_dm_account_name']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">From Alias</label>
                                <input id="alibabacloud_dm_from_alias" type="text" class="lmn-edit-input"
                                       value="{$settings['alibabacloud_dm_from_alias']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Postmark Panel -->
                <div class="lmn-billing-panel" id="panel-postmark">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">mail_lock</span>
                            <h2 class="lmn-edit-card-title">Postmark</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">API Key</label>
                                <input id="postmark_key" type="text" class="lmn-edit-input"
                                       value="{$settings['postmark_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.email.index.postmark_sender">Sender</label>
                                <input id="postmark_sender" type="text" class="lmn-edit-input"
                                       value="{$settings['postmark_sender']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Stream</label>
                                <input id="postmark_stream" type="text" class="lmn-edit-input"
                                       value="{$settings['postmark_stream']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Resend Panel -->
                <div class="lmn-billing-panel" id="panel-resend">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">mail_lock</span>
                            <h2 class="lmn-edit-card-title">Resend</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">API Key</label>
                                <input id="resend_api_key" type="text" class="lmn-edit-input"
                                       value="{$settings['resend_api_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">From</label>
                                <input id="resend_from" type="text" class="lmn-edit-input"
                                       value="{$settings['resend_from']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Google App Password Panel -->
                <div class="lmn-billing-panel" id="panel-google_app_password">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">mail_lock</span>
                            <h2 class="lmn-edit-card-title">Google App Password</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Gmail Address</label>
                                <input id="google_app_password_username" type="text" class="lmn-edit-input"
                                       value="{$settings['google_app_password_username']|default:''}" placeholder="your-email@gmail.com">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">App Password</label>
                                <input id="google_app_password_password" type="text" class="lmn-edit-input"
                                       value="{$settings['google_app_password_password']|default:''}" placeholder="xxxx xxxx xxxx xxxx">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Sender Name</label>
                                <input id="google_app_password_sender_name" type="text" class="lmn-edit-input"
                                       value="{$settings['google_app_password_sender_name']|default:''}" placeholder="Your Site Name">
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
                url: '/admin/setting/email',
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

        // Test email
        $("#test-email").click(function () {
            $.ajax({
                url: '/admin/setting/test/email',
                type: 'POST',
                dataType: "json",
                data: {
                    recipient: $('#recipient').val(),
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
