{include file='admin/header.tpl'}

<link href="/assets/css/admin/im.css{asset_ver path="/assets/css/admin/im.css"}" rel="stylesheet"/>

<div class="container-xl">
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.im.index.title">IM 设置</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.im.index.subtitle">管理站点的 IM 集成设置</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.im.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <!-- Tab Navigation -->
            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="notification">
                    <span data-i18n="admin.im.index.tab_notification">通知</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="telegram">
                    <span data-i18n="admin.im.index.tab_telegram">Telegram Bot</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="discord">
                    <span data-i18n="admin.im.index.tab_discord">Discord Bot</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="slack">
                    <span data-i18n="admin.im.index.tab_slack">Slack Bot</span>
                </button>
            </div>

            <!-- Content Area -->
            <div class="lmn-billing-content">

                <!-- Notification Panel -->
                <div class="lmn-billing-panel is-active" data-panel="notification">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined">notifications</span>
                            <span data-i18n="admin.im.index.tab_notification">通知</span>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_add_node">节点新增</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_add_node" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_add_node']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_add_node']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_update_node">节点更新</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_update_node" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_update_node']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_update_node']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_delete_node">节点删除</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_delete_node" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_delete_node']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_delete_node']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_node_gfwed">节点被墙</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_node_gfwed" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_node_gfwed']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_node_gfwed']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_node_ungfwed">节点解封</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_node_ungfwed" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_node_ungfwed']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_node_ungfwed']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_node_online">节点上线</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_node_online" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_node_online']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_node_online']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_node_offline">节点下线</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_node_offline" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_node_offline']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_node_offline']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_daily_job">每日任务</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_daily_job" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_daily_job']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_daily_job']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_diary">系统日志</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_diary" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_diary']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_diary']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_ann_create">公告创建</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_ann_create" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_ann_create']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_ann_create']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.notify_ann_update">公告更新</label>
                                <div class="lmn-edit-input">
                                    <select id="im_bot_group_notify_ann_update" class="lmn-edit-select">
                                        <option value="0" {if !$settings['im_bot_group_notify_ann_update']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['im_bot_group_notify_ann_update']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Telegram Panel -->
                <div class="lmn-billing-panel" data-panel="telegram">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined">send</span>
                            <span data-i18n="admin.im.index.tab_telegram">Telegram Bot</span>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Bot Token</label>
                                <div class="lmn-edit-input" style="display:flex;gap:8px;align-items:center;">
                                    <input id="telegram_token" type="text" class="lmn-edit-text" value="{$settings['telegram_token']}">
                                    <button class="lmn-btn-secondary lmn-btn-sm"
                                            hx-post="/admin/setting/im/set_webhook/telegram" hx-swap="none"
                                            hx-vals='js:{ldelim}"bot_token": document.getElementById("telegram_token").value{rdelim}'>
                                        <span data-i18n="admin.im.index.tg_set_webhook">Set Webhook</span>
                                    </button>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Webhook Token</label>
                                <div class="lmn-edit-input" style="display:flex;gap:8px;align-items:center;">
                                    <input id="telegram_webhook_token" type="text" class="lmn-edit-text" value="{$settings['telegram_webhook_token']}" disabled>
                                    <button class="lmn-btn-secondary lmn-btn-sm"
                                            hx-post="/admin/setting/im/reset_webhook_token/telegram" hx-swap="none">
                                        <span data-i18n="admin.im.index.tg_reset_token">Reset Webhook Token</span>
                                    </button>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Bot Username</label>
                                <div class="lmn-edit-input">
                                    <input id="telegram_bot" type="text" class="lmn-edit-text" value="{$settings['telegram_bot']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Group Chat ID</label>
                                <div class="lmn-edit-input">
                                    <input id="telegram_chatid" type="text" class="lmn-edit-text" value="{$settings['telegram_chatid']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Enable Group Notify</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_telegram_group_notify" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_telegram_group_notify']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_telegram_group_notify']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.tg_unbind_kick">Telegram 解绑时自动踢出群组</label>
                                <div class="lmn-edit-input">
                                    <select id="telegram_unbind_kick_member" class="lmn-edit-select">
                                        <option value="0" {if !$settings['telegram_unbind_kick_member']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['telegram_unbind_kick_member']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.tg_group_bound">仅允许已绑定用户加入群组</label>
                                <div class="lmn-edit-input">
                                    <select id="telegram_group_bound_user" class="lmn-edit-select">
                                        <option value="0" {if !$settings['telegram_group_bound_user']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['telegram_group_bound_user']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.tg_welcome_msg">Bot 发送欢迎消息</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_welcome_message" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_welcome_message']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_welcome_message']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.tg_group_quiet">Bot 在群组中保持静默</label>
                                <div class="lmn-edit-input">
                                    <select id="telegram_group_quiet" class="lmn-edit-select">
                                        <option value="0" {if !$settings['telegram_group_quiet']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['telegram_group_quiet']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.tg_allow_new_group">允许 Bot 加入其他群组</label>
                                <div class="lmn-edit-input">
                                    <select id="allow_to_join_new_groups" class="lmn-edit-select">
                                        <option value="0" {if !$settings['allow_to_join_new_groups']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['allow_to_join_new_groups']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.tg_group_id_allow">允许加入的群组 ID</label>
                                <div class="lmn-edit-input">
                                    <input id="group_id_allowed_to_join" type="text" class="lmn-edit-text" value="{$settings['group_id_allowed_to_join']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.tg_help_any_cmd">未知命令触发 /help</label>
                                <div class="lmn-edit-input">
                                    <select id="help_any_command" class="lmn-edit-select">
                                        <option value="0" {if !$settings['help_any_command']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['help_any_command']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.tg_test_chat_id">Telegram Chat ID</label>
                                <div class="lmn-edit-input" style="display:flex;gap:8px;align-items:center;">
                                    <input id="telegram_chat_id" type="text" class="lmn-edit-text" value="">
                                    <button class="lmn-btn-secondary lmn-btn-sm"
                                            hx-post="/admin/setting/test/telegram" hx-swap="none"
                                            hx-vals='js:{ldelim}"telegram_chat_id": document.getElementById("telegram_chat_id").value{rdelim}'>
                                        <span data-i18n="admin.im.index.tg_send_test">发送测试消息</span>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Discord Panel -->
                <div class="lmn-billing-panel" data-panel="discord">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined">forum</span>
                            <span data-i18n="admin.im.index.tab_discord">Discord Bot</span>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Bot Token</label>
                                <div class="lmn-edit-input">
                                    <input id="discord_bot_token" type="text" class="lmn-edit-text" value="{$settings['discord_bot_token']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Client ID</label>
                                <div class="lmn-edit-input">
                                    <input id="discord_client_id" type="text" class="lmn-edit-text" value="{$settings['discord_client_id']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Client Secret</label>
                                <div class="lmn-edit-input">
                                    <input id="discord_client_secret" type="text" class="lmn-edit-text" value="{$settings['discord_client_secret']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Guild ID</label>
                                <div class="lmn-edit-input">
                                    <input id="discord_guild_id" type="text" class="lmn-edit-text" value="{$settings['discord_guild_id']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Channel ID</label>
                                <div class="lmn-edit-input">
                                    <input id="discord_channel_id" type="text" class="lmn-edit-text" value="{$settings['discord_channel_id']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Enable Channel Notify</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_discord_channel_notify" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_discord_channel_notify']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_discord_channel_notify']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.discord_test_label">Discord User ID / Channel ID</label>
                                <div class="lmn-edit-input" style="display:flex;gap:8px;align-items:center;">
                                    <input id="discord_test_channel_id" type="text" class="lmn-edit-text" value="">
                                    <button class="lmn-btn-secondary lmn-btn-sm"
                                            hx-post="/admin/setting/test/discord" hx-swap="none"
                                            hx-vals='js:{ldelim}"discord_channel_id": document.getElementById("discord_test_channel_id").value{rdelim}'>
                                        <span data-i18n="admin.im.index.discord_send_test">发送测试消息</span>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Slack Panel -->
                <div class="lmn-billing-panel" data-panel="slack">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined">chat</span>
                            <span data-i18n="admin.im.index.tab_slack">Slack Bot</span>
                        </div>
                        <div class="lmn-edit-fields">

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">App Token</label>
                                <div class="lmn-edit-input">
                                    <input id="slack_token" type="text" class="lmn-edit-text" value="{$settings['slack_token']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Client ID</label>
                                <div class="lmn-edit-input">
                                    <input id="slack_client_id" type="text" class="lmn-edit-text" value="{$settings['slack_client_id']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Client Secret</label>
                                <div class="lmn-edit-input">
                                    <input id="slack_client_secret" type="text" class="lmn-edit-text" value="{$settings['slack_client_secret']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Team ID</label>
                                <div class="lmn-edit-input">
                                    <input id="slack_team_id" type="text" class="lmn-edit-text" value="{$settings['slack_team_id']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Channel ID</label>
                                <div class="lmn-edit-input">
                                    <input id="slack_channel_id" type="text" class="lmn-edit-text" value="{$settings['slack_channel_id']}">
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label">Enable Channel Notify</label>
                                <div class="lmn-edit-input">
                                    <select id="enable_slack_channel_notify" class="lmn-edit-select">
                                        <option value="0" {if !$settings['enable_slack_channel_notify']}selected{/if} data-i18n="admin.im.index.disable">关闭</option>
                                        <option value="1" {if $settings['enable_slack_channel_notify']}selected{/if} data-i18n="admin.im.index.enable">开启</option>
                                    </select>
                                </div>
                            </div>

                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.im.index.slack_test_label">Slack User ID / Channel ID</label>
                                <div class="lmn-edit-input" style="display:flex;gap:8px;align-items:center;">
                                    <input id="slack_test_channel_id" type="text" class="lmn-edit-text" value="">
                                    <button class="lmn-btn-secondary lmn-btn-sm"
                                            hx-post="/admin/setting/test/slack" hx-swap="none"
                                            hx-vals='js:{ldelim}"slack_channel_id": document.getElementById("slack_test_channel_id").value{rdelim}'>
                                        <span data-i18n="admin.im.index.slack_send_test">发送测试消息</span>
                                    </button>
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
        fetch('/admin/setting/im', {
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
