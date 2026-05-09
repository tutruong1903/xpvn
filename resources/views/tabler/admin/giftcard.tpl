{include file='admin/header.tpl'}

<link href="/assets/css/admin/giftcard.css{asset_ver path="/assets/css/admin/giftcard.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.giftcard.index.title">礼品卡</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.giftcard.index.subtitle">查看并管理礼品卡。</p>
        </div>
        <div class="lmn-page-header__actions">
            <button type="button" class="lmn-btn-primary" data-bs-toggle="modal" data-bs-target="#create-dialog">
                <span class="material-symbols-outlined">add</span>
                <span data-i18n="admin.giftcard.index.create_btn">创建</span>
            </button>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.giftcard.index.stat_total">总礼品卡数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.giftcard.index.stat_unused">未使用</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--success" id="stat-unused">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.giftcard.index.stat_used">已使用</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--primary" id="stat-used">—</span>
            </div>
        </div>
    </div>
</div>

<!-- Create Gift Card Modal -->
<div class="modal modal-blur fade lmn-modal" id="create-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" data-i18n="admin.giftcard.create_modal.title">创建礼品卡</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                {foreach $details['create_dialog'] as $detail}
                    {if $detail['type'] === 'input'}
                        <div class="lmn-field">
                            <label class="lmn-field-label"
                                   data-i18n="admin.giftcard.create_modal.{$detail['i18n_key']}">{$detail['info']}</label>
                            <input id="{$detail['id']}" type="text" class="lmn-field-input"
                                   placeholder="{$detail['placeholder']}">
                        </div>
                    {/if}
                    {if $detail['type'] === 'select'}
                        <div class="lmn-field">
                            <label class="lmn-field-label"
                                   data-i18n="admin.giftcard.create_modal.{$detail['i18n_key']}">{$detail['info']}</label>
                            <select id="{$detail['id']}" class="lmn-field-select">
                                {foreach $detail['select'] as $key => $value}
                                    <option value="{$key}"
                                            data-i18n="admin.giftcard.create_modal.opt_{$key}">{$value}</option>
                                {/foreach}
                            </select>
                        </div>
                    {/if}
                {/foreach}
            </div>
            <div class="modal-footer">
                <button type="button" class="lmn-modal-cancel me-auto" data-bs-dismiss="modal"
                        data-i18n="admin.giftcard.create_modal.cancel_btn">取消</button>
                <button type="button" class="lmn-modal-submit" onclick="createGiftCard()"
                        data-bs-dismiss="modal"
                        data-i18n="admin.giftcard.create_modal.submit_btn">创建</button>
            </div>
        </div>
    </div>
</div>

<div class="page-body pt-0">
    <div class="container-xl">

        <!-- Search bar -->
        <div class="lmn-table-actions mb-4">
            <div class="lmn-table-search-wrap">
                <span class="material-symbols-outlined lmn-table-search-icon">search</span>
                <input type="text"
                       id="lmn-table-search"
                       class="lmn-table-search-input"
                       data-i18n-placeholder="admin.giftcard.index.search_placeholder"
                       placeholder="按ID或卡号搜索...">
            </div>
        </div>

        <div class="lmn-table-card">
            <table id="data-table" class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                    {foreach $details['field'] as $key => $value}
                        <th data-i18n="admin.giftcard.fields.{$key}">{$value}</th>
                    {/foreach}
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

{include file='datatable.tpl'}

<script>
    tableConfig.ajax = {
        url: '/admin/giftcard/ajax',
        type: 'POST',
        dataSrc: 'giftcards'
    };
    tableConfig.order = [[1, 'desc']];
    tableConfig.columnDefs = [
        { targets: [0],            orderable: false },
        { targets: [3, 4, 5, 6, 7], searchable: false },
    ];

    let table = new DataTable('#data-table', tableConfig);

    $('#lmn-table-search').on('keyup', function () {
        table.search(this.value).draw();
    });

    table.on('xhr', function () {
        var json = table.ajax.json();
        if (!json) return;
        if (json.total  != null) $('#stat-total').text(Number(json.total).toLocaleString());
        if (json.unused != null) $('#stat-unused').text(Number(json.unused).toLocaleString());
        if (json.used   != null) $('#stat-used').text(Number(json.used).toLocaleString());

        /* Translate badge text */
        var locale  = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var gcLoc   = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.giftcard && window.i18nLocales.admin.giftcard[locale]) || {};
        var badges  = gcLoc.badges || {};
        if (Object.keys(badges).length) {
            document.querySelectorAll('#data-table .lmn-badge').forEach(function (el) {
                var key = el.textContent.trim();
                if (badges[key]) el.textContent = badges[key];
            });
        }
    });

    function createGiftCard() {
        $.ajax({
            url: '/admin/giftcard',
            type: 'POST',
            dataType: 'json',
            data: {
                {foreach $details['create_dialog'] as $detail}
                {$detail['id']}: $('#{$detail['id']}').val(),
                {/foreach}
            },
            success: function (data) {
                if (data.ret === 1) {
                    $('#success-message').text(data.msg);
                    $('#success-dialog').modal('show');
                    table.ajax.reload(null, false);
                } else {
                    $('#fail-message').text(data.msg);
                    $('#fail-dialog').modal('show');
                }
            }
        });
    }

    function deleteGiftCard(giftcard_id) {
        var locale = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var gcLoc  = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.giftcard && window.i18nLocales.admin.giftcard[locale]) || {};
        var msg    = (gcLoc.index && gcLoc.index.delete_confirm) || '确定删除此礼品卡？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: '/admin/giftcard/' + giftcard_id,
                type: 'DELETE',
                dataType: 'json',
                success: function (data) {
                    if (data.ret === 1) {
                        $('#success-message').text(data.msg);
                        $('#success-dialog').modal('show');
                        table.ajax.reload(null, false);
                    } else {
                        $('#fail-message').text(data.msg);
                        $('#fail-dialog').modal('show');
                    }
                }
            });
        });
    }
</script>

{include file='admin/footer.tpl'}

