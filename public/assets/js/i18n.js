/**
 * SSPanel-UIM Client-side i18n for guest pages (landing, login, register)
 * Stores language preference in localStorage and swaps text via data-i18n attributes.
 *
 * Locale files are loaded from /assets/js/locales/{locale}.js
 * They register themselves on window.i18nLocales.{locale}
 *
 * The language switcher UI is in /assets/js/locale-switcher.js
 */
(function () {
    var defaultLocale = "en_US";
    var supportedLocales = ["en_US", "zh_CN", "zh_TW", "ja_JP", "vn_VN"];

    function getLocale() {
        var stored = localStorage.getItem("sspanel_locale");
        if (stored && supportedLocales.indexOf(stored) !== -1) {
            return stored;
        }
        return defaultLocale;
    }

    function setLocale(locale) {
        localStorage.setItem("sspanel_locale", locale);
        applyTranslations(locale);
        if (window.sspanelLocaleSwitcher) {
            window.sspanelLocaleSwitcher.updateAllLabels(locale);
        }
        if (typeof window.updateCollapsedSidebarTooltips === "function") {
            window.updateCollapsedSidebarTooltips();
        }
    }

    function getTranslations(locale) {
        var locales = window.i18nLocales || {};
        return locales[locale] || locales[defaultLocale] || {};
    }

    function resolveKey(dict, key) {
        if (key.indexOf('.') === -1) {
            return dict[key];
        }
        var parts = key.split('.');
        var val = dict;
        for (var i = 0; i < parts.length; i++) {
            if (val && typeof val === 'object' && parts[i] in val) {
                val = val[parts[i]];
            } else {
                return undefined;
            }
        }
        return typeof val === 'string' ? val : undefined;
    }

    function replacePlaceholders(text) {
        if (!text) return text;
        var config = window.siteConfig || {};
        return text.replace(/\{appName\}/g, config.appName || '');
    }

    function applyTranslations(locale) {
        var dict = getTranslations(locale);
        document.querySelectorAll("[data-i18n]").forEach(function (el) {
            var key = el.getAttribute("data-i18n");
            var val = resolveKey(dict, key);
            if (val) {
                el.textContent = replacePlaceholders(val);
            }
        });
        document.querySelectorAll("[data-i18n-placeholder]").forEach(function (el) {
            var key = el.getAttribute("data-i18n-placeholder");
            var val = resolveKey(dict, key);
            if (val) {
                el.setAttribute("placeholder", replacePlaceholders(val));
            }
        });
        document.querySelectorAll("[data-i18n-html]").forEach(function (el) {
            var key = el.getAttribute("data-i18n-html");
            var val = resolveKey(dict, key);
            if (val) {
                el.innerHTML = replacePlaceholders(val);
            }
        });
    }

    // Initialize
    document.addEventListener("DOMContentLoaded", function () {
        applyTranslations(getLocale());
    });

    // Expose for external use
    window.sspanelI18n = {
        setLocale: setLocale,
        getLocale: getLocale,
        applyTranslations: applyTranslations,
        getTranslations: getTranslations,
        /** Alias: re-apply strings for current locale (same as applyTranslations(getLocale())). */
        updateContent: function () {
            applyTranslations(getLocale());
        },
    };
})();
