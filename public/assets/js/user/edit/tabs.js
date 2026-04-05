/**
 * Edit Page — Tab Button Active State
 * Keeps .ev-tab-btn.active in sync after Bootstrap switches tabs.
 */
document.querySelectorAll('.ev-tab-btn').forEach(function (btn) {
    btn.addEventListener('shown.bs.tab', function () {
        document.querySelectorAll('.ev-tab-btn').forEach(function (b) {
            b.classList.remove('active');
            b.setAttribute('aria-selected', 'false');
        });
        btn.classList.add('active');
        btn.setAttribute('aria-selected', 'true');
    });
});
