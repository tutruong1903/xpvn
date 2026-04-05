/**
 * UI Element Helpers
 * Helper functions for creating DOM elements
 */

function safeInit(fn, name) {
    try {
        fn();
    } catch (error) {
        console.error(`${name} 初始化失败:`, error);
    }
}

function createElement(tag, className, content) {
    const element = document.createElement(tag);
    if (className) element.className = className;
    if (content) element.textContent = content;
    return element;
}

function createIcon(iconClass) {
    return createElement('i', 'ti ' + iconClass);
}

function createButton(type, options = {}) {
    const { client, url, isMobile, isRecommended } = options;
    const btnConfig = CONFIG.BUTTONS[type];
    
    let config = { ...btnConfig };
    if (type === 'download' && client?.isAppStore) {
        config = CONFIG.BUTTONS.downloadAppStore;
    } else if (type === 'import' && isRecommended) {
        config = CONFIG.BUTTONS.importRecommended;
    }
    
    const btn = createElement(type === 'copy' ? 'button' : 'a', 'btn ' + config.class);
    
    if (type === 'copy') {
        btn.setAttribute('data-clipboard-text', url);
    } else {
        btn.href = url;
        if (type === 'download' && client?.isAppStore) {
            btn.target = '_blank';
        }
    }
    
    btn.appendChild(createIcon(config.icon));
    const btnText = typeof config.text === 'function' ? config.text() : config.text;
    btn.appendChild(document.createTextNode(' ' + btnText));
    
    return btn;
}

function createResponsiveButtonGroups(client, urls, isRecommended = false) {
    const { downloadUrl, subUrl, importUrl } = urls;
    const buttons = [];
    
    const buttonConfigs = [
        { type: 'download', url: downloadUrl, needsClient: true },
        { type: 'copy', url: subUrl },
        { type: 'import', url: importUrl }
    ];
    
    const variants = [
        { 
            isMobile: true, 
            classes: isRecommended ? 
                `${CONFIG.CLASSES.BTN_GROUP_MOBILE} ${CONFIG.CLASSES.MOBILE_ONLY}` :
                `${CONFIG.CLASSES.BTN_GROUP_MOBILE} ${CONFIG.CLASSES.MOBILE_SM}`
        },
        { 
            isMobile: false, 
            classes: isRecommended ?
                `${CONFIG.CLASSES.BTN_GROUP_DESKTOP.replace('btn-group-sm', '')} ${CONFIG.CLASSES.DESKTOP_ONLY}` :
                `${CONFIG.CLASSES.BTN_GROUP_DESKTOP} ${CONFIG.CLASSES.DESKTOP_SM}`
        }
    ];
    
    variants.forEach(variant => {
        const group = createElement('div', variant.classes);
        
        buttonConfigs.forEach(btnConfig => {
            const options = {
                client: btnConfig.needsClient ? client : null,
                url: btnConfig.url,
                isMobile: variant.isMobile,
                isRecommended
            };
            group.appendChild(createButton(btnConfig.type, options));
        });
        
        buttons.push(group);
    });
    
    return buttons;
}

function createClientCardContent(client) {
    const content = createElement('div');
    const title = createElement('h4', 'mb-1', client.name);
    const desc = createElement('p', 'text-secondary mb-0', client.description);
    content.appendChild(title);
    content.appendChild(desc);
    return content;
}
