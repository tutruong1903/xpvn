<link href="//cdn.datatables.net/v/bs5/dt-2.0.8/datatables.min.css" rel="stylesheet"/>
<link href="/assets/css/datatable-luminous.css{asset_ver path="/assets/css/datatable-luminous.css"}" rel="stylesheet"/>
<script src="//cdn.datatables.net/v/bs5/dt-2.0.8/datatables.min.js"></script>

<script>
    /* Luminous Guardian — DataTable shared config */
    /* i18n is resolved after DOMContentLoaded when locale files are guaranteed loaded */
    function _dt(key, fallback) {
        var locale  = (window.sspanelI18n && window.sspanelI18n.getLocale) ? window.sspanelI18n.getLocale() : 'en_US';
        var admin   = (window.i18nLocales && window.i18nLocales.admin) || {};
        var userSec = (admin.user && admin.user[locale]) || (admin.user && admin.user['en_US']) || {};
        var dt      = userSec.datatable || {};
        return dt[key] || fallback;
    }

    let tableConfig = {
        autoWidth: false,
        pageLength: 10,
        layout: {
            topStart:    null,
            topEnd:      null,
            bottomStart: 'info',
            bottomEnd: {
                paging: { type: 'simple_numbers' }
            }
        },
        columns: [
            {foreach $details['field'] as $key => $value}
            {
                data: '{$key}',
                render: function (data) {
                    return data !== null && data !== undefined ? data : '';
                }
            },
            {/foreach}
        ],
        initComplete: function () {
            var api = this.api();

            /* Wire external search input */
            var $extSearch = $('#lmn-table-search');
            if ($extSearch.length) {
                $extSearch.on('input', function () {
                    api.search(this.value).draw();
                });
            }

            /* Build optional filter panel */
            if (typeof window._dtFilterConfig !== 'undefined' && window._dtFilterConfig.length > 0) {
                _buildFilterPanel(api);
            }

            /* Translate badges on first render */
            _translateBadges();
        },
        language: {
            processing:     _dt('processing',    'Processing...'),
            zeroRecords:    _dt('zero_records',  'No matching records found'),
            info:           _dt('info',          'Showing _START_ – _END_ of _TOTAL_'),
            infoEmpty:      _dt('info_empty',    'Showing 0 – 0 of 0'),
            infoFiltered:   _dt('info_filtered', '(filtered from _MAX_ total)'),
            emptyTable:     _dt('empty_table',   'No data available'),
            loadingRecords: _dt('loading',       'Loading...'),
            thousands: ',',
            paginate: {
                previous: '<span class="material-symbols-outlined lmn-page-icon">chevron_left</span>',
                next:     '<span class="material-symbols-outlined lmn-page-icon">chevron_right</span>'
            },
            aria: {
                sortAscending:  _dt('sort_asc',  ': activate to sort ascending'),
                sortDescending: _dt('sort_desc', ': activate to sort descending')
            }
        }
    };

    /* Inject column filter dropdowns into #lmn-filter-panel (provided by the page) */
    function _buildFilterPanel(api) {
        var filters = window._dtFilterConfig;
        var $wrap = $('<div class="lmn-dt-filter-inner"></div>');

        filters.forEach(function (f) {
            var $group = $('<div class="lmn-dt-filter-group"></div>');
            $group.append('<label class="lmn-dt-filter-label">' + (f.label || f.field) + '</label>');

            var $sel = $('<select class="lmn-dt-filter-select"></select>');
            Object.keys(f.values).forEach(function (k) {
                $sel.append($('<option>', { value: k, text: f.values[k] }));
            });

            var colIdx = -1;
            api.columns().every(function (i) {
                var colDef = api.settings()[0].aoColumns[i];
                if (colDef && colDef.data === f.field) { colIdx = i; }
            });

            if (colIdx >= 0) {
                $sel.on('change', function () {
                    var val = $(this).val();
                    api.column(colIdx).search(val, false, false).draw();
                });
            }

            $group.append($sel);
            $wrap.append($group);
        });

        var $panel = $('#lmn-filter-panel');
        if ($panel.length) {
            $panel.empty().append($wrap);
        } else {
            $(api.table().container()).before($wrap);
        }
    }

    /**
     * Translate .lmn-badge spans using the 'badges' locale section.
     * Reads class modifier: lmn-badge--active → badges.active
     * Exposed globally so pages can call it after every draw.
     */
    function _translateBadges() {
        var locale = (window.sspanelI18n && window.sspanelI18n.getLocale) ? window.sspanelI18n.getLocale() : 'en_US';
        var admin   = (window.i18nLocales && window.i18nLocales.admin) || {};
        var userSec = (admin.user && admin.user[locale]) || (admin.user && admin.user['en_US']) || {};
        var badges  = userSec.badges || {};
        if (!Object.keys(badges).length) return;

        document.querySelectorAll('#data-table .lmn-badge').forEach(function (el) {
            var cls = el.className || '';
            var m = cls.match(/lmn-badge--([a-z0-9_-]+)/);
            if (!m) return;
            var key = m[1].replace(/-/g, '_'); /* class-basic → class_basic */
            if (badges[key]) el.textContent = badges[key];
        });
    }

    /* Expose for page scripts */
    window._dtTranslateBadges = _translateBadges;
    window._dt = _dt; /* expose locale-aware DT string resolver */
</script>
