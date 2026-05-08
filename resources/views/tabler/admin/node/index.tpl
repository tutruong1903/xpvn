{include file='admin/header.tpl'}

<link href="/assets/css/admin/node-index.css{asset_ver path="/assets/css/admin/node-index.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.node.index.title">节点列表</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.node.index.subtitle">系统中所有节点的列表</p>
        </div>
        <div class="lmn-page-header__actions">
            <a href="/admin/node/create" class="lmn-btn-primary">
                <span class="material-symbols-outlined">add</span>
                <span data-i18n="admin.node.index.create_btn">创建</span>
            </a>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.node.index.stat_total">总节点数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total-nodes">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.node.index.stat_online">在线节点</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--success" id="stat-online-nodes">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.node.index.stat_hidden">已隐藏</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--danger" id="stat-hidden-nodes">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.node.index.stat_bandwidth">已用总流量 (GB)</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--primary" id="stat-total-bandwidth">—</span>
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
                       data-i18n-placeholder="admin.node.index.search_placeholder"
                       placeholder="快速搜索 ID、名称或地址...">
            </div>
            {if isset($details['filter']) && $details['filter']}
            <div class="lmn-filter-dropdown" id="lmn-filter-dropdown">
                <button id="lmn-filter-toggle" class="lmn-filter-btn" aria-expanded="false">
                    <span class="material-symbols-outlined">filter_list</span>
                    <span data-i18n="admin.node.index.filter_btn">筛选</span>
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
                        <th data-i18n="admin.node.fields.{$key}">{$value}</th>
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
        url: '/admin/node/ajax',
        type: 'POST',
        dataSrc: 'nodes'
    };
    tableConfig.order = [
        [1, 'asc']
    ];
    tableConfig.columnDefs = [
        {
            targets: [0],
            orderable: false
        },
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
        if (json.total != null)            $('#stat-total-nodes').text(Number(json.total).toLocaleString());
        if (json.online != null)           $('#stat-online-nodes').text(Number(json.online).toLocaleString());
        if (json.hidden != null)           $('#stat-hidden-nodes').text(Number(json.hidden).toLocaleString());
        if (json.total_bandwidth != null)  $('#stat-total-bandwidth').text(Number(json.total_bandwidth).toLocaleString());
    });

    function loadTable() {
        table;
    }

    function deleteNode(node_id) {
        var locale  = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var nodeLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.node && window.i18nLocales.admin.node[locale]) || {};
        var msg     = (nodeLoc.index && nodeLoc.index.delete_confirm) || '确定删除此节点？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: "/admin/node/" + node_id,
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

    function copyNode(node_id) {
        var locale  = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var nodeLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.node && window.i18nLocales.admin.node[locale]) || {};
        var msg     = (nodeLoc.index && nodeLoc.index.copy_confirm) || '确定复制此节点？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: "/admin/node/" + node_id + "/copy",
                type: 'POST',
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

