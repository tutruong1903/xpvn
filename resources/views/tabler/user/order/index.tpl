{include file='user/header.tpl'}

<link href="/assets/css/user/order-index.css{asset_ver path="/assets/css/user/order-index.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="user.order.index_title">订单列表</h2>
            <p class="lmn-page-subtitle" data-i18n="user.order.index_subtitle">查看并管理账户中的订单</p>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="user.order.index_stat_total">总订单数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total-orders">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="user.order.index_stat_pending">待付款</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--danger" id="stat-pending-orders">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="user.order.index_stat_activated">已激活</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--success" id="stat-activated-orders">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="user.order.index_stat_spent">累计消费 ($)</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--primary" id="stat-total-spent">—</span>
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
                       data-i18n-placeholder="user.order.index_search_placeholder"
                       placeholder="快速搜索 ID、商品或状态...">
            </div>
        </div>

        <div class="lmn-table-card">
            <table id="data-table" class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                    {foreach $details['field'] as $key => $value}
                        <th data-i18n="user.order.fields.{$key}">{$value}</th>
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
        url: '/user/order/ajax',
        type: 'POST',
        dataSrc: 'orders'
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
        if (json.total != null)           $('#stat-total-orders').text(Number(json.total).toLocaleString());
        if (json.pending_payment != null) $('#stat-pending-orders').text(Number(json.pending_payment).toLocaleString());
        if (json.activated != null)       $('#stat-activated-orders').text(Number(json.activated).toLocaleString());
        if (json.total_spent != null)     $('#stat-total-spent').text(Number(json.total_spent).toLocaleString());
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
