/**
 * Main Initialization
 * Initializes all dashboard components when DOM is ready
 */

document.addEventListener('DOMContentLoaded', function() {
    safeInit(applyDashboardTranslations, 'Dashboard i18n');
    safeInit(applySidebarTranslations, 'Sidebar i18n');
    safeInit(initClientSelector, '客户端选择器');
    safeInit(initClipboard, '剪贴板功能');
    safeInit(initCollapseAnimations, '折叠动画');
    safeInit(initPlatformHub, 'Platform Hub');
});
