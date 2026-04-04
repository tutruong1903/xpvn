<div class="modal modal-blur fade" id="success-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-success"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-circle-check icon mb-2 text-green icon-lg" style="font-size:3.5rem;"></i>
                <p id="success-message" class="text-secondary" data-i18n="admin.dialog.success">成功</p>
            </div>
            <div class="modal-footer">
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <a id="success-confirm" href="" class="btn w-100" data-bs-dismiss="modal">
                                <span data-i18n="admin.dialog.ok">好</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-blur fade" id="fail-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-danger"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-circle-x icon mb-2 text-danger icon-lg" style="font-size:3.5rem;"></i>
                <p id="fail-message" class="text-secondary" data-i18n="admin.dialog.fail">失败</p>
            </div>
            <div class="modal-footer">
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <a href="" class="btn btn-danger w-100" data-bs-dismiss="modal">
                                <span data-i18n="admin.dialog.confirm">确认</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-blur fade" id="notice-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-yellow"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-alert-circle icon mb-2 text-yellow icon-lg" style="font-size:3.5rem;"></i>
                <p id="notice-message" class="text-secondary" data-i18n="admin.dialog.notice">注意</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn me-auto" data-bs-dismiss="modal">
                    <span data-i18n="admin.dialog.cancel">取消</span>
                </button>
                <button id="notice-confirm" type="button" class="btn btn-yellow" data-bs-dismiss="modal">
                    <span data-i18n="admin.dialog.confirm">确认</span>
                </button>
            </div>
        </div>
    </div>
</div>

<footer class="footer footer-transparent d-print-none">
    <div class="container-xl">
        <div class="row text-center align-items-center flex-row-reverse">
            <div class="col-lg-auto ms-lg-auto">
                <ul class="list-inline list-inline-dots mb-0">
                    <li class="list-inline-item">
                        Powered by <a href="/staff" class="link-secondary">SSPanel-UIM</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>
</div>
</div>
<!-- js -->
<script src="//{$config['jsdelivr_url']}/npm/@tabler/core@latest/dist/js/tabler.min.js"></script>
<script>
    let successDialog = new tabler.bootstrap.Modal(document.getElementById('success-dialog'));
    let failDialog = new tabler.bootstrap.Modal(document.getElementById('fail-dialog'));

    /* Sidebar toggle (collapse/expand) — reuses same logic as user sidebar */
    (function () {
        var sidebar = document.getElementById('sidebar');
        var overlay = document.getElementById('sidebar-overlay');
        var toggleBtn = document.getElementById('sidebar-toggle');
        var isMobile = window.innerWidth < 992;
        var collapsed = localStorage.getItem('admin_sidebar_collapsed') === '1';

        function applySidebarState() {
            if (!isMobile && collapsed) {
                document.body.classList.add('sidebar-collapsed');
            } else {
                document.body.classList.remove('sidebar-collapsed');
            }
            if (typeof window.updateCollapsedSidebarTooltips === 'function') {
                window.updateCollapsedSidebarTooltips();
            }
        }
        applySidebarState();

        window.addEventListener('resize', function () {
            isMobile = window.innerWidth < 992;
            applySidebarState();
        });

        if (toggleBtn) {
            toggleBtn.addEventListener('click', function () {
                if (isMobile) {
                    document.body.classList.toggle('sidebar-mobile-open');
                } else {
                    collapsed = !collapsed;
                    localStorage.setItem('admin_sidebar_collapsed', collapsed ? '1' : '0');
                    applySidebarState();
                }
            });
        }
        if (overlay) {
            overlay.addEventListener('click', function () {
                document.body.classList.remove('sidebar-mobile-open');
            });
        }
    })();

    /* Collapsed sidebar tooltips */
    window.updateCollapsedSidebarTooltips = function () {
        var isCollapsed = document.body.classList.contains('sidebar-collapsed');
        document.querySelectorAll('#sidebar .nav-link[data-path]').forEach(function (link) {
            var titleEl = link.querySelector('.nav-link-title');
            link.title = isCollapsed && titleEl ? titleEl.textContent.replace(/\s+/g, ' ').trim() : '';
        });
    };

    /* Header language switcher */
    (function () {
        var langLabels = {
            vn_VN: '🇻🇳 Tiếng Việt',
            en_US: '🇺🇸 English',
            zh_CN: '🇨🇳 中文',
            zh_TW: '🇹🇼 正體中文',
            ja_JP: '🇯🇵 日本語'
        };
        var badge = document.getElementById('lang-badge');

        function syncBadge(locale) {
            if (badge) badge.textContent = langLabels[locale] || locale;
        }

        var currentLocale = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
        syncBadge(currentLocale);

        document.querySelectorAll('.header-lang-option').forEach(function (el) {
            if (el.getAttribute('data-lang') === currentLocale) {
                el.classList.add('active');
            }
            el.addEventListener('click', function (e) {
                e.preventDefault();
                var lang = this.getAttribute('data-lang');
                if (window.sspanelI18n) {
                    window.sspanelI18n.setLocale(lang);
                }
                document.querySelectorAll('.header-lang-option').forEach(function (a) {
                    a.classList.remove('active');
                });
                this.classList.add('active');
                syncBadge(lang);
                if (typeof window.updateCollapsedSidebarTooltips === 'function') {
                    window.updateCollapsedSidebarTooltips();
                }
            });
        });
    })();

    if (typeof window.updateCollapsedSidebarTooltips === 'function') {
        window.updateCollapsedSidebarTooltips();
    }

    /* Active sidebar item highlight */
    (function () {
        var path = window.location.pathname.replace(/\/$/, '') || '/admin';
        var links = document.querySelectorAll('#sidebar .nav-link[data-path]');
        var bestMatch = null;
        var bestLen = 0;
        links.forEach(function (link) {
            var linkPath = link.getAttribute('data-path');
            if (path === linkPath || (path.indexOf(linkPath) === 0 && linkPath.length > bestLen)) {
                bestMatch = link;
                bestLen = linkPath.length;
            }
        });
        if (bestMatch) {
            bestMatch.classList.add('active');
        }
    })();

    /* Admin panel switch: pill toggle → /user when unchecked */
    (function () {
        var sw = document.getElementById('admin-panel-switch');
        if (!sw) return;
        sw.addEventListener('change', function () {
            if (!this.checked) {
                window.location.href = '/user';
            }
        });
    })();

    htmx.on("htmx:afterRequest", function(evt) {
        if (evt.detail.xhr.getResponseHeader('HX-Refresh') === 'true' ||
            evt.detail.xhr.getResponseHeader('HX-Redirect') ||
            evt.detail.xhr.getResponseHeader('HX-Trigger'))
        {
            return;
        }

        let res = JSON.parse(evt.detail.xhr.response);

        if (typeof res.data !== 'undefined') {
            for (let key in res.data) {
                if (res.data.hasOwnProperty(key)) {
                    let element = document.getElementById(key);

                    if (element) {
                        if (element.tagName === "INPUT" || element.tagName === "TEXTAREA") {
                            element.value = res.data[key];
                        } else {
                            element.innerHTML = res.data[key];
                        }
                    }
                }
            }
        }
        if (res.ret === 1) {
            document.getElementById("success-message").innerHTML = res.msg;
            successDialog.show();
        } else {
            document.getElementById("fail-message").innerHTML = res.msg;
            failDialog.show();
        }
    });
</script>
<script>console.table([['数据库查询', '执行时间'], ['{count($queryLog)} 次', '{$optTime} ms']])</script>

{include file='telemetry.tpl'}

</body>

</html>
