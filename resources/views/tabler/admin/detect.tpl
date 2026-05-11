{include file='admin/header.tpl'}

<link href="/assets/css/admin/detect.css{asset_ver path="/assets/css/admin/detect.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.detect.rule.title">审计规则</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.detect.rule.subtitle">查看站点中的审计规则</p>
        </div>
        <div class="lmn-page-header__actions">
            <button class="lmn-btn-primary" data-bs-toggle="modal" data-bs-target="#add-detect-dialog">
                <span class="material-symbols-outlined">add</span>
                <span data-i18n="admin.detect.rule.add_btn">添加审计规则</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body pt-0">
    <div class="container-xl">
        <div class="lmn-table-card">
            <table id="data-table" class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                    {foreach $details['field'] as $key => $value}
                        <th data-i18n="admin.detect.fields.{$key}">{$value}</th>
                    {/foreach}
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<!-- Add Detect Rule Modal -->
<div class="modal modal-blur fade lmn-modal" id="add-detect-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" data-i18n="admin.detect.rule.add_dialog_title">添加审计规则</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                {foreach $details['add_dialog'] as $from}
                    {if $from['type'] === 'input'}
                        <div class="lmn-field">
                            <label class="lmn-field-label"
                                   data-i18n="admin.detect.add_dialog.field_{$from['id']}">{$from['info']}</label>
                            <input id="{$from['id']}" type="text" class="lmn-field-input"
                                   data-i18n-placeholder="admin.detect.add_dialog.ph_{$from['id']}"
                                   placeholder="{$from['placeholder']}">
                        </div>
                    {/if}
                    {if $from['type'] === 'textarea'}
                        <div class="lmn-field">
                            <label class="lmn-field-label"
                                   data-i18n="admin.detect.add_dialog.field_{$from['id']}">{$from['info']}</label>
                            <textarea id="{$from['id']}" class="lmn-field-input" rows="{$from['rows']}"
                                      data-i18n-placeholder="admin.detect.add_dialog.ph_{$from['id']}"
                                      placeholder="{$from['placeholder']}"></textarea>
                        </div>
                    {/if}
                    {if $from['type'] === 'select'}
                        <div class="lmn-field">
                            <label class="lmn-field-label"
                                   data-i18n="admin.detect.add_dialog.field_{$from['id']}">{$from['info']}</label>
                            <select id="{$from['id']}" class="lmn-field-select">
                                {foreach $from['select'] as $key => $value}
                                    <option value="{$key}"
                                            data-i18n="admin.detect.add_dialog.opt_{$key}">{$value}</option>
                                {/foreach}
                            </select>
                        </div>
                    {/if}
                {/foreach}
            </div>
            <div class="modal-footer">
                <button type="button" class="lmn-modal-cancel" data-bs-dismiss="modal"
                        data-i18n="admin.detect.rule.cancel_btn">取消</button>
                <button id="add-detect-button" type="button" class="lmn-modal-submit" data-bs-dismiss="modal"
                        data-i18n="admin.detect.rule.submit_btn">提交</button>
            </div>
        </div>
    </div>
</div>

{include file='datatable.tpl'}

<script>
    tableConfig.ajax = {
        url: '/admin/detect/ajax',
        type: 'POST',
        dataSrc: 'rules'
    };
    tableConfig.order = [
        [0, 'desc']
    ];
    tableConfig.columnDefs = [
        {
            targets: [0],
            orderable: false
        },
    ];

    let table = new DataTable('#data-table', tableConfig);

    $("#add-detect-button").click(function () {
        $.ajax({
            type: "POST",
            url: "/admin/detect/add",
            dataType: "json",
            data: {
                {foreach $details['add_dialog'] as $from}
                {$from['id']}: $('#{$from['id']}').val(),
                {/foreach}
            },
            success: function (data) {
                if (data.ret === 1) {
                    $('#success-message').text(data.msg);
                    $('#success-dialog').modal('show');
                    reloadTableAjax();
                } else {
                    $('#fail-message').text(data.msg);
                    $('#fail-dialog').modal('show');
                }
            }
        })
    });

    function deleteRule(rule_id) {
        var locale  = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var detectLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.detect && window.i18nLocales.admin.detect[locale]) || {};
        var msg = (detectLoc.rule && detectLoc.rule.delete_confirm) || '确定删除此审计规则？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: "/admin/detect/" + rule_id,
                type: 'DELETE',
                dataType: "json",
                success: function (data) {
                    if (data.ret === 1) {
                        $('#success-message').text(data.msg);
                        $('#success-dialog').modal('show');
                        reloadTableAjax();
                    } else {
                        $('#fail-message').text(data.msg);
                        $('#fail-dialog').modal('show');
                    }
                }
            })
        });
    }

    function loadTable() {
        table;
    }

    function reloadTableAjax() {
        table.ajax.reload(null, false);
    }

    loadTable();
</script>

{include file='admin/footer.tpl'}
