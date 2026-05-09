{include file='admin/header.tpl'}

<link href="/assets/css/admin/ref.css{asset_ver path="/assets/css/admin/ref.css"}" rel="stylesheet"/>

<div class="container-xl">
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.ref.index.title">邀请设置</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.ref.index.subtitle">管理站点的邀请设置</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.ref.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="invite">
                    <span data-i18n="admin.ref.index.tab_invite">邀请奖励</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="rebate">
                    <span data-i18n="admin.ref.index.tab_rebate">返利</span>
                </button>
            </div>

            <div class="lmn-billing-content">

                <!-- Invite Rewards Panel -->
                <div class="lmn-billing-panel is-active" id="panel-invite">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">card_giftcard</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.ref.index.tab_invite">邀请奖励</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.ref.index.invite_reg_money_reward">被邀请者初始账户余额（USD）</label>
                                <input id="invite_reg_money_reward" type="text" class="lmn-edit-input"
                                       value="{$settings['invite_reg_money_reward']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.ref.index.invite_reg_traffic_reward">邀请者流量奖励（GB）</label>
                                <input id="invite_reg_traffic_reward" type="text" class="lmn-edit-input"
                                       value="{$settings['invite_reg_traffic_reward']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Rebate Panel -->
                <div class="lmn-billing-panel" id="panel-rebate">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">currency_exchange</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.ref.index.tab_rebate">返利</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.ref.index.invite_mode">返利模式</label>
                                <select id="invite_mode" class="lmn-edit-select">
                                    <option value="reg_only" {if $settings['invite_mode'] === 'reg_only'}selected{/if} data-i18n="admin.ref.index.invite_mode_none">不返利</option>
                                    <option value="reward" {if $settings['invite_mode'] === 'reward'}selected{/if} data-i18n="admin.ref.index.invite_mode_reward">被邀请用户支付账单时返利</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.ref.index.invite_reward_mode">返利奖励模式</label>
                                <select id="invite_reward_mode" class="lmn-edit-select">
                                    <option value="reward_count" {if $settings['invite_reward_mode'] === 'reward_count'}selected{/if} data-i18n="admin.ref.index.invite_reward_mode_count">限制返利次数</option>
                                    <option value="reward_total" {if $settings['invite_reward_mode'] === 'reward_total'}selected{/if} data-i18n="admin.ref.index.invite_reward_mode_total">限制返利金额</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.ref.index.invite_reward_rate">返利比例，10% 填 0.1</label>
                                <input id="invite_reward_rate" type="text" class="lmn-edit-input"
                                       value="{$settings['invite_reward_rate']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.ref.index.invite_reward_count_limit">返利次数限制</label>
                                <input id="invite_reward_count_limit" type="text" class="lmn-edit-input"
                                       value="{$settings['invite_reward_count_limit']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.ref.index.invite_reward_total_limit">返利金额限制</label>
                                <input id="invite_reward_total_limit" type="text" class="lmn-edit-input"
                                       value="{$settings['invite_reward_total_limit']}">
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
                url: '/admin/setting/ref',
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
