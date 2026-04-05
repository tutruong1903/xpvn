/**
 * Clipboard Initialization (Index Page)
 * Initializes ClipboardJS for index page with success/error feedback
 */

function initClipboard() {
    if (typeof ClipboardJS === 'undefined') {
        console.warn('ClipboardJS not loaded');
        return;
    }
    
    const clipboard = new ClipboardJS('.copy');
    
    clipboard.on('success', function(e) {
        e.clearSelection();
        const originalText = e.trigger.innerHTML;
        const checkIcon = createIcon('ti-check');
        e.trigger.innerHTML = '';
        e.trigger.appendChild(checkIcon);
        e.trigger.appendChild(document.createTextNode(' ' + getI18n('buttons.copy_success', '已复制')));
        setTimeout(function() {
            e.trigger.innerHTML = originalText;
        }, CONFIG.FEEDBACK_TIMEOUT);
    });
    
    clipboard.on('error', function(e) {
        console.error(getI18n('buttons.copy_error', 'Copy failed') + ':', e.action);
        alert(getI18n('buttons.copy_error', '复制失败，请手动选择并复制'));
    });
}
