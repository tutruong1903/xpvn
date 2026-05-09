{include file='admin/header.tpl'}

<link href="/assets/css/admin/system.css{asset_ver path="/assets/css/admin/system.css"}" rel="stylesheet"/>

<div class="container-xl">
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.system.index.title">系统状态</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.system.index.subtitle">查看系统的运行状态</p>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-sys-table-wrap">
            <table class="lmn-sys-table">
                <tbody>
                    <tr>
                        <td class="lmn-sys-table__label" data-i18n="admin.system.index.version_label">应用版本</td>
                        <td class="lmn-sys-table__value">
                            <span id="version-value">{$version}</span>
                            <button id="version_check" type="button" class="lmn-sys-check-btn">
                                <span class="material-symbols-outlined">refresh</span>
                                <span data-i18n="admin.system.index.check_btn">检查</span>
                            </button>
                            <span id="version-badge" style="display:none;"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="lmn-sys-table__label" data-i18n="admin.system.index.db_version_label">数据库版本</td>
                        <td class="lmn-sys-table__value lmn-mono">{$db_version}</td>
                    </tr>
                    <tr>
                        <td class="lmn-sys-table__label" data-i18n="admin.system.index.last_job_label">上次每日任务</td>
                        <td class="lmn-sys-table__value lmn-mono">{$last_daily_job_time}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $('#version_check').click(function () {
        var btn = $(this);
        btn.prop('disabled', true);
        $.ajax({
            url: '/admin/system/check_update',
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                var locale  = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
                var sysLoc  = (window.i18nLocales && window.i18nLocales.admin && window.i18nLocales.admin.system && window.i18nLocales.admin.system[locale]) || {};
                var idx     = sysLoc.index || {};
                var badge   = $('#version-badge');
                badge.show();
                badge.removeClass('lmn-sys-badge lmn-sys-badge--ok lmn-sys-badge--update lmn-sys-badge--error');

                if (data.ret === 0) {
                    badge.addClass('lmn-sys-badge lmn-sys-badge--error');
                    badge.html('<span class="material-symbols-outlined">wifi_off</span> ' + (data.msg || 'Update server unreachable'));
                } else if (data.is_upto_date) {
                    badge.addClass('lmn-sys-badge lmn-sys-badge--ok');
                    badge.html('<span class="material-symbols-outlined">check_circle</span> ' + (idx.up_to_date || 'Up to date'));
                } else {
                    badge.addClass('lmn-sys-badge lmn-sys-badge--update');
                    badge.html('<span class="material-symbols-outlined">new_releases</span> ' + (idx.new_version || 'New version available') + ': ' + data.latest_version);
                }
            },
            error: function () {
                var badge = $('#version-badge');
                badge.show();
                badge.removeClass('lmn-sys-badge lmn-sys-badge--ok lmn-sys-badge--update lmn-sys-badge--error');
                badge.addClass('lmn-sys-badge lmn-sys-badge--error');
                badge.html('<span class="material-symbols-outlined">wifi_off</span> Request failed');
            },
            complete: function () {
                btn.prop('disabled', false);
            }
        });
    });
</script>

{include file='admin/footer.tpl'}
