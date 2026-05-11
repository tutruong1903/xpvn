{include file='admin/header.tpl'}

<link href="/assets/css/admin/ann-create.css{asset_ver path="/assets/css/admin/ann-create.css"}" rel="stylesheet"/>

<div class="page-body">
    <div class="container-xl">

        <div class="lmn-ann-header">
            <h1 class="lmn-ann-title" data-i18n="admin.ann.create.title">创建公告</h1>
            <p class="lmn-ann-subtitle" data-i18n="admin.ann.create.subtitle">向用户发布重要新闻和公告。</p>
        </div>

        <div class="lmn-ann-grid">

            <!-- Editor Column -->
            <div>
                <div class="lmn-ann-card">
                    <div class="lmn-ann-card-body">
                        <div class="lmn-ann-editor-wrap">
                            <form method="post">
                                <textarea id="tinymce"></textarea>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sidebar: Publish Settings -->
            <div>
                <div class="lmn-ann-card">
                    <div class="lmn-ann-card-header">
                        <span class="material-symbols-outlined lmn-ann-card-icon">publish</span>
                        <h2 class="lmn-ann-card-title" data-i18n="admin.ann.create.settings_title">发布设置</h2>
                    </div>

                    <div class="lmn-ann-fields">
                        <div class="lmn-ann-field">
                            <label class="lmn-ann-label" data-i18n="admin.ann.create.field_status">状态</label>
                            <select id="status" class="lmn-ann-select">
                                <option value="0" data-i18n="admin.ann.create.status_draft">未发布</option>
                                <option value="1" data-i18n="admin.ann.create.status_published">已发布</option>
                                <option value="2" data-i18n="admin.ann.create.status_pinned">置顶</option>
                            </select>
                        </div>

                        <div class="lmn-ann-field">
                            <label class="lmn-ann-label" data-i18n="admin.ann.create.field_sort">显示排序</label>
                            <input id="sort" type="number" class="lmn-ann-input" value="1" min="0" max="999">
                        </div>

                        <div class="lmn-ann-divider"></div>

                        <div class="lmn-ann-field">
                            <label class="lmn-ann-label" data-i18n="admin.ann.create.field_email_class">邮件通知等级</label>
                            <select id="email_notify_class" class="lmn-ann-select">
                                <option value="0" data-i18n="admin.ann.create.class_all">0 — 所有成员</option>
                                <option value="1" data-i18n="admin.ann.create.class_standard">1 — 标准及以上</option>
                                <option value="2" data-i18n="admin.ann.create.class_premium">2 — 高级及以上</option>
                                <option value="3" data-i18n="admin.ann.create.class_vip">3 — 仅 VIP</option>
                            </select>
                            <span class="lmn-ann-hint" data-i18n="admin.ann.create.hint_class">0 = 所有成员</span>
                        </div>

                        <div class="lmn-ann-toggle-row">
                            <div>
                                <span class="lmn-ann-toggle-label" data-i18n="admin.ann.create.field_email_notify">发送邮件通知</span>
                                <span class="lmn-ann-toggle-desc" data-i18n="admin.ann.create.email_notify_desc">公告将通过邮箱发送</span>
                            </div>
                            <label class="lmn-toggle">
                                <input id="email_notify" type="checkbox" class="lmn-toggle-input">
                                <span class="lmn-toggle-track"></span>
                            </label>
                        </div>
                    </div>

                    <div class="lmn-ann-actions">
                        <button id="create" type="button" class="lmn-ann-btn-save">
                            <span class="material-symbols-outlined">save</span>
                            <span data-i18n="admin.ann.create.save_btn">保存公告</span>
                        </button>
                        <a href="/admin/announcement" class="lmn-ann-btn-cancel" data-i18n="admin.ann.create.cancel_btn">取消更改</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

{include file='tinymce.tpl'}

<script>
    $("#create").click(function () {
        $.ajax({
            url: '/admin/announcement',
            type: 'POST',
            dataType: "json",
            data: {
                {foreach $update_field as $key}
                {$key}: $('#{$key}').val(),
                {/foreach}
                email_notify_class: $('#email_notify_class').val(),
                email_notify: $("#email_notify").is(":checked"),
                content: tinyMCE.activeEditor.getContent(),
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
        })
    });
</script>

{include file='admin/footer.tpl'}
