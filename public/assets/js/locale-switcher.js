/**
 * Language Switcher Component
 * Renders a Bootstrap dropdown for switching locale.
 * Can be embedded anywhere by calling: sspanelLocaleSwitcher.render(targetElement)
 * Or auto-renders into any element with id="locale-switcher".
 */
(function () {
    var supportedLocales = ["en_US", "zh_CN", "zh_TW", "ja_JP", "vn_VN"];
    var localeLabels = { en_US: "English", zh_CN: "中文", zh_TW: "正體中文", ja_JP: "日本語", vn_VN: "Tiếng Việt" };
    var localeFlags = { en_US: "🇺🇸", zh_CN: "🇨🇳", zh_TW: "🇹🇼", ja_JP: "🇯🇵", vn_VN: "🇻🇳" };

    function getLocale() {
        var stored = localStorage.getItem("sspanel_locale");
        // Validate stored locale is in supported list
        if (stored && supportedLocales.indexOf(stored) !== -1) {
            return stored;
        }
        return "en_US";
    }

    function buildSwitcherHTML(locale) {
        var menuItems = "";
        supportedLocales.forEach(function (loc) {
            var active = loc === locale ? " active" : "";
            menuItems += '<a class="dropdown-item' + active + '" href="#" data-locale="' + loc + '">'
                + localeFlags[loc] + " " + localeLabels[loc] + "</a>";
        });

        return '<div class="dropdown d-inline-block">' +
            '<button id="locale-switcher-btn" class="btn btn-outline-secondary shadow-sm" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
            '<i class="ti ti-language icon"></i> ' + localeFlags[locale] + " " + localeLabels[locale] +
            '</button>' +
            '<div class="dropdown-menu dropdown-menu-end">' + menuItems + "</div>" +
            "</div>";
    }

    function bindEvents(container) {
        container.querySelectorAll("[data-locale]").forEach(function (item) {
            item.addEventListener("click", function (e) {
                e.preventDefault();
                var loc = this.getAttribute("data-locale");
                if (window.sspanelI18n) {
                    window.sspanelI18n.setLocale(loc);
                }
                // Update active state in all switchers on the page
                document.querySelectorAll(".locale-switcher-root [data-locale]").forEach(function (a) {
                    a.classList.remove("active");
                    if (a.getAttribute("data-locale") === loc) {
                        a.classList.add("active");
                    }
                });
                // Update all switcher button labels
                updateAllLabels(loc);
            });
        });
    }

    function updateAllLabels(locale) {
        document.querySelectorAll("#locale-switcher-btn, .locale-switcher-btn").forEach(function (btn) {
            btn.innerHTML = '<i class="ti ti-language icon"></i> ' + localeFlags[locale] + " " + localeLabels[locale];
        });
    }

    /**
     * Render the switcher into a target element.
     * @param {HTMLElement} target - The container element to render into.
     */
    function render(target) {
        var locale = getLocale();
        target.classList.add("locale-switcher-root");
        target.innerHTML = buildSwitcherHTML(locale);
        bindEvents(target);
    }

    // Auto-render into elements with id="locale-switcher" or class="locale-switcher"
    document.addEventListener("DOMContentLoaded", function () {
        // Remove any legacy floating switcher created by old cached i18n.js
        var legacy = document.getElementById("locale-switcher-btn");
        if (legacy) {
            var legacyRoot = legacy.closest(".position-fixed");
            if (legacyRoot && !legacyRoot.classList.contains("locale-switcher-root")) {
                legacyRoot.remove();
            }
        }

        var targets = document.querySelectorAll("#locale-switcher, .locale-switcher");
        if (targets.length > 0) {
            targets.forEach(function (el) { render(el); });
        } else {
            // Fallback: create floating switcher at bottom-right
            var container = document.createElement("div");
            container.className = "locale-switcher-root position-fixed";
            container.style.cssText = "bottom:20px;right:20px;z-index:1050;";
            document.body.appendChild(container);
            render(container);
        }
    });

    // Expose for external use
    window.sspanelLocaleSwitcher = {
        render: render,
        updateAllLabels: updateAllLabels,
        supportedLocales: supportedLocales,
        localeLabels: localeLabels,
        localeFlags: localeFlags
    };
})();
