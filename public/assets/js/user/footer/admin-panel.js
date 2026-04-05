/**
 * Admin Panel Switch
 * Pill toggle that redirects to /admin when checked
 */
(function () {
    var sw = document.getElementById('admin-panel-switch');
    if (!sw) return;
    sw.addEventListener('change', function () {
        if (this.checked) {
            window.location.href = '/admin';
        }
    });
})();
