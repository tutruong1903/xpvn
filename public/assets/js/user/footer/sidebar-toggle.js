/**
 * Sidebar Toggle (Collapse/Expand + Mobile)
 * Handles sidebar collapse state, mobile toggle, and tooltip updates
 */
(function () {
    var sidebar = document.getElementById('sidebar');
    var overlay = document.getElementById('sidebar-overlay');
    var toggleBtn = document.getElementById('sidebar-toggle');
    var isMobile = window.innerWidth < 992;
    var collapsed = localStorage.getItem('sidebar_collapsed') === '1';

    function applySidebarState() {
        if (!isMobile && collapsed) {
            document.body.classList.add('sidebar-collapsed');
        } else {
            document.body.classList.remove('sidebar-collapsed');
        }
        if (typeof window.updateCollapsedSidebarTooltips === 'function') {
            window.updateCollapsedSidebarTooltips();
        }
    }
    applySidebarState();

    window.addEventListener('resize', function () {
        isMobile = window.innerWidth < 992;
        applySidebarState();
    });

    if (toggleBtn) {
        toggleBtn.addEventListener('click', function () {
            if (isMobile) {
                document.body.classList.toggle('sidebar-mobile-open');
            } else {
                collapsed = !collapsed;
                localStorage.setItem('sidebar_collapsed', collapsed ? '1' : '0');
                applySidebarState();
            }
        });
    }
    if (overlay) {
        overlay.addEventListener('click', function () {
            document.body.classList.remove('sidebar-mobile-open');
        });
    }
})();

/**
 * Update collapsed sidebar tooltips
 */
window.updateCollapsedSidebarTooltips = function () {
    var collapsed = document.body.classList.contains('sidebar-collapsed');
    document.querySelectorAll('#sidebar .nav-link[data-path]').forEach(function (link) {
        var titleEl = link.querySelector('.nav-link-title');
        link.title = collapsed && titleEl ? titleEl.textContent.replace(/\s+/g, ' ').trim() : '';
    });
};

if (typeof window.updateCollapsedSidebarTooltips === 'function') {
    window.updateCollapsedSidebarTooltips();
}
