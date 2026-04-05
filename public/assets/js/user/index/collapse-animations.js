/**
 * Collapse Animations
 * Adds smooth animations when collapsing/expanding sections
 */

function initCollapseAnimations() {
    const allPlatforms = document.getElementById('all-platforms');
    const recommendedSection = document.querySelector('.recommended-section');
    
    if (!allPlatforms || !recommendedSection) return;
    
    recommendedSection.classList.add('collapsible-section');
    
    allPlatforms.addEventListener('show.bs.collapse', function (e) {
        if (e.target !== allPlatforms) return;
        recommendedSection.classList.add('collapsing');
    });
    
    allPlatforms.addEventListener('hide.bs.collapse', function (e) {
        if (e.target !== allPlatforms) return;
        recommendedSection.classList.remove('collapsing');
        setTimeout(function() {
            recommendedSection.classList.add('expanded');
        }, CONFIG.ANIMATION_DURATION);
    });
}
