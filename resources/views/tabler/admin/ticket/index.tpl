{include file='admin/header.tpl'}

<link href="/assets/css/admin/ticket-index.css{asset_ver path="/assets/css/admin/ticket-index.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.ticket.index.title">工单列表</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.ticket.index.subtitle">查看并回复用户工单</p>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.ticket.index.stat_total">总工单数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total-tickets">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.ticket.index.stat_open">进行中</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--success" id="stat-open-tickets">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.ticket.index.stat_closed">已结单</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--danger" id="stat-closed-tickets">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.ticket.index.stat_wait_admin">等待管理员</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--primary" id="stat-wait-admin-tickets">—</span>
            </div>
        </div>
    </div>
</div>

<!-- Filter config -->
{if isset($details['filter']) && $details['filter']}
<script>
    window._dtFilterConfig = {$details['filter']|json_encode};
</script>
{/if}

<div class="page-body pt-0">
    <div class="container-xl">

        <!-- Search & Filter bar -->
        <div class="lmn-table-actions mb-4">
            <div class="lmn-table-search-wrap">
                <span class="material-symbols-outlined lmn-table-search-icon">search</span>
                <input type="text"
                       id="lmn-table-search"
                       class="lmn-table-search-input"
                       data-i18n-placeholder="admin.ticket.index.search_placeholder"
                       placeholder="快速搜索 ID、主题或用户...">
            </div>
            {if isset($details['filter']) && $details['filter']}
            <div class="lmn-filter-dropdown" id="lmn-filter-dropdown">
                <button id="lmn-filter-toggle" class="lmn-filter-btn" aria-expanded="false">
                    <span class="material-symbols-outlined">filter_list</span>
                    <span data-i18n="admin.ticket.index.filter_btn">筛选</span>
                    <span class="material-symbols-outlined lmn-filter-btn__arrow">expand_more</span>
                </button>
                <div id="lmn-filter-panel" class="lmn-filter-panel" aria-hidden="true"></div>
            </div>
            {/if}
        </div>

        <div class="lmn-table-card">
            <table id="data-table" class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                    {foreach $details['field'] as $key => $value}
                        <th data-i18n="admin.ticket.fields.{$key}">{$value}</th>
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
        url: '/admin/ticket/ajax',
        type: 'POST',
        dataSrc: 'tickets'
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

    /* Filter dropdown toggle */
    $('#lmn-filter-toggle').on('click', function (e) {
        e.stopPropagation();
        var $dropdown = $('#lmn-filter-dropdown');
        var isOpen = $dropdown.hasClass('is-open');
        $dropdown.toggleClass('is-open', !isOpen);
        $(this).attr('aria-expanded', String(!isOpen));
        $('#lmn-filter-panel').attr('aria-hidden', String(isOpen));
    });
    $(document).on('click', function (e) {
        if (!$(e.target).closest('#lmn-filter-dropdown').length) {
            $('#lmn-filter-dropdown').removeClass('is-open');
            $('#lmn-filter-toggle').attr('aria-expanded', 'false');
        }
    });

    /* Populate stats from AJAX response */
    table.on('xhr', function () {
        var json = table.ajax.json();
        if (!json) return;
        if (json.total != null)      $('#stat-total-tickets').text(Number(json.total).toLocaleString());
        if (json.open != null)       $('#stat-open-tickets').text(Number(json.open).toLocaleString());
        if (json.closed != null)     $('#stat-closed-tickets').text(Number(json.closed).toLocaleString());
        if (json.wait_admin != null) $('#stat-wait-admin-tickets').text(Number(json.wait_admin).toLocaleString());
    });

    function loadTable() {
        table;
    }

    function closeTicket(ticket_id) {
        var locale     = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var ticketLoc  = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.ticket && window.i18nLocales.admin.ticket[locale]) || {};
        var msg        = (ticketLoc.index && ticketLoc.index.close_confirm) || '确定关闭此工单？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: "/admin/ticket/" + ticket_id + '/close',
                type: 'PUT',
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
            });
        });
    }

    function deleteTicket(ticket_id) {
        var locale     = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var ticketLoc  = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.ticket && window.i18nLocales.admin.ticket[locale]) || {};
        var msg        = (ticketLoc.index && ticketLoc.index.delete_confirm) || '确定删除此工单？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: "/admin/ticket/" + ticket_id,
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

    function reloadTableAjax() {
        table.ajax.reload(null, false);
    }

    loadTable();
</script>

{include file='admin/footer.tpl'}
