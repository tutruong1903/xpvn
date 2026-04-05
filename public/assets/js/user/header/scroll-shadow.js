/**
 * Header Scroll Shadow Effect
 * Adds shadow to header when scrolling down the page
 */
(function() {
    var header = document.getElementById('luminous-header');
    if (!header) return;
    
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 10) {
            header.classList.add('header-luminous--scrolled');
        } else {
            header.classList.remove('header-luminous--scrolled');
        }
    });
})();
