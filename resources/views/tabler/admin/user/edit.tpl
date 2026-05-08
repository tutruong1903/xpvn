{include file='admin/header.tpl'}

<link href="/assets/css/admin/user-edit.css{asset_ver path="/assets/css/admin/user-edit.css"}" rel="stylesheet"/>
<link rel="stylesheet" href="//{$config['jsdelivr_url']}/npm/flatpickr/dist/flatpickr.min.css">
{if $user->is_dark_mode}
    <link rel="stylesheet" href="//{$config['jsdelivr_url']}/npm/flatpickr/dist/themes/dark.min.css">
{/if}
<script src="//{$config['jsdelivr_url']}/npm/flatpickr"></script>


<div class="page-body">
    <div class="container-xl">
        <form class="lmn-edit-grid" id="edit-user-form">

            <!-- =====================================================
                 Column 1: Account Info + Activity History
                 ===================================================== -->
            <div class="lmn-edit-col">

                <!-- Account Information Card -->
                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">account_circle</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.user.edit.section_account">账户信息</h2>
                    </div>
                    <div class="lmn-edit-fields">
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.user.edit.field_email">EMAIL</label>
                            <input id="email" type="email" class="lmn-edit-input" value="{$edit_user->email}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.user.edit.field_username">用户名</label>
                            <input id="user_name" type="text" class="lmn-edit-input" value="{$edit_user->user_name}">
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.user.edit.field_password">密码</label>
                            <input id="pass" type="password" class="lmn-edit-input"
                                   data-i18n-placeholder="admin.user.edit.ph_password"
                                   placeholder="••••••••">
                        </div>
                        <div class="lmn-edit-row-2">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_balance">余额</label>
                                <input id="money" type="number" step="1" class="lmn-edit-input"
                                       value="{$edit_user->money}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_ref_by">邀请人</label>
                                <input id="ref_by" type="text" class="lmn-edit-input" value="{$edit_user->ref_by}">
                            </div>
                        </div>
                        <div class="lmn-edit-row-2">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_port">SS端口</label>
                                <input id="port" type="text" class="lmn-edit-input" value="{$edit_user->port}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_method">加密方式</label>
                                <select id="method" class="lmn-edit-select">
                                    {foreach $ss_methods as $method}
                                        <option value="{$method}" {if $edit_user->method === $method}selected{/if}>
                                            {$method}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Activity History -->
                <div class="lmn-edit-history">
                    <h3 class="lmn-edit-history-title">
                        <span class="material-symbols-outlined">history</span>
                        <span data-i18n="admin.user.edit.section_history">活动历史</span>
                    </h3>
                    <div class="lmn-edit-history-rows">
                        <div class="lmn-edit-history-row">
                            <span class="lmn-edit-history-label" data-i18n="admin.user.edit.history_reg_ip">注册IP</span>
                            <span class="lmn-edit-history-val lmn-mono">{$edit_user->reg_ip}</span>
                        </div>
                        <div class="lmn-edit-history-row">
                            <span class="lmn-edit-history-label" data-i18n="admin.user.edit.history_reg_date">注册日期</span>
                            <span class="lmn-edit-history-val">{$edit_user->reg_date}</span>
                        </div>
                        <div class="lmn-edit-history-row">
                            <span class="lmn-edit-history-label" data-i18n="admin.user.edit.history_last_use">最后使用</span>
                            <span class="lmn-edit-history-val">{$edit_user->lastUseTime()}</span>
                        </div>
                        <div class="lmn-edit-history-row">
                            <span class="lmn-edit-history-label" data-i18n="admin.user.edit.history_last_checkin">最后签到</span>
                            <span class="lmn-edit-history-val">{$edit_user->lastCheckInTime()}</span>
                        </div>
                        <div class="lmn-edit-history-row">
                            <span class="lmn-edit-history-label" data-i18n="admin.user.edit.history_last_login">最后登录</span>
                            <span class="lmn-edit-history-val">{$edit_user->last_login_time}</span>
                        </div>
                    </div>
                </div>

            </div>

            <!-- =====================================================
                 Column 2: Usage Limits
                 ===================================================== -->
            <div class="lmn-edit-col">

                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">speed</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.user.edit.section_usage">使用限制</h2>
                    </div>
                    <div class="lmn-edit-fields">
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.user.edit.field_transfer_enable">流量限制 (GB)</label>
                            <input id="transfer_enable" type="text" class="lmn-edit-input"
                                   value="{$edit_user->enableTraffic()}">
                        </div>
                        <div class="lmn-edit-row-2">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_transfer_used">当期用量</label>
                                <div class="lmn-edit-readonly">{$edit_user->usedTraffic()}</div>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_transfer_total">累计用量</label>
                                <div class="lmn-edit-readonly">{$edit_user->totalTraffic()}</div>
                            </div>
                        </div>
                        <div class="lmn-edit-row-2">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_class">等级</label>
                                <select id="class" class="lmn-edit-select">
                                    <option value="0" {if $edit_user->class === 0}selected{/if}
                                            data-i18n="admin.user.edit.level_basic">Basic</option>
                                    <option value="1" {if $edit_user->class === 1}selected{/if}
                                            data-i18n="admin.user.edit.level_standard">Standard</option>
                                    <option value="2" {if $edit_user->class === 2}selected{/if}
                                            data-i18n="admin.user.edit.level_premium">Premium</option>
                                    <option value="3" {if $edit_user->class >= 3}selected{/if}
                                            data-i18n="admin.user.edit.level_vip">VIP</option>
                                </select>
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_node_group">节点群组</label>
                                <input id="node_group" type="number" class="lmn-edit-input" min="0"
                                       value="{$edit_user->node_group}">
                            </div>
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.user.edit.field_class_expire">等级过期时间</label>
                            <input id="class_expire" type="text" class="lmn-edit-input"
                                   value="{$edit_user->class_expire}" readonly>
                        </div>
                        <div class="lmn-edit-row-2">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_auto_reset_day">流量重置日</label>
                                <input id="auto_reset_day" type="number" class="lmn-edit-input"
                                       value="{$edit_user->auto_reset_day}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_auto_reset_bandwidth">重置流量 (GB)</label>
                                <input id="auto_reset_bandwidth" type="number" class="lmn-edit-input"
                                       value="{$edit_user->auto_reset_bandwidth}">
                            </div>
                        </div>
                        <div class="lmn-edit-row-2">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_speedlimit">速度限制 (Mbps)</label>
                                <input id="node_speedlimit" type="number" class="lmn-edit-input"
                                       value="{$edit_user->node_speedlimit}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.user.edit.field_iplimit">同时连接限制</label>
                                <input id="node_iplimit" type="number" class="lmn-edit-input"
                                       value="{$edit_user->node_iplimit}">
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- =====================================================
                 Column 3: Other Settings + Action Buttons
                 ===================================================== -->
            <div class="lmn-edit-col">

                <div class="lmn-edit-card">
                    <div class="lmn-edit-card-header">
                        <span class="material-symbols-outlined lmn-edit-card-icon">settings_applications</span>
                        <h2 class="lmn-edit-card-title" data-i18n="admin.user.edit.section_other">其他设置</h2>
                    </div>
                    <div class="lmn-edit-fields">
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.user.edit.field_locale">显示语言</label>
                            <select id="locale" class="lmn-edit-select">
                                {foreach $locales as $locale}
                                    <option value="{$locale}" {if $edit_user->locale === $locale}selected{/if}>
                                        {$locale}
                                    </option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="lmn-edit-toggles">
                            <div class="lmn-edit-toggle-row">
                                <span class="lmn-edit-toggle-label" data-i18n="admin.user.edit.field_is_admin">管理员权限</span>
                                <label class="lmn-toggle">
                                    <input id="is_admin" type="checkbox" class="lmn-toggle-input"
                                           {if $edit_user->is_admin}checked{/if}>
                                    <span class="lmn-toggle-track"></span>
                                </label>
                            </div>
                            <div class="lmn-edit-toggle-row">
                                <span class="lmn-edit-toggle-label" data-i18n="admin.user.edit.field_is_shadow_banned">Shadow Ban</span>
                                <label class="lmn-toggle lmn-toggle--danger">
                                    <input id="is_shadow_banned" type="checkbox" class="lmn-toggle-input"
                                           {if $edit_user->is_shadow_banned}checked{/if}>
                                    <span class="lmn-toggle-track"></span>
                                </label>
                            </div>
                            <div class="lmn-edit-toggle-row">
                                <span class="lmn-edit-toggle-label" data-i18n="admin.user.edit.field_is_banned">封禁用户</span>
                                <label class="lmn-toggle lmn-toggle--danger">
                                    <input id="is_banned" type="checkbox" class="lmn-toggle-input"
                                           {if $edit_user->is_banned}checked{/if}>
                                    <span class="lmn-toggle-track"></span>
                                </label>
                            </div>
                        </div>

                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.user.edit.field_banned_reason">封禁理由</label>
                            <textarea id="banned_reason" class="lmn-edit-textarea" rows="2"
                                      data-i18n-placeholder="admin.user.edit.ph_banned_reason"
                                      placeholder="手动封禁理由...">{$edit_user->banned_reason}</textarea>
                        </div>
                        <div class="lmn-edit-field">
                            <label class="lmn-edit-label" data-i18n="admin.user.edit.field_remark">账户备注</label>
                            <textarea id="remark" class="lmn-edit-textarea" rows="3"
                                      data-i18n-placeholder="admin.user.edit.ph_remark"
                                      placeholder="仅管理员可见...">{$edit_user->remark}</textarea>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="lmn-edit-actions">
                    <button id="save_changes" type="button" class="lmn-btn-save">
                        <span data-i18n="admin.user.edit.save_btn">保存更改</span>
                    </button>
                    <button type="button" class="lmn-btn-cancel" onclick="history.back()">
                        <span data-i18n="admin.user.edit.cancel_btn">取消</span>
                    </button>
                </div>

            </div>
        </form>
    </div>
</div>

<script>
    flatpickr("#class_expire", {
        enableTime: true,
        dateFormat: "Y-m-d H:i:S",
        time_24hr: true,
        minDate: "today",
    });

    $("#save_changes").click(function () {
        $.ajax({
            url: '/admin/user/{$edit_user->id}',
            type: 'PUT',
            dataType: "json",
            data: {
                {foreach $update_field as $key}
                '{$key}': $('#{$key}').val(),
                {/foreach}
                is_admin: $("#is_admin").is(":checked"),
                is_shadow_banned: $("#is_shadow_banned").is(":checked"),
                is_banned: $("#is_banned").is(":checked"),
            },
            success: function (data) {
                if (data.ret === 1) {
                    $('#success-message').text(data.msg);
                    $('#success-dialog').modal('show');
                    window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
                } else {
                    $('#fail-message').text(data.msg);
                    $('#fail-dialog').modal('show');
                }
            }
        });
    });
</script>

{include file='admin/footer.tpl'}

