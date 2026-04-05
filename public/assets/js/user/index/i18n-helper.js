/**
 * i18n Helper Functions
 * Provides locale detection and translation utilities
 */

// Get current locale using sspanelI18n
function getCurrentLocale() {
    if (window.sspanelI18n && typeof window.sspanelI18n.getLocale === 'function') {
        return window.sspanelI18n.getLocale();
    }
    // Fallback
    return localStorage.getItem('sspanel_locale') || 'en_US';
}

// Get i18n text by key
function getI18n(key, fallback = '') {
    const locale = getCurrentLocale();
    const keys = key.split('.');
    let value = window.i18nLocales?.user?.dashboard?.[locale];
    
    for (const k of keys) {
        if (!value) break;
        value = value[k];
    }
    
    return value || fallback;
}

// Get i18n client description
function getClientI18nDesc(clientName, fallbackDesc) {
    const locale = getCurrentLocale();
    const clients = window.i18nLocales?.user?.dashboard?.[locale]?.platform_hub?.clients;
    
    if (clients && clients[clientName]) {
        return clients[clientName];
    }
    
    return fallbackDesc || clientName;
}
