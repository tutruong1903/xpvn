/**
 * Admin Header Scroll Shadow Effect
 * Adds shadow to admin header when scrolling down the page
 */
(function() {
    var header = document.querySelector('.user-header, .header-luminous');
    if (!header) return;
    
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 10) {
            header.classList.add('header-luminous--scrolled', 'scrolled');
        } else {
            header.classList.remove('header-luminous--scrolled', 'scrolled');
        }
    });
})();
