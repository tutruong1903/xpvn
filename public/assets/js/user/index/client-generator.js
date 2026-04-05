/**
 * Client HTML Generator
 * Generates HTML for client recommendation cards
 */

function generateClientHtml(client, isRecommended) {
    const config = window.APP_CONFIG;
    
    let downloadUrl = client.downloadUrl;
    if (!client.isAppStore && downloadUrl.includes('/clients/')) {
        downloadUrl = config.enableR2Download ? '/user' + downloadUrl : downloadUrl;
    }
    
    const subUrl = config.universalSubUrl + '/' + client.format;
    const importUrl = client.importUrl;
    
    const container = createElement('div', 'col-12');
    
    if (isRecommended) {
        const card = createElement('div', 'card');
        const cardBody = createElement('div', 'card-body');
        const flexContainer = createElement('div', 'd-flex flex-column flex-md-row align-items-center justify-content-between gap-3');
        
        const contentDiv = createClientCardContent(client);
        
        const buttonsContainer = createElement('div');
        const urls = { downloadUrl, subUrl, importUrl };
        const buttonGroups = createResponsiveButtonGroups(client, urls, true);
        buttonGroups.forEach(group => buttonsContainer.appendChild(group));
        
        flexContainer.appendChild(contentDiv);
        flexContainer.appendChild(buttonsContainer);
        cardBody.appendChild(flexContainer);
        card.appendChild(cardBody);
        container.appendChild(card);
    } else {
        const item = createElement('div', 'client-item d-flex flex-column flex-sm-row align-items-stretch align-items-sm-center justify-content-between p-3 border rounded gap-2');
        
        const contentDiv = createElement('div', 'flex-fill');
        const title = createElement('h5', 'mb-0', client.name);
        const desc = createElement('small', 'text-muted', client.description);
        contentDiv.appendChild(title);
        contentDiv.appendChild(desc);
        
        const urls = { downloadUrl, subUrl, importUrl };
        const buttonGroups = createResponsiveButtonGroups(client, urls, false);
        
        item.appendChild(contentDiv);
        buttonGroups.forEach(group => item.appendChild(group));
        
        container.appendChild(item);
    }
    
    return container.outerHTML;
}
