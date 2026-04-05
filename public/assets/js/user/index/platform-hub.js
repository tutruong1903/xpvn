/**
 * Platform Hub
 * Manages platform-specific client display and filtering
 */

function renderPlatformCard(client, platform) {
    const icon = window.platformIcons[platform] || 'ti-device-desktop';
    const subUrl = `${window.APP_CONFIG.universalSubUrl}?clash=1&client=${encodeURIComponent(client.name)}`;
    
    // Get i18n description for client
    const clientDesc = getClientI18nDesc(client.name, client.description || 'Client');
    
    return `
        <div class="platform-hub-item">
            <div class="d-flex align-items-center justify-content-between p-3" 
                 style="background: rgba(255, 255, 255, 0.7); border-radius: var(--lg-radius-md); cursor: pointer; transition: all 0.3s;"
                 onmouseover="this.style.background='rgba(113, 42, 226, 0.08)'; this.style.transform='translateX(4px)';"
                 onmouseout="this.style.background='rgba(255, 255, 255, 0.7)'; this.style.transform='translateX(0)';">
                <div class="d-flex align-items-center gap-3 flex-grow-1">
                    <div class="platform-card__icon" style="background: rgba(113, 42, 226, 0.1); width: 48px; height: 48px; min-width: 48px;">
                        <i class="ti ${icon} text-primary" style="font-size: 1.5rem;"></i>
                    </div>
                    <div class="flex-grow-1">
                        <h5 class="mb-0" style="font-size: 1rem; font-weight: 600;">${client.name}</h5>
                        <small class="text-muted">${platform} / ${clientDesc}</small>
                    </div>
                </div>
                <div class="d-flex align-items-center gap-2">
                    ${client.downloadUrl ? `
                        <button class="btn btn-sm btn-primary" onclick="window.open('${client.downloadUrl}', '_blank')">
                            <i class="ti ti-download"></i>
                        </button>
                    ` : ''}
                    <button class="btn btn-sm btn-outline-secondary copy" data-clipboard-text="${subUrl}">
                        <i class="ti ti-copy"></i>
                    </button>
                    <i class="ti ti-chevron-right text-muted" style="font-size: 1.25rem;"></i>
                </div>
            </div>
        </div>
    `;
}

function filterPlatformHubClients(selectedOS) {
    const container = document.getElementById('platform-hub-cards');
    if (!container) return;
    
    container.innerHTML = '';
    
    if (selectedOS === 'all') {
        // Show all platforms
        Object.keys(window.clientRecommendations).forEach(platform => {
            const clients = window.clientRecommendations[platform];
            clients.forEach(client => {
                container.insertAdjacentHTML('beforeend', renderPlatformCard(client, platform));
            });
        });
    } else {
        // Show only selected platform
        const clients = window.clientRecommendations[selectedOS] || [];
        if (clients.length === 0) {
            container.innerHTML = `
                <div class="text-center text-muted py-4">
                    <i class="ti ti-device-off" style="font-size: 2rem;"></i>
                    <p class="mb-0 mt-2">${getI18n('platform_hub.no_clients', '暂无该平台的客户端推荐')}</p>
                </div>
            `;
        } else {
            clients.forEach(client => {
                container.insertAdjacentHTML('beforeend', renderPlatformCard(client, selectedOS));
            });
        }
    }
    
    // Re-init clipboard for new buttons
    if (typeof ClipboardJS !== 'undefined') {
        new ClipboardJS('.copy');
    }
}

function initPlatformHub() {
    const selector = document.getElementById('platform-hub-selector');
    if (!selector) return;
    
    // Detect OS and set as default
    const detectedOS = detectOS();
    if (window.clientRecommendations[detectedOS]) {
        selector.value = detectedOS;
    } else {
        selector.value = 'all';
    }
    
    // Initial render
    filterPlatformHubClients(selector.value);
    
    // Handle dropdown change
    selector.addEventListener('change', function() {
        filterPlatformHubClients(this.value);
    });
    
    // Store reference for re-rendering
    window.refreshPlatformHub = function() {
        const currentOS = selector.value;
        filterPlatformHubClients(currentOS);
    };
}
