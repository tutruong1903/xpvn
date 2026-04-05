/**
 * Translation Application
 * Applies i18n translations to dashboard and sidebar elements
 */

// Apply i18n translations to all data-i18n-user-dashboard elements
function applyDashboardTranslations() {
    const locale = getCurrentLocale();
    const translations = window.i18nLocales?.user?.dashboard?.[locale];
    
    if (!translations) return;
    
    // Find all elements with data-i18n-user-dashboard attribute
    document.querySelectorAll('[data-i18n-user-dashboard]').forEach(element => {
        const key = element.getAttribute('data-i18n-user-dashboard');
        if (!key) return;
        
        const keys = key.split('.');
        let value = translations;
        
        for (const k of keys) {
            if (!value) break;
            value = value[k];
        }
        
        if (value && typeof value === 'string') {
            element.textContent = value;
        }
    });
}

// Apply i18n translations to all data-i18n-user-sidebar elements
function applySidebarTranslations() {
    const locale = getCurrentLocale();
    const translations = window.i18nLocales?.user?.sidebar?.[locale];
    
    if (!translations) return;
    
    // Find all elements with data-i18n-user-sidebar attribute
    document.querySelectorAll('[data-i18n-user-sidebar]').forEach(element => {
        const key = element.getAttribute('data-i18n-user-sidebar');
        if (!key) return;
        
        const value = translations[key];
        
        if (value && typeof value === 'string') {
            element.textContent = value;
        }
    });
}
