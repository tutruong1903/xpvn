{include file='admin/header.tpl'}

<link href="/assets/css/admin/coupon.css{asset_ver path="/assets/css/admin/coupon.css"}" rel="stylesheet"/>
<link rel="stylesheet" href="//{$config['jsdelivr_url']}/npm/flatpickr/dist/flatpickr.min.css">
{if $user->is_dark_mode}
    <link rel="stylesheet" href="//{$config['jsdelivr_url']}/npm/flatpickr/dist/themes/dark.min.css">
{/if}
<script src="//{$config['jsdelivr_url']}/npm/flatpickr"></script>
<script src="//{$config['jsdelivr_url']}/npm/flatpickr/dist/l10n/zh.js"></script>
<script src="//{$config['jsdelivr_url']}/npm/flatpickr/dist/l10n/zh-tw.js"></script>
<script src="//{$config['jsdelivr_url']}/npm/flatpickr/dist/l10n/ja.js"></script>
<script src="//{$config['jsdelivr_url']}/npm/flatpickr/dist/l10n/vn.js"></script>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.coupon.index.title">优惠码</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.coupon.index.subtitle">查看并管理优惠码。</p>
        </div>
        <div class="lmn-page-header__actions">
            <button type="button" class="lmn-btn-primary" data-bs-toggle="modal" data-bs-target="#create-dialog">
                <span class="material-symbols-outlined">add</span>
                <span data-i18n="admin.coupon.index.create_btn">创建</span>
            </button>
        </div>
    </div>

    <!-- Stats Overview -->
    <div class="lmn-stats-grid">
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.coupon.index.stat_total">总优惠码数</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value" id="stat-total">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.coupon.index.stat_active">启用中</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--success" id="stat-active">—</span>
            </div>
        </div>
        <div class="lmn-stat-card">
            <p class="lmn-stat-card__label" data-i18n="admin.coupon.index.stat_disabled">已禁用</p>
            <div class="lmn-stat-card__value-row">
                <span class="lmn-stat-card__value lmn-stat-card__value--danger" id="stat-disabled">—</span>
            </div>
        </div>
    </div>
</div>

<!-- Create Coupon Modal -->
<div class="modal modal-blur fade lmn-modal" id="create-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" data-i18n="admin.coupon.create_modal.title">创建优惠码</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                {foreach $details['create_dialog'] as $detail}
                    {if $detail['type'] === 'input'}
                        <div class="lmn-field">
                            <label class="lmn-field-label"
                                   data-i18n="admin.coupon.create_modal.{$detail['i18n_key']}">{$detail['info']}</label>
                            <input id="{$detail['id']}" type="text" class="lmn-field-input"
                                   placeholder="{$detail['placeholder']}">
                        </div>
                    {/if}
                    {if $detail['type'] === 'textarea'}
                        <div class="lmn-field">
                            <label class="lmn-field-label"
                                   data-i18n="admin.coupon.create_modal.{$detail['i18n_key']}">{$detail['info']}</label>
                            <textarea id="{$detail['id']}" class="lmn-field-input" rows="{$detail['rows']}"
                                      placeholder="{$detail['placeholder']}"></textarea>
                        </div>
                    {/if}
                    {if $detail['type'] === 'select'}
                        <div class="lmn-field">
                            <label class="lmn-field-label"
                                   data-i18n="admin.coupon.create_modal.{$detail['i18n_key']}">{$detail['info']}</label>
                            <select id="{$detail['id']}" class="lmn-field-select">
                                {foreach $detail['select'] as $key => $value}
                                    <option value="{$key}"
                                            data-i18n="admin.coupon.create_modal.opt_{$key}">{$value}</option>
                                {/foreach}
                            </select>
                        </div>
                    {/if}
                {/foreach}
                <div class="lmn-field">
                    <label class="lmn-field-label"
                           data-i18n="admin.coupon.create_modal.expire_label">过期时间（留空则为不限制）</label>
                    <input id="expire_time" type="text" class="lmn-field-input" placeholder="">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="lmn-modal-cancel me-auto" data-bs-dismiss="modal"
                        data-i18n="admin.coupon.create_modal.cancel_btn">取消</button>
                <button type="button" class="lmn-modal-submit" onclick="createCoupon()"
                        data-bs-dismiss="modal"
                        data-i18n="admin.coupon.create_modal.submit_btn">创建</button>
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
                       data-i18n-placeholder="admin.coupon.index.search_placeholder"
                       placeholder="按ID或优惠码搜索...">
            </div>
        </div>

        <div class="lmn-table-card">
            <table id="data-table" class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                    {foreach $details['field'] as $key => $value}
                        <th data-i18n="admin.coupon.fields.{$key}">{$value}</th>
                    {/foreach}
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

{include file='datatable.tpl'}

<script>
    var _fpLocaleMap = {
        'zh_CN': flatpickr.l10ns.zh,
        'zh_TW': flatpickr.l10ns.zh_tw,
        'ja_JP': flatpickr.l10ns.ja,
        'vn_VN': flatpickr.l10ns.vn,
    };
    var _sspanelLocale = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
    var _fpLocale = _fpLocaleMap[_sspanelLocale] || 'en';

    flatpickr("#expire_time", {
        enableTime: true,
        dateFormat: "U",
        time_24hr: true,
        minDate: "today",
        locale: _fpLocale,
    });

    tableConfig.ajax = {
        url: '/admin/coupon/ajax',
        type: 'POST',
        dataSrc: 'coupons'
    };
    tableConfig.order = [[1, 'desc']];
    tableConfig.columnDefs = [
        { targets: [0],                           orderable: false },
        { targets: [3, 4, 5, 6, 7, 8, 9, 11, 12], searchable: false },
    ];

    let table = new DataTable('#data-table', tableConfig);

    $('#lmn-table-search').on('keyup', function () {
        table.search(this.value).draw();
    });

    table.on('xhr', function () {
        var json = table.ajax.json();
        if (!json) return;
        if (json.total    != null) $('#stat-total').text(Number(json.total).toLocaleString());
        if (json.active   != null) $('#stat-active').text(Number(json.active).toLocaleString());
        if (json.disabled != null) $('#stat-disabled').text(Number(json.disabled).toLocaleString());

        /* Translate type/yes/no badge text */
        var locale    = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var cpnLoc    = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.coupon && window.i18nLocales.admin.coupon[locale]) || {};
        var badges    = cpnLoc.badges || {};
        if (Object.keys(badges).length) {
            document.querySelectorAll('#data-table .lmn-badge').forEach(function (el) {
                var key = el.textContent.trim();
                if (badges[key]) el.textContent = badges[key];
            });
        }
    });

    function createCoupon() {
        $.ajax({
            url: '/admin/coupon',
            type: 'POST',
            dataType: 'json',
            data: {
                {foreach $details['create_dialog'] as $detail}
                {$detail['id']}: $('#{$detail['id']}').val(),
                {/foreach}
                expire_time: $('#expire_time').val(),
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

    function deleteCoupon(coupon_id) {
        var locale = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var cpnLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.coupon && window.i18nLocales.admin.coupon[locale]) || {};
        var msg    = (cpnLoc.index && cpnLoc.index.delete_confirm) || '确定删除此优惠码？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: '/admin/coupon/' + coupon_id,
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

    function disableCoupon(coupon_id) {
        var locale = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        var cpnLoc = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.coupon && window.i18nLocales.admin.coupon[locale]) || {};
        var msg    = (cpnLoc.index && cpnLoc.index.disable_confirm) || '确定禁用此优惠码？';
        $('#notice-message').text(msg);
        $('#notice-dialog').modal('show');
        $('#notice-confirm').off('click').on('click', function () {
            $.ajax({
                url: '/admin/coupon/' + coupon_id + '/disable',
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

