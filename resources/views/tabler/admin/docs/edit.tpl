{include file='admin/header.tpl'}

<link href="/assets/css/admin/ann-create.css{asset_ver path="/assets/css/admin/ann-create.css"}" rel="stylesheet"/>

<div class="page-body">
    <div class="container-xl">

        <div class="lmn-ann-header">
            <h1 class="lmn-ann-title">
                <span data-i18n="admin.docs.edit.title">编辑文档</span>
                <span style="color:#712ae2"> #{$doc->id}</span>
            </h1>
            <p class="lmn-ann-subtitle" data-i18n="admin.docs.edit.subtitle">更新该文档的内容与发布设置。</p>
        </div>

        <div class="lmn-ann-grid">

            <!-- Editor Column -->
            <div>
                <div class="lmn-ann-card">
                    <div class="lmn-ann-card-body">
                        <input id="title" type="text" class="lmn-ann-title-input" value="{$doc->title}">
                        <div class="lmn-ann-editor-wrap">
                            <form method="post">
                                <textarea id="tinymce">{$doc->content}</textarea>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sidebar: Publish Settings -->
            <div>
                <div class="lmn-ann-card">
                    <div class="lmn-ann-card-header">
                        <span class="material-symbols-outlined lmn-ann-card-icon">edit_note</span>
                        <h2 class="lmn-ann-card-title" data-i18n="admin.docs.edit.settings_title">发布设置</h2>
                    </div>

                    <div class="lmn-ann-fields">
                        <div class="lmn-ann-field">
                            <label class="lmn-ann-label" data-i18n="admin.docs.edit.field_status">状态</label>
                            <select id="status" class="lmn-ann-select">
                                <option value="0" {if $doc->status == 0}selected{/if} data-i18n="admin.docs.edit.status_draft">未发布</option>
                                <option value="1" {if $doc->status == 1}selected{/if} data-i18n="admin.docs.edit.status_published">已发布</option>
                            </select>
                        </div>

                        <div class="lmn-ann-field">
                            <label class="lmn-ann-label" data-i18n="admin.docs.edit.field_sort">显示排序</label>
                            <input id="sort" type="number" class="lmn-ann-input" value="{$doc->sort}" min="0" max="999">
                        </div>
                    </div>

                    <div class="lmn-ann-actions">
                        <button id="save" type="button" class="lmn-ann-btn-save">
                            <span class="material-symbols-outlined">save</span>
                            <span data-i18n="admin.docs.edit.save_btn">保存更改</span>
                        </button>
                        <a href="/admin/docs" class="lmn-ann-btn-cancel" data-i18n="admin.docs.edit.cancel_btn">取消更改</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

{include file='tinymce-docs.tpl'}

<script>
    $("#save").click(function () {
        $.ajax({
            url: '/admin/docs/' + {$doc->id},
            type: 'PUT',
            dataType: "json",
            data: {
                status: $('#status').val(),
                sort: $('#sort').val(),
                title: $('#title').val(),
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
