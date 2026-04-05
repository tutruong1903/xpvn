/**
 * SSPanel-UIM Client-side i18n (guest + user panel)
 * - data-i18n / data-i18n-placeholder / data-i18n-html → window.i18nLocales.{locale}
 * - data-i18n-user-header / data-i18n-user-sidebar / data-i18n-user-dashboard
 *   → window.i18nLocales.user.{header|sidebar|dashboard}.{locale}
 *
 * Language switcher: /assets/js/locale-switcher.js
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
        // Refresh Platform Hub to update client descriptions
        if (typeof window.refreshPlatformHub === "function") {
            window.refreshPlatformHub();
        }
    }

    function getTranslations(locale) {
        var locales = window.i18nLocales || {};
        return locales[locale] || locales[defaultLocale] || {};
    }

    /**
     * User panel split locale files: window.i18nLocales.user.{header|sidebar|dashboard}.{locale}
     */
    function getUserSectionDict(locale, section) {
        var user = (window.i18nLocales && window.i18nLocales.user) || {};
        var sec = user[section];
        if (!sec || typeof sec !== "object") {
            return {};
        }
        var byLang = sec[locale] || sec[defaultLocale] || {};
        return typeof byLang === "object" ? byLang : {};
    }

    function applyAttributeFromDict(selector, attrName, dict) {
        document.querySelectorAll(selector).forEach(function (el) {
            var key = el.getAttribute(attrName);
            if (!key) return;
            var val = resolveKey(dict, key);
            if (val) {
                el.textContent = replacePlaceholders(val);
            }
        });
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

        applyAttributeFromDict(
            "[data-i18n-user-header]",
            "data-i18n-user-header",
            getUserSectionDict(locale, "header"),
        );
        applyAttributeFromDict(
            "[data-i18n-user-sidebar]",
            "data-i18n-user-sidebar",
            getUserSectionDict(locale, "sidebar"),
        );
        applyAttributeFromDict(
            "[data-i18n-user-dashboard]",
            "data-i18n-user-dashboard",
            getUserSectionDict(locale, "dashboard"),
        );
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
