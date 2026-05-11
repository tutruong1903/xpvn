{include file='admin/header.tpl'}

<link href="/assets/css/admin/ann-create.css{asset_ver path="/assets/css/admin/ann-create.css"}" rel="stylesheet"/>

<div class="page-body">
    <div class="container-xl">

        <div class="lmn-ann-header">
            <h1 class="lmn-ann-title" data-i18n="admin.docs.create.title">创建文档</h1>
            <p class="lmn-ann-subtitle" data-i18n="admin.docs.create.subtitle">为用户撰写并发布新文档。</p>
        </div>

        <div class="lmn-ann-grid">

            <!-- Editor Column -->
            <div>
                <div class="lmn-ann-card">
                    <div class="lmn-ann-card-body">
                        <input id="title" type="text" class="lmn-ann-title-input"
                               data-i18n-placeholder="admin.docs.create.ph_title"
                               placeholder="在此输入精彩标题...">
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
                        <h2 class="lmn-ann-card-title" data-i18n="admin.docs.create.settings_title">发布设置</h2>
                    </div>

                    <div class="lmn-ann-fields">
                        <div class="lmn-ann-field">
                            <label class="lmn-ann-label" data-i18n="admin.docs.create.field_status">状态</label>
                            <select id="status" class="lmn-ann-select">
                                <option value="0" data-i18n="admin.docs.create.status_draft">未发布</option>
                                <option value="1" data-i18n="admin.docs.create.status_published">已发布</option>
                            </select>
                        </div>

                        <div class="lmn-ann-field">
                            <label class="lmn-ann-label" data-i18n="admin.docs.create.field_sort">显示排序</label>
                            <input id="sort" type="number" class="lmn-ann-input" value="0" min="0" max="999">
                        </div>
                    </div>

                    <div class="lmn-ann-actions">
                        <button id="create" type="button" class="lmn-ann-btn-save">
                            <span class="material-symbols-outlined">save</span>
                            <span data-i18n="admin.docs.create.save_btn">保存文档</span>
                        </button>
                        <button type="button" class="lmn-ann-btn-llm"
                                data-bs-toggle="modal" data-bs-target="#generate-docs">
                            <span class="material-symbols-outlined">smart_toy</span>
                            <span data-i18n="admin.docs.create.llm_btn">AI 生成</span>
                        </button>
                        <a href="/admin/docs" class="lmn-ann-btn-cancel" data-i18n="admin.docs.create.cancel_btn">取消更改</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- LLM Generate Modal -->
<div class="modal modal-blur fade" id="generate-docs" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" data-i18n="admin.docs.create.llm_modal_title">使用 LLM 自动生成文档</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <input id="question" class="form-control"
                           data-i18n-placeholder="admin.docs.create.llm_ph"
                           placeholder="请输入文档生成提示">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn me-auto" data-bs-dismiss="modal"
                        data-i18n="admin.docs.create.llm_cancel">取消</button>
                <button id="generate" type="button" class="btn btn-primary" data-bs-dismiss="modal"
                        data-i18n="admin.docs.create.llm_generate">生成</button>
            </div>
        </div>
    </div>
</div>

{include file='tinymce-docs.tpl'}

<script>
    $("#generate").click(function () {
        $.ajax({
            url: "/admin/docs/generate",
            type: 'POST',
            dataType: "json",
            data: {
                question: $("#question").val(),
            },
            success: function (data) {
                if (data.ret === 1) {
                    $('#success-message').text(data.msg);
                    $('#success-dialog').modal('show');
                    tinyMCE.activeEditor.setContent(data.content);
                } else {
                    $('#fail-message').text(data.msg);
                    $('#fail-dialog').modal('show');
                }
            }
        })
    });

    $("#create").click(function () {
        // Use FormData to avoid double-encoding base64 image data URIs
        var fd = new FormData();
        fd.append('status', $('#status').val());
        fd.append('sort', $('#sort').val());
        fd.append('title', $('#title').val());
        fd.append('content', tinyMCE.activeEditor.getContent());

        $.ajax({
            url: '/admin/docs',
            type: 'POST',
            dataType: "json",
            data: fd,
            processData: false,
            contentType: false,
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
