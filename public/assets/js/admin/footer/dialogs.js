/**
 * Admin Dialog Initialization (Success/Fail/Notice Modals)
 * Initializes Bootstrap modals for admin panel messages
 */
window.addEventListener('load', function() {
    if (typeof tabler !== 'undefined' && tabler.bootstrap) {
        window.successDialog = new tabler.bootstrap.Modal(document.getElementById('success-dialog'));
        window.failDialog = new tabler.bootstrap.Modal(document.getElementById('fail-dialog'));
        
        var noticeDialogEl = document.getElementById('notice-dialog');
        if (noticeDialogEl) {
            window.noticeDialog = new tabler.bootstrap.Modal(noticeDialogEl);
        }
    }
});
