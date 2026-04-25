{include file='admin/header.tpl'}

<link href="/assets/css/admin/user-index.css{asset_ver path="/assets/css/admin/user-index.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.user.index.title">用户列表</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.user.index.subtitle">系统中所有用户的列表</p>
        </div>
        <div class="lmn-page-header__actions">
            <button class="lmn-btn-primary" data-bs-toggle="modal" data-bs-target="#create-dialog">
                <span class="material-symbols-outlined">add</span>
                <span data-i18n="admin.user.index.create_btn">创建</span>
            </button>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.user.index.stat_total">总用户数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total-users">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.user.index.stat_active">活跃用户</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-active-users">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.user.index.stat_banned">已封禁</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--danger" id="stat-banned-users">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.user.index.stat_admins">管理员</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--primary" id="stat-admin-users">—</span>
            </div>
        </div>
    </div>
</div>

<!-- Filter config (optional) — define before datatable.tpl is included -->
{if isset($details['filter']) && $details['filter']}
<script>
    window._dtFilterConfig = {$details['filter']|json_encode};
</script>
{/if}

<div class="page-body pt-0">
    <div class="container-xl">

        <!-- Search & Filter bar (above table card, matching design) -->
        <div class="lmn-table-actions mb-4">
            <div class="lmn-table-search-wrap">
                <span class="material-symbols-outlined lmn-table-search-icon">search</span>
                <input type="text"
                       id="lmn-table-search"
                       class="lmn-table-search-input"
                       data-i18n-placeholder="admin.user.datatable.search_placeholder"
                       placeholder="Tìm kiếm nhanh ID, tên hoặc email...">
            </div>
            {if isset($details['filter']) && $details['filter']}
            <div class="lmn-filter-dropdown" id="lmn-filter-dropdown">
                <button id="lmn-filter-toggle" class="lmn-filter-btn" aria-expanded="false">
                    <span class="material-symbols-outlined">filter_list</span>
                    <span data-i18n="admin.user.index.filter_btn">Bộ lọc</span>
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
                        <th data-i18n="admin.user.fields.{$key}">{$value}</th>
                    {/foreach}
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<!-- Create User Dialog -->
<div class="modal modal-blur fade" id="create-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content lmn-modal-content">
            <div class="modal-header lmn-modal-header">
                <h5 class="modal-title" data-i18n="admin.user.index.create_dialog_title">添加用户</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                {foreach $details['create_dialog'] as $from}
                    {if $from['type'] === 'input'}
                        <div class="form-group mb-3 row">
                            <label class="form-label col-3 col-form-label">{$from['info']}</label>
                            <div class="col">
                                <input id="{$from['id']}" type="text" class="form-control lmn-input"
                                       placeholder="{$from['placeholder']}">
                            </div>
                        </div>
                    {/if}
                    {if $from['type'] === 'textarea'}
                        <div class="form-group mb-3 row">
                            <label class="form-label col-3 col-form-label">{$from['info']}</label>
                            <textarea id="{$from['id']}" class="col form-control lmn-input" rows="{$from['rows']}"
                                      placeholder="{$from['placeholder']}"></textarea>
                        </div>
                    {/if}
                    {if $from['type'] === 'select'}
                        <div class="form-group mb-3 row">
                            <label class="form-label col-3 col-form-label">{$from['info']}</label>
                            <div class="col">
                                <select id="{$from['id']}" class="col form-select lmn-input">
                                    {foreach $from['select'] as $key => $value}
                                        <option value="{$key}">{$value}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    {/if}
                {/foreach}
            </div>
            <div class="modal-footer lmn-modal-footer">
                <button type="button" class="lmn-btn-ghost" data-bs-dismiss="modal">
                    <span data-i18n="admin.dialog.cancel">取消</span>
                </button>
                <button id="create-button" type="button" class="lmn-btn-primary" data-bs-dismiss="modal">
                    <span data-i18n="admin.user.index.create_dialog_submit">添加</span>
                </button>
            </div>
        </div>
    </div>
</div>

{include file='datatable.tpl'}

<script>
    tableConfig.ajax = {
        url: '/admin/user/ajax',
        type: 'POST',
        dataSrc: 'users'
    };
    tableConfig.order = [
        [1, 'asc']
    ];
    tableConfig.columnDefs = [
        { targets: [0, 6, 7], orderable: false },
        { targets: [0, 5, 6, 7], className: 'text-center' },
        { targets: [4], className: 'text-end' },
    ];

    let table = new DataTable('#data-table', tableConfig);

    /* Re-translate badges on every page draw */
    table.on('draw.dt', function () {
        if (typeof window._dtTranslateBadges === 'function') {
            window._dtTranslateBadges();
        }
    });

    /* ---- Locale-change hook: keep DT-rendered content in sync ---- */
    (function () {
        var origSet = window.sspanelI18n && window.sspanelI18n.setLocale;
        if (!origSet) return;
        window.sspanelI18n.setLocale = function (locale) {
            origSet.call(window.sspanelI18n, locale);

            /* 1) Re-translate AJAX-rendered badges */
            if (typeof window._dtTranslateBadges === 'function') {
                window._dtTranslateBadges();
            }

            /* 2) Update DT footer info text to reflect the new locale */
            try {
                var pageInfo = table.page.info();
                var admin   = (window.i18nLocales && window.i18nLocales.admin) || {};
                var userSec = (admin.user && admin.user[locale]) || (admin.user && admin.user['en_US']) || {};
                var dtStr   = userSec.datatable || {};
                var tmpl    = pageInfo.recordsDisplay > 0
                    ? (dtStr.info       || 'Showing _START_ \u2013 _END_ of _TOTAL_')
                    : (dtStr.info_empty || 'Showing 0 \u2013 0 of 0');
                var text = tmpl
                    .replace(/_START_/g, String(pageInfo.start + 1))
                    .replace(/_END_/g,   String(pageInfo.end))
                    .replace(/_TOTAL_/g, String(pageInfo.recordsDisplay));
                document.querySelectorAll('.dt-info').forEach(function (el) {
                    el.textContent = text;
                });
            } catch (e) { /* table not yet ready */ }
        };
    }());

    /* Filter dropdown toggle */
    $('#lmn-filter-toggle').on('click', function (e) {
        e.stopPropagation();
        var $dropdown = $('#lmn-filter-dropdown');
        var isOpen = $dropdown.hasClass('is-open');
        $dropdown.toggleClass('is-open', !isOpen);
        $(this).attr('aria-expanded', String(!isOpen));
        $('#lmn-filter-panel').attr('aria-hidden', String(isOpen));
    });
    /* Close on outside click */
    $(document).on('click', function (e) {
        if (!$(e.target).closest('#lmn-filter-dropdown').length) {
            $('#lmn-filter-dropdown').removeClass('is-open');
            $('#lmn-filter-toggle').attr('aria-expanded', 'false');
        }
    });

    /* Populate stats from AJAX response */
    tableConfig.ajax.success = function () {};
    table.on('xhr', function () {
        var json = table.ajax.json();
        if (!json) return;
        if (json.total != null)   $('#stat-total-users').text(Number(json.total).toLocaleString());
        if (json.active != null)  $('#stat-active-users').text(Number(json.active).toLocaleString());
        if (json.banned != null)  $('#stat-banned-users').text(Number(json.banned).toLocaleString());
        if (json.admins != null)  $('#stat-admin-users').text(Number(json.admins).toLocaleString());
    });

    function loadTable() {
        table;
    }

    $("#create-button").click(function () {
        $.ajax({
            type: "POST",
            url: "/admin/user/create",
            dataType: "json",
            data: {
                {foreach $details['create_dialog'] as $from}
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

    function deleteUser(user_id) {
        var locale  = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var userLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.user && window.i18nLocales.admin.user[locale]) || {};
        var msg     = (userLoc.index && userLoc.index.delete_confirm) || '确定删除此用户？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: "/admin/user/" + user_id,
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
