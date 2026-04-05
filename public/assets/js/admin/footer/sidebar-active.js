/**
 * Active Admin Sidebar Item Highlight
 * Highlights the current page in the admin sidebar navigation
 */
(function () {
    var path = window.location.pathname.replace(/\/$/, '') || '/admin';
    var links = document.querySelectorAll('#sidebar .nav-link[data-path], #sidebar .sidebar-nav-link[data-path]');
    var bestMatch = null;
    var bestLen = 0;
    links.forEach(function (link) {
        var linkPath = link.getAttribute('data-path');
        if (path === linkPath || (path.indexOf(linkPath) === 0 && linkPath.length > bestLen)) {
            bestMatch = link;
            bestLen = linkPath.length;
        }
    });
    if (bestMatch) {
        bestMatch.classList.add('active');
    }
})();
