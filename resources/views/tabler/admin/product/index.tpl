{include file='admin/header.tpl'}

<link href="/assets/css/admin/product-index.css{asset_ver path="/assets/css/admin/product-index.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.product.index.title">商品列表</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.product.index.subtitle">管理所有商品和订阅套餐。</p>
        </div>
        <div class="lmn-page-header__actions">
            <a href="/admin/product/create" class="lmn-btn-primary">
                <span class="material-symbols-outlined">add</span>
                <span data-i18n="admin.product.index.create_btn">创建</span>
            </a>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.product.index.stat_total">总商品数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.product.index.stat_active">正常销售</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--success" id="stat-active">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.product.index.stat_inactive">已下架</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--danger" id="stat-inactive">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.product.index.stat_sales">累计销售</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--primary" id="stat-sales">—</span>
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
                       data-i18n-placeholder="admin.product.index.search_placeholder"
                       placeholder="找 ID、名称或类型...">
            </div>
            {if isset($details['filter']) && $details['filter']}
            <div class="lmn-filter-dropdown" id="lmn-filter-dropdown">
                <button id="lmn-filter-toggle" class="lmn-filter-btn" aria-expanded="false">
                    <span class="material-symbols-outlined">filter_list</span>
                    <span data-i18n="admin.product.filter.filter_btn">筛选</span>
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
                        <th data-i18n="admin.product.fields.{$key}">{$value}</th>
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
        url: '/admin/product/ajax',
        type: 'POST',
        dataSrc: 'products'
    };
    tableConfig.order = [[1, 'desc']];
    tableConfig.columnDefs = [{ targets: [0], orderable: false }];

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

    /* Search */
    $('#lmn-table-search').on('keyup', function () {
        table.search(this.value).draw();
    });

    /* Populate stats from AJAX response */
    table.on('xhr', function () {
        var json = table.ajax.json();
        if (!json) return;
        if (json.total    != null) $('#stat-total').text(Number(json.total).toLocaleString());
        if (json.active   != null) $('#stat-active').text(Number(json.active).toLocaleString());
        if (json.inactive != null) $('#stat-inactive').text(Number(json.inactive).toLocaleString());
        if (json.sales    != null) $('#stat-sales').text(Number(json.sales).toLocaleString());
    });

    function deleteProduct(product_id) {
        var locale     = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var productLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.product && window.i18nLocales.admin.product[locale]) || {};
        var msg        = (productLoc.index && productLoc.index.delete_confirm) || '确定删除此产品？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: '/admin/product/' + product_id,
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

    function copyProduct(product_id) {
        var locale     = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var productLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.product && window.i18nLocales.admin.product[locale]) || {};
        var msg        = (productLoc.index && productLoc.index.copy_confirm) || '确定复制此产品？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: '/admin/product/' + product_id + '/copy',
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
