/**
 * Dialog Initialization (Success/Fail Modals)
 * Initializes Bootstrap modals for success and failure messages
 */
window.addEventListener('load', function() {
    if (typeof tabler !== 'undefined' && tabler.bootstrap) {
        window.successDialog = new tabler.bootstrap.Modal(document.getElementById('success-dialog'));
        window.failDialog = new tabler.bootstrap.Modal(document.getElementById('fail-dialog'));
    }
});
