{include file='admin/header.tpl'}

<link href="/assets/css/admin/ann-index.css{asset_ver path="/assets/css/admin/ann-index.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.ann.index.title">公告管理</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.ann.index.subtitle">查看并管理站点中的公告</p>
        </div>
        <div class="lmn-page-header__actions">
            <a href="/admin/announcement/create" class="lmn-btn-primary">
                <span class="material-symbols-outlined">add</span>
                <span data-i18n="admin.ann.index.create_btn">创建</span>
            </a>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.ann.index.stat_total">总公告数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total-anns">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.ann.index.stat_published">已发布</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--success" id="stat-published-anns">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.ann.index.stat_pinned">置顶</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--primary" id="stat-pinned-anns">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.ann.index.stat_draft">未发布</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--danger" id="stat-draft-anns">—</span>
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
                       data-i18n-placeholder="admin.ann.index.search_placeholder"
                       placeholder="快速搜索 ID 或内容...">
            </div>
            {if isset($details['filter']) && $details['filter']}
            <div class="lmn-filter-dropdown" id="lmn-filter-dropdown">
                <button id="lmn-filter-toggle" class="lmn-filter-btn" aria-expanded="false">
                    <span class="material-symbols-outlined">filter_list</span>
                    <span data-i18n="admin.ann.index.filter_btn">筛选</span>
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
                        <th data-i18n="admin.ann.fields.{$key}">{$value}</th>
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
        url: '/admin/announcement/ajax',
        type: 'POST',
        dataSrc: 'anns'
    };
    tableConfig.order = [
        [1, 'asc']
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
        if (json.total != null)     $('#stat-total-anns').text(Number(json.total).toLocaleString());
        if (json.published != null) $('#stat-published-anns').text(Number(json.published).toLocaleString());
        if (json.pinned != null)    $('#stat-pinned-anns').text(Number(json.pinned).toLocaleString());
        if (json.draft != null)     $('#stat-draft-anns').text(Number(json.draft).toLocaleString());
    });

    function loadTable() {
        table;
    }

    function deleteAnn(ann_id) {
        var locale  = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var annLoc  = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.ann && window.i18nLocales.admin.ann[locale]) || {};
        var msg     = (annLoc.index && annLoc.index.delete_confirm) || '确定删除此公告？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: "/admin/announcement/" + ann_id,
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
