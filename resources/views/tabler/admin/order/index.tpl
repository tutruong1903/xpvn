{include file='admin/header.tpl'}

<link href="/assets/css/admin/order-index.css{asset_ver path="/assets/css/admin/order-index.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.order.index.title">订单列表</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.order.index.subtitle">管理所有客户订单。</p>
        </div>
        <div class="lmn-page-header__actions">
            <button type="button" class="lmn-btn-primary" data-bs-toggle="modal" data-bs-target="#search-gateway">
                <span class="material-symbols-outlined">search</span>
                <span data-i18n="admin.order.index.search_btn">按网关单号查找</span>
            </button>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.order.index.stat_total">总订单数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.order.index.stat_pending">待处理</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--primary" id="stat-pending">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.order.index.stat_active">已激活</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--success" id="stat-active">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.order.index.stat_cancelled">已取消</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--danger" id="stat-cancelled">—</span>
            </div>
        </div>
    </div>
</div>

<!-- Gateway order search modal -->
<div class="modal modal-blur fade" id="search-gateway" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" data-i18n="admin.order.search_modal.title">查找订单</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label" data-i18n="admin.order.search_modal.label">网关订单号</label>
                    <input id="gateway_order_id" type="text" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn me-auto" data-bs-dismiss="modal"
                        data-i18n="admin.order.search_modal.cancel_btn">取消</button>
                <button type="button"
                        class="btn btn-primary"
                        data-i18n="admin.order.search_modal.submit_btn"
                        hx-post="/admin/order/search"
                        hx-swap="none"
                        hx-vals='js:{ gateway_order_id: document.getElementById("gateway_order_id").value }'>查找
                </button>
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
                       data-i18n-placeholder="admin.order.index.search_placeholder"
                       placeholder="按ID或用户搜索...">
            </div>
        </div>

        <div class="lmn-table-card">
            <table id="data-table" class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                    {foreach $details['field'] as $key => $value}
                        <th data-i18n="admin.order.fields.{$key}">{$value}</th>
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
        url: '/admin/order/ajax',
        type: 'POST',
        dataSrc: 'orders'
    };
    tableConfig.order = [[1, 'desc']];
    tableConfig.columnDefs = [
        { targets: [0],                         orderable: false },
        { targets: [2, 3, 4, 6, 7, 8, 9, 10],  searchable: false },
    ];

    let table = new DataTable('#data-table', tableConfig);

    /* Search by ID and user_id only */
    $('#lmn-table-search').on('keyup', function () {
        table.search(this.value).draw();
    });

    /* Populate stats from AJAX response */
    table.on('xhr', function () {
        var json = table.ajax.json();
        if (!json) return;
        if (json.total     != null) $('#stat-total').text(Number(json.total).toLocaleString());
        if (json.pending   != null) $('#stat-pending').text(Number(json.pending).toLocaleString());
        if (json.active    != null) $('#stat-active').text(Number(json.active).toLocaleString());
        if (json.cancelled != null) $('#stat-cancelled').text(Number(json.cancelled).toLocaleString());

        /* Translate badge text in the rendered rows */
        var locale   = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var orderLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.order && window.i18nLocales.admin.order[locale]) || {};
        var badges   = orderLoc.badges || {};
        if (Object.keys(badges).length) {
            document.querySelectorAll('#data-table .lmn-badge').forEach(function (el) {
                var key = el.textContent.trim();
                if (badges[key]) el.textContent = badges[key];
            });
        }
    });

    function deleteOrder(order_id) {
        var locale   = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var orderLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.order && window.i18nLocales.admin.order[locale]) || {};
        var msg      = (orderLoc.index && orderLoc.index.delete_confirm) || '确定删除此订单？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: '/admin/order/' + order_id,
                type: 'DELETE',
                dataType: 'json',
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
            });
        });
    }

    function cancelOrder(order_id) {
        var locale   = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var orderLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.order && window.i18nLocales.admin.order[locale]) || {};
        var msg      = (orderLoc.index && orderLoc.index.cancel_confirm) || '确定取消此订单？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: '/admin/order/' + order_id + '/cancel',
                type: 'POST',
                dataType: 'json',
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
            });
        });
    }

    function reloadTableAjax() {
        table.ajax.reload(null, false);
    }
</script>

{include file='admin/footer.tpl'}

