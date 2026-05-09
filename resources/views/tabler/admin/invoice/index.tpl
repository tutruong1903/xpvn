{include file='admin/header.tpl'}

<link href="/assets/css/admin/invoice-index.css{asset_ver path="/assets/css/admin/invoice-index.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.invoice.index.title">账单列表</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.invoice.index.subtitle">管理用户账单。</p>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.invoice.index.stat_total">总账单数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.invoice.index.stat_paid">已支付</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--success" id="stat-paid">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.invoice.index.stat_unpaid">未支付</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--primary" id="stat-unpaid">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.invoice.index.stat_cancelled">已取消</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--danger" id="stat-cancelled">—</span>
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
                       data-i18n-placeholder="admin.invoice.index.search_placeholder"
                       placeholder="按ID或用户搜索...">
            </div>
        </div>

        <div class="lmn-table-card">
            <table id="data-table" class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                    {foreach $details['field'] as $key => $value}
                        <th data-i18n="admin.invoice.fields.{$key}">{$value}</th>
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
        url: '/admin/invoice/ajax',
        type: 'POST',
        dataSrc: 'invoices'
    };
    tableConfig.order = [[1, 'desc']];
    tableConfig.columnDefs = [
        { targets: [0],               orderable: false },
        { targets: [2, 3, 4, 6, 7, 8], searchable: false },
    ];

    let table = new DataTable('#data-table', tableConfig);

    $('#lmn-table-search').on('keyup', function () {
        table.search(this.value).draw();
    });

    table.on('xhr', function () {
        var json = table.ajax.json();
        if (!json) return;
        if (json.total     != null) $('#stat-total').text(Number(json.total).toLocaleString());
        if (json.paid      != null) $('#stat-paid').text(Number(json.paid).toLocaleString());
        if (json.unpaid    != null) $('#stat-unpaid').text(Number(json.unpaid).toLocaleString());
        if (json.cancelled != null) $('#stat-cancelled').text(Number(json.cancelled).toLocaleString());

        /* Translate badge text */
        var locale     = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var invLoc     = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.invoice && window.i18nLocales.admin.invoice[locale]) || {};
        var badges     = invLoc.badges || {};
        if (Object.keys(badges).length) {
            document.querySelectorAll('#data-table .lmn-badge').forEach(function (el) {
                var key = el.textContent.trim();
                if (badges[key]) el.textContent = badges[key];
            });
        }
    });

    function markPaid(invoice_id) {
        var locale  = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var invLoc  = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.invoice && window.i18nLocales.admin.invoice[locale]) || {};
        var msg     = (invLoc.index && invLoc.index.mark_paid_confirm) || '确定将此账单标记为已支付（管理员）？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: '/admin/invoice/' + invoice_id + '/mark-paid',
                type: 'POST',
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

