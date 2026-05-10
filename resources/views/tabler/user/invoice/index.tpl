{include file='user/header.tpl'}

<link href="/assets/css/user/order-index.css{asset_ver path="/assets/css/user/order-index.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="user.invoice.index_title">账单列表</h2>
            <p class="lmn-page-subtitle" data-i18n="user.invoice.index_subtitle">在这里查看账单列表</p>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="user.invoice.index_stat_total">总账单数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total-invoices">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="user.invoice.index_stat_unpaid">待付款</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--danger" id="stat-unpaid-invoices">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="user.invoice.index_stat_paid">已支付</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--success" id="stat-paid-invoices">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="user.invoice.index_stat_total_paid">累计支付 ($)</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--primary" id="stat-total-paid">—</span>
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
                       data-i18n-placeholder="user.invoice.index_search_placeholder"
                       placeholder="快速搜索 ID、金额或状态...">
            </div>
        </div>

        <div class="lmn-table-card">
            <table id="data-table" class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                    {foreach $details['field'] as $key => $value}
                        <th data-i18n="user.invoice.fields.{$key}">{$value}</th>
                    {/foreach}
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<script src="//{$config['jsdelivr_url']}/npm/jquery/dist/jquery.min.js"></script>

{include file='datatable.tpl'}

<script>
    tableConfig.ajax = {
        url: '/user/invoice/ajax',
        type: 'POST',
        dataSrc: 'invoices'
    };
    tableConfig.order = [
        [1, 'desc']
    ];
    tableConfig.columnDefs = [
        {
            targets: [0],
            orderable: false
        }
    ];

    let table = new DataTable('#data-table', tableConfig);

    /* Live search */
    $('#lmn-table-search').on('input', function () {
        table.search($(this).val()).draw();
    });

    /* Populate stats from AJAX response */
    table.on('xhr', function () {
        var json = table.ajax.json();
        if (!json) return;
        if (json.total != null)      $('#stat-total-invoices').text(Number(json.total).toLocaleString());
        if (json.unpaid != null)     $('#stat-unpaid-invoices').text(Number(json.unpaid).toLocaleString());
        if (json.paid != null)       $('#stat-paid-invoices').text(Number(json.paid).toLocaleString());
        if (json.total_paid != null) $('#stat-total-paid').text(Number(json.total_paid).toLocaleString());
    });

    function loadTable() {
        table;
    }

    function reloadTableAjax() {
        table.ajax.reload(null, false);
    }

    loadTable();
</script>

{include file='user/footer.tpl'}
