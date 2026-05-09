{include file='admin/header.tpl'}

<link href="/assets/css/admin/billing.css{asset_ver path="/assets/css/admin/billing.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.billing.index.title">财务设置</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.billing.index.subtitle">设置站点的财务系统</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.billing.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <!-- ── Tab Navigation (Horizontal) ───────────────────── -->
            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="gateway">
                    <span data-i18n="admin.billing.index.tab_gateway">网关选择</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="f2f">
                    <span data-i18n="admin.billing.index.tab_f2f">支付宝当面付</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="stripe">
                    <span>Stripe</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="epay">
                    <span>EPay</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="paypal">
                    <span>PayPal</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="smogate">
                    <span>Smogate</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="cryptomus">
                    <span>Cryptomus</span>
                </button>
            </div>

            <!-- ── Content Area ───────────────────────────────────── -->
            <div class="lmn-billing-content">

                <!-- Gateway Panel -->
                <div class="lmn-billing-panel is-active" id="panel-gateway">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">hub</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.billing.index.gateway_list_title">支付方式列表</h2>
                        </div>
                        <div class="lmn-gateway-list">
                            {foreach $payment_gateways as $key => $value}
                            <div class="lmn-gateway-item">
                                <div class="lmn-gateway-item__info">
                                    <div class="lmn-gateway-item__icon">
                                        <span class="material-symbols-outlined">payments</span>
                                    </div>
                                    <div>
                                        <p class="lmn-gateway-item__name">{$key}</p>
                                    </div>
                                </div>
                                <label class="lmn-toggle">
                                    <input id="{$value}_enable" type="checkbox"
                                           {if in_array($value, $active_payment_gateway)}checked{/if}>
                                    <span class="lmn-toggle__track">
                                        <span class="lmn-toggle__thumb"></span>
                                    </span>
                                </label>
                            </div>
                            {/foreach}
                        </div>
                    </div>
                </div>

                <!-- Alipay F2F Panel -->
                <div class="lmn-billing-panel" id="panel-f2f">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">payments</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.billing.index.tab_f2f">支付宝当面付</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">App ID</label>
                                <input id="f2f_pay_app_id" type="text" class="lmn-edit-input"
                                       value="{$settings['f2f_pay_app_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">PID</label>
                                <input id="f2f_pay_pid" type="text" class="lmn-edit-input"
                                       value="{$settings['f2f_pay_pid']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.f2f_public_key">支付宝公钥</label>
                                <input id="f2f_pay_public_key" type="text" class="lmn-edit-input"
                                       value="{$settings['f2f_pay_public_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.f2f_private_key">应用私钥</label>
                                <input id="f2f_pay_private_key" type="text" class="lmn-edit-input"
                                       value="{$settings['f2f_pay_private_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.f2f_notify_url">自定义回调地址（可选）</label>
                                <input id="f2f_pay_notify_url" type="text" class="lmn-edit-input"
                                       value="{$settings['f2f_pay_notify_url']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Stripe Panel -->
                <div class="lmn-billing-panel" id="panel-stripe">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">credit_card</span>
                            <h2 class="lmn-edit-card-title">Stripe</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">API Key</label>
                                <input id="stripe_api_key" type="text" class="lmn-edit-input"
                                       value="{$settings['stripe_api_key']}">
                            </div>
                            <div class="lmn-billing-input-row">
                                <div class="lmn-edit-field">
                                    <label class="lmn-edit-label">Endpoint Secret</label>
                                    <input id="stripe_endpoint_secret" type="text" class="lmn-edit-input"
                                           value="{$settings['stripe_endpoint_secret']}">
                                </div>
                                <button class="lmn-billing-webhook-btn"
                                        hx-post="/admin/setting/billing/set_stripe_webhook" hx-swap="none"
                                        hx-vals='js:{ldelim}stripe_api_key: document.getElementById("stripe_api_key").value{rdelim}'>
                                    <span class="material-symbols-outlined">webhook</span>
                                    <span data-i18n="admin.billing.index.set_webhook">Set Webhook</span>
                                </button>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.stripe_currency">网关货币</label>
                                <input id="stripe_currency" type="text" class="lmn-edit-input"
                                       value="{$settings['stripe_currency']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.stripe_card">银行卡支付</label>
                                <select id="stripe_card" class="lmn-edit-select">
                                    <option value="0" data-i18n="admin.billing.index.disable">停用</option>
                                    <option value="1" {if $settings['stripe_card']}selected{/if} data-i18n="admin.billing.index.enable">启用</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.stripe_alipay">支付宝支付</label>
                                <select id="stripe_alipay" class="lmn-edit-select">
                                    <option value="0" data-i18n="admin.billing.index.disable">停用</option>
                                    <option value="1" {if $settings['stripe_alipay']}selected{/if} data-i18n="admin.billing.index.enable">启用</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.stripe_wechat">微信支付</label>
                                <select id="stripe_wechat" class="lmn-edit-select">
                                    <option value="0" data-i18n="admin.billing.index.disable">停用</option>
                                    <option value="1" {if $settings['stripe_wechat']}selected{/if} data-i18n="admin.billing.index.enable">启用</option>
                                </select>
                            </div>
                            <div class="lmn-edit-row-2">
                                <div class="lmn-edit-field">
                                    <label class="lmn-edit-label" data-i18n="admin.billing.index.stripe_min_recharge">最低充值限额（整数）</label>
                                    <input id="stripe_min_recharge" type="text" class="lmn-edit-input"
                                           value="{$settings['stripe_min_recharge']}">
                                </div>
                                <div class="lmn-edit-field">
                                    <label class="lmn-edit-label" data-i18n="admin.billing.index.stripe_max_recharge">最高充值限额（整数）</label>
                                    <input id="stripe_max_recharge" type="text" class="lmn-edit-input"
                                           value="{$settings['stripe_max_recharge']}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- EPay Panel -->
                <div class="lmn-billing-panel" id="panel-epay">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">account_balance</span>
                            <h2 class="lmn-edit-card-title">EPay</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.epay_url">网关地址</label>
                                <input id="epay_url" type="text" class="lmn-edit-input"
                                       value="{$settings['epay_url']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.epay_pid">商户ID</label>
                                <input id="epay_pid" type="text" class="lmn-edit-input"
                                       value="{$settings['epay_pid']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.epay_key">商户Key</label>
                                <input id="epay_key" type="text" class="lmn-edit-input"
                                       value="{$settings['epay_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.epay_sign_type">签名方式</label>
                                <input id="epay_sign_type" type="text" class="lmn-edit-input"
                                       value="{$settings['epay_sign_type']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.epay_alipay">支付宝</label>
                                <select id="epay_alipay" class="lmn-edit-select">
                                    <option value="0" data-i18n="admin.billing.index.disable">停用</option>
                                    <option value="1" {if $settings['epay_alipay']}selected{/if} data-i18n="admin.billing.index.enable">启用</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.epay_wechat">微信支付</label>
                                <select id="epay_wechat" class="lmn-edit-select">
                                    <option value="0" data-i18n="admin.billing.index.disable">停用</option>
                                    <option value="1" {if $settings['epay_wechat']}selected{/if} data-i18n="admin.billing.index.enable">启用</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.epay_qq">QQ钱包</label>
                                <select id="epay_qq" class="lmn-edit-select">
                                    <option value="0" data-i18n="admin.billing.index.disable">停用</option>
                                    <option value="1" {if $settings['epay_qq']}selected{/if} data-i18n="admin.billing.index.enable">启用</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">USDT</label>
                                <select id="epay_usdt" class="lmn-edit-select">
                                    <option value="0" data-i18n="admin.billing.index.disable">停用</option>
                                    <option value="1" {if $settings['epay_usdt']}selected{/if} data-i18n="admin.billing.index.enable">启用</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- PayPal Panel -->
                <div class="lmn-billing-panel" id="panel-paypal">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">universal_currency</span>
                            <h2 class="lmn-edit-card-title">PayPal</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Mode</label>
                                <select id="paypal_mode" class="lmn-edit-select">
                                    <option value="sandbox">Sandbox</option>
                                    <option value="live"
                                            {if $settings['paypal_mode'] === 'live'}selected{/if}>Live
                                    </option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Client ID</label>
                                <input id="paypal_client_id" type="text" class="lmn-edit-input"
                                       value="{$settings['paypal_client_id']}">
                            </div>
                            <div class="lmn-billing-input-row">
                                <div class="lmn-edit-field">
                                    <label class="lmn-edit-label">Client Secret</label>
                                    <input id="paypal_client_secret" type="text" class="lmn-edit-input"
                                           value="{$settings['paypal_client_secret']}">
                                </div>
                                <button class="lmn-billing-webhook-btn"
                                        hx-post="/admin/setting/billing/set_paypal_webhook" hx-swap="none"
                                        hx-vals='js:{ldelim}paypal_client_id: document.getElementById("paypal_client_id").value, paypal_client_secret: document.getElementById("paypal_client_secret").value{rdelim}'>
                                    <span class="material-symbols-outlined">webhook</span>
                                    <span data-i18n="admin.billing.index.set_webhook">Set Webhook</span>
                                </button>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.paypal_currency">Currency</label>
                                <input id="paypal_currency" type="text" class="lmn-edit-input"
                                       value="{$settings['paypal_currency']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.billing.index.paypal_locale">Language</label>
                                <input id="paypal_locale" type="text" class="lmn-edit-input"
                                       value="{$settings['paypal_locale']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Smogate Panel -->
                <div class="lmn-billing-panel" id="panel-smogate">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">currency_exchange</span>
                            <h2 class="lmn-edit-card-title">Smogate</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">App ID</label>
                                <input id="smogate_app_id" type="text" class="lmn-edit-input"
                                       value="{$settings['smogate_app_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">App Secret</label>
                                <input id="smogate_app_secret" type="text" class="lmn-edit-input"
                                       value="{$settings['smogate_app_secret']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Cryptomus Panel -->
                <div class="lmn-billing-panel" id="panel-cryptomus">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">currency_bitcoin</span>
                            <h2 class="lmn-edit-card-title">Cryptomus</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Api key</label>
                                <input id="cryptomus_api_key" type="password" class="lmn-edit-input"
                                       value="{$settings['cryptomus_api_key']}">
                                <p class="lmn-billing-hint" data-i18n="admin.billing.index.cryptomus_api_key_hint">You can find the API key in the settings of your personal account.</p>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">UUID</label>
                                <input id="cryptomus_uuid" type="text" class="lmn-edit-input"
                                       value="{$settings['cryptomus_uuid']}">
                                <p class="lmn-billing-hint" data-i18n="admin.billing.index.cryptomus_uuid_hint">You can find the UUID in the settings of your personal account.</p>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Subtract</label>
                                <input id="cryptomus_subtract" type="number" class="lmn-edit-input"
                                       value="{$settings['cryptomus_subtract']}">
                                <p class="lmn-billing-hint" data-i18n="admin.billing.index.cryptomus_subtract_hint">How much commission does the client pay (0-100%)</p>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Lifetime</label>
                                <input id="cryptomus_lifetime" type="number" class="lmn-edit-input"
                                       value="{$settings['cryptomus_lifetime']}">
                                <p class="lmn-billing-hint" data-i18n="admin.billing.index.cryptomus_lifetime_hint">The lifespan of the issued invoice.(In seconds)</p>
                            </div>
{*                            <div class="lmn-edit-field">*}
{*                                <label class="lmn-edit-label">Currency</label>*}
{*                                <input id="cryptomus_currency" type="text" class="lmn-edit-input"*}
{*                                       value="{$settings['cryptomus_currency']}">*}
{*                            </div>*}
                        </div>
                    </div>
                </div>

            </div><!-- /.lmn-billing-content -->
        </div><!-- /.lmn-billing-grid -->
    </div>
</div>

<script>
    // ── Tab switching ──────────────────────────────────────────────
    document.querySelectorAll('.lmn-billing-tab-btn').forEach(function (btn) {
        btn.addEventListener('click', function () {
            var tab = this.getAttribute('data-tab');
            document.querySelectorAll('.lmn-billing-tab-btn').forEach(function (b) {
                b.classList.remove('is-active');
            });
            document.querySelectorAll('.lmn-billing-panel').forEach(function (p) {
                p.classList.remove('is-active');
            });
            this.classList.add('is-active');
            var panel = document.getElementById('panel-' + tab);
            if (panel) { panel.classList.add('is-active'); }
        });
    });

    // ── Save settings ──────────────────────────────────────────────
    $('#save-setting').click(function () {
        $.ajax({
            url: '/admin/setting/billing',
            type: 'POST',
            dataType: 'json',
            data: {
                {foreach $update_field as $key}
                    {$key}: $('#{$key}').val(),
                {/foreach}
                {foreach $payment_gateways as $key => $value}
                    {$value}: $('#{$value}_enable').is(':checked'),
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

