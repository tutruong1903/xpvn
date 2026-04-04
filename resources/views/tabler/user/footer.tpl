<div class="modal modal-blur fade" id="success-dialog" role="dialog">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-success"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-circle-check icon mb-2 text-green icon-lg" style="font-size:3.5rem;"></i>
                <p id="success-message" class="text-secondary">成功</p>
            </div>
            <div class="modal-footer">
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <button type="button" id="success-confirm" class="btn w-100" data-bs-dismiss="modal">
                                好
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-blur fade" id="fail-dialog" role="dialog">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-danger"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-circle-x icon mb-2 text-danger icon-lg" style="font-size:3.5rem;"></i>
                <p id="fail-message" class="text-secondary">失败</p>
            </div>
            <div class="modal-footer">
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <a href="" class="btn btn-danger w-100" data-bs-dismiss="modal">
                                确认
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<script src="//{$config['jsdelivr_url']}/npm/@tabler/core@latest/dist/js/tabler.min.js"></script>
<script>
    /* Sidebar toggle (collapse/expand) */
    (function () {
        var sidebar = document.getElementById('sidebar');
        var overlay = document.getElementById('sidebar-overlay');
        var toggleBtn = document.getElementById('sidebar-toggle');
        var isMobile = window.innerWidth < 992;
        var collapsed = localStorage.getItem('sidebar_collapsed') === '1';

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
                    localStorage.setItem('sidebar_collapsed', collapsed ? '1' : '0');
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

    /* Header language switcher (separate dropdown) */
    window.updateCollapsedSidebarTooltips = function () {
        var collapsed = document.body.classList.contains('sidebar-collapsed');
        document.querySelectorAll('#sidebar .nav-link[data-path]').forEach(function (link) {
            var titleEl = link.querySelector('.nav-link-title');
            link.title = collapsed && titleEl ? titleEl.textContent.replace(/\s+/g, ' ').trim() : '';
        });
    };

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
        var path = window.location.pathname.replace(/\/$/, '') || '/user';
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

    /* Admin panel switch: pill toggle → /admin when checked */
    (function () {
        var sw = document.getElementById('admin-panel-switch');
        if (!sw) return;
        sw.addEventListener('change', function () {
            if (this.checked) {
                window.location.href = '/admin';
            }
        });
    })();
</script>
<script>
    function showToast(message, type = 'success') {
        const toast = document.createElement('div');
        const bgColor = type === 'danger' ? 'bg-danger' : 'bg-success';
        toast.className = 'position-fixed top-0 start-50 translate-middle-x mt-3 ' + bgColor + ' text-white px-4 py-2 rounded';
        toast.style.zIndex = '9999';
        toast.textContent = message;
        document.body.appendChild(toast);
        setTimeout(function() {
            toast.remove();
        }, 2000);
    }

    window.addEventListener('load', function() {
        if (typeof tabler !== 'undefined' && tabler.bootstrap) {
            window.successDialog = new tabler.bootstrap.Modal(document.getElementById('success-dialog'));
            window.failDialog = new tabler.bootstrap.Modal(document.getElementById('fail-dialog'));
        }
    });

    // Initialize clipboard functionality
    if (typeof ClipboardJS !== 'undefined' && document.querySelector('.copy')) {
        let clipboard = new ClipboardJS('.copy');
        clipboard.on('success', function(e) {
            showToast('已复制到剪切板');
            e.clearSelection();
        });
        
        clipboard.on('error', function(e) {
            console.error('复制失败:', e);
            const text = e.trigger.getAttribute('data-clipboard-text');
            if (text) {
                // Try native API first, fallback to prompt
                if (navigator.clipboard && navigator.clipboard.writeText) {
                    navigator.clipboard.writeText(text).then(function() {
                        showToast('已复制到剪切板');
                    }).catch(function(err) {
                        console.error('原生 API 也失败了:', err);
                        prompt('复制失败，请手动复制以下内容：', text);
                    });
                } else {
                    prompt('复制失败，请手动复制以下内容：', text);
                }
            } else {
                showToast('复制失败，请重试', 'danger');
            }
        });
    } else if (typeof ClipboardJS === 'undefined') {
        console.error('ClipboardJS library not loaded');
        document.querySelectorAll('.copy').forEach(function(btn) {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                const text = this.getAttribute('data-clipboard-text');
                if (text) {
                    prompt('请手动复制以下内容：', text);
                }
            });
        });
    }

    htmx.on("htmx:afterRequest", function(evt) {
        if (evt.detail.xhr.getResponseHeader('HX-Refresh') === 'true' ||
            evt.detail.xhr.getResponseHeader('HX-Trigger'))
        {
            return;
        }

        try {
            let res = JSON.parse(evt.detail.xhr.response);

            if (typeof res.data !== 'undefined') {
                // Update DOM elements with response data
                for (let key in res.data) {
                    if (res.data.hasOwnProperty(key)) {
                        if (key === "ga-url" && typeof qrcode !== 'undefined') {
                            qrcode.clear();
                            qrcode.makeCode(res.data[key]);
                            continue;
                        }

                        if (key === "last-checkin-time") {
                            const checkInBtn = document.getElementById("check-in");
                            checkInBtn.textContent = "已签到";
                            checkInBtn.disabled = true;
                            continue;
                        }

                        const element = document.getElementById(key);
                        if (element) {
                            if (element.tagName === "INPUT" || element.tagName === "TEXTAREA") {
                                element.value = res.data[key];
                            } else {
                                element.textContent = res.data[key];
                            }
                        }
                    }
                }
            }

            // Show success or error message
            const isSuccess = res.ret === 1;
            const messageId = isSuccess ? "success-message" : "fail-message";
            const dialog = isSuccess ? window.successDialog : window.failDialog;
            
            document.getElementById(messageId).textContent = res.msg;
            if (dialog) {
                dialog.show();
            } else {
                showToast(res.msg, isSuccess ? 'success' : 'danger');
            }
        } catch (e) {
            console.error("Failed to parse HTMX response:", e);
            showToast('发生了意外错误', 'danger');
        }
    });
</script>
<script>console.table([['数据库查询', '执行时间'], ['{count($queryLog)} 次', '{$optTime} ms']])</script>

{include file='live_chat.tpl'}

{include file='telemetry.tpl'}

</body>

</html>
