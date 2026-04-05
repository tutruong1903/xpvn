/**
 * Client Selector
 * Initializes client recommendation system with OS detection and accordion
 */

function initClientSelector() {
    const os = detectOS();
    const osElement = document.getElementById('detected-os');
    if (osElement) osElement.textContent = os;
    
    const recommendations = window.clientRecommendations[os] || window.clientRecommendations["Windows"];
    const recommendedContainer = document.getElementById('recommended-clients');
    
    if (recommendedContainer) {
        recommendations.forEach(function(client) {
            recommendedContainer.insertAdjacentHTML('beforeend', generateClientHtml(client, true));
        });
    }
    
    const accordionContainer = document.getElementById('platform-accordion');
    
    if (accordionContainer) {
        Object.keys(window.clientRecommendations).forEach(function(platform) {
            const clients = window.clientRecommendations[platform];
            const platformId = 'platform-' + platform.toLowerCase();
            const icon = window.platformIcons[platform] || 'ti-device-desktop';
            
            const accordionHtml = `
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" 
                                data-bs-toggle="collapse" data-bs-target="#${platformId}">
                            <i class="ti ${icon} me-2"></i> ${platform}
                        </button>
                    </h2>
                    <div id="${platformId}" class="accordion-collapse collapse" 
                         data-bs-parent="#platform-accordion">
                        <div class="accordion-body">
                            <div class="row g-3">
                                ${clients.map(client => generateClientHtml(client, false)).join('')}
                            </div>
                        </div>
                    </div>
                </div>`;
                
            accordionContainer.insertAdjacentHTML('beforeend', accordionHtml.trim());
        });
    }
}
