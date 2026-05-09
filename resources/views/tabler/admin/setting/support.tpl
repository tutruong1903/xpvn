{include file='admin/header.tpl'}

<link href="/assets/css/admin/support.css{asset_ver path="/assets/css/admin/support.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.support.index.title">客服设置</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.support.index.subtitle">设置站点的客服系统</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.support.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <!-- Tab Navigation (Horizontal) -->
            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="support">
                    <span data-i18n="admin.support.index.tab_support">网页客服</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="ticket">
                    <span data-i18n="admin.support.index.tab_ticket">工单</span>
                </button>
            </div>

            <!-- Content Area -->
            <div class="lmn-billing-content">

                <!-- Live Chat Panel -->
                <div class="lmn-billing-panel is-active" id="panel-support">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">support_agent</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.support.index.tab_support">网页客服</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.support.index.provider_label">客服系统提供商</label>
                                <select id="live_chat" class="lmn-edit-select">
                                    <option value="none" {if $settings['live_chat'] === "none"}selected{/if}>None</option>
                                    <option value="crisp" {if $settings['live_chat'] === "crisp"}selected{/if}>Crisp</option>
                                    <option value="livechat" {if $settings['live_chat'] === "livechat"}selected{/if}>LiveChat</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Crisp ID</label>
                                <input id="crisp_id" type="text" class="lmn-edit-input"
                                       value="{$settings['crisp_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">LiveChat License</label>
                                <input id="livechat_license" type="text" class="lmn-edit-input"
                                       value="{$settings['livechat_license']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Ticket Panel -->
                <div class="lmn-billing-panel" id="panel-ticket">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">confirmation_number</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.support.index.tab_ticket">工单</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.support.index.enable_ticket">启用工单系统</label>
                                <select id="enable_ticket" class="lmn-edit-select">
                                    <option value="0" {if !$settings['enable_ticket']}selected{/if} data-i18n="admin.support.index.disable">关闭</option>
                                    <option value="1" {if $settings['enable_ticket']}selected{/if} data-i18n="admin.support.index.enable">开启</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.support.index.mail_ticket">启用工单邮件提醒</label>
                                <select id="mail_ticket" class="lmn-edit-select">
                                    <option value="0" {if !$settings['mail_ticket']}selected{/if} data-i18n="admin.support.index.disable">关闭</option>
                                    <option value="1" {if $settings['mail_ticket']}selected{/if} data-i18n="admin.support.index.enable">开启</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.support.index.ticket_limit">用户工单配额（每月）</label>
                                <input id="ticket_limit" type="text" class="lmn-edit-input"
                                       value="{$settings['ticket_limit']}">
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
                url: '/admin/setting/support',
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
