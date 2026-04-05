{include file='user/header.tpl'}

<style>
/* Additional styles for merged components */
.client-item {
    transition: all 0.3s;
}

.client-item:hover {
    transform: translateX(5px);
}

@media (max-width: 576px) {
    .client-item:hover {
        transform: none;
    }
}

.recommended-section {
    background: rgba(113, 42, 226, 0.08);
    border: 1px solid rgba(113, 42, 226, 0.15);
    border-radius: var(--lg-radius-lg);
}

.spoiler {
    filter: blur(5px);
    transition: filter 0.3s;
}

.spoiler:hover {
    filter: none;
}

.collapsible-section {
    transition: all 0.35s ease;
    overflow: hidden;
}

.collapsible-section.collapsing {
    opacity: 0.3;
    transform: scale(0.98);
}

.collapsible-section.expanded {
    opacity: 1;
    transform: scale(1);
}
</style>

<!-- Dashboard Content -->
<div class="page-body" style="padding: 2rem;">
    <div class="container-xl" style="max-width: 1400px;">
        
        <!-- Info Cards Row -->
        <div class="row g-3 mb-4">
            {foreach $info_cards as $card}
            <div class="col-sm-6 col-lg-3">
                <div class="traffic-card" style="padding: 1.25rem;">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="flex-grow-1">
                            <div class="traffic-stat__label mb-2">{$card.title}</div>
                            <div class="traffic-stat__value" style="font-size: 1.5rem;">{$card.value}</div>
                        </div>
                        <div class="platform-card__icon" style="background: linear-gradient(135deg, #712ae2 0%, #8a4cfc 100%);">
                            <i class="ti {$card.icon} text-white"></i>
                        </div>
                    </div>
                    {if isset($card.action_url)}
                    <div class="mt-3">
                        <a href="{$card.action_url}" class="btn-luminous-primary w-100" style="padding: 0.5rem;">
                            <i class="ti ti-plus"></i> 购买
                        </a>
                    </div>
                    {/if}
                </div>
            </div>
            {/foreach}
        </div>
        
        <!-- Connection Status Hero -->
        <div class="connection-hero mb-4">
            <div class="row align-items-center">
                <div class="col-md-6 col-12 mb-4 mb-md-0">
                    <!-- Connection Badge -->
                    <div class="connection-badge connection-badge--connected mb-3">
                        <span class="connection-badge__pulse"></span>
                        <span data-i18n-user-dashboard="connection.badge_connected">已连接</span>
                    </div>
                    
                    <!-- Server Name -->
                    <h2 class="connection-hero__title">Your VPN Connection</h2>
                    
                    <!-- Description -->
                    <p class="connection-hero__description" data-i18n-user-dashboard="connection.description_protected">
                        您的数字路径目前已被照亮和保护。通过我们的高级网关享受企业级加密的高速浏览。
                    </p>
                    
                    <!-- Subscription Link Section -->
                    <div class="mt-4 p-3" style="background: rgba(255, 255, 255, 0.5); border-radius: var(--lg-radius-md);">
                        <h4 style="font-size: 0.95rem; font-weight: 700; margin-bottom: 0.75rem;">
                            <i class="ti ti-link"></i> <span data-i18n-user-dashboard="connection.subscription_title">您的专属订阅地址</span>
                        </h4>
                        <div class="input-group">
                            <input type="text" class="form-control" value="{$UniversalSub}" readonly id="universal-sub-link" style="border-radius: var(--lg-radius-sm) 0 0 var(--lg-radius-sm);">
                            <button class="btn-luminous-primary copy" data-clipboard-text="{$UniversalSub}" style="border-radius: 0 var(--lg-radius-sm) var(--lg-radius-sm) 0;">
                                <i class="ti ti-copy"></i> <span data-i18n-user-dashboard="connection.btn_copy">复制</span>
                            </button>
                        </div>
                        <p class="text-muted mb-0 mt-2" style="font-size: 0.8rem;">
                            <small data-i18n-user-dashboard="connection.subscription_note">此订阅地址适用于所有客户端，请妥善保管</small>
                        </p>
                    </div>
                </div>
                
                <div class="col-md-6 col-12 d-flex justify-content-center">
                    <!-- Speed Ring -->
                    <div class="speed-ring">
                        <svg viewBox="0 0 260 260">
                            <circle class="speed-ring__bg" cx="130" cy="130" r="110"></circle>
                            <circle class="speed-ring__progress" cx="130" cy="130" r="110" 
                                    stroke-dasharray="691" stroke-dashoffset="200"></circle>
                        </svg>
                        <div class="speed-ring__value">
                            <div class="speed-ring__number">--</div>
                            <div class="speed-ring__label">Mbps</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Bento Grid -->
        <div class="row g-4 mt-2">
            <!-- Left Column: Client Recommendations + Traffic -->
            <div class="col-lg-7 col-12">
                <!-- Real-time Traffic Card -->
                <div class="traffic-card mb-4">
                    <!-- Header with Legend -->
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h3 class="traffic-card__title mb-0" data-i18n-user-dashboard="traffic_monitor.title">Real-time Traffic</h3>
                        <div class="d-flex gap-3">
                            <div class="d-flex align-items-center gap-2">
                                <span class="legend-dot" style="background: #0051d5;"></span>
                                <span style="font-size: 0.875rem;" data-i18n-user-dashboard="traffic_monitor.download">Download</span>
                            </div>
                            <div class="d-flex align-items-center gap-2">
                                <span class="legend-dot" style="background: #712ae2;"></span>
                                <span style="font-size: 0.875rem;" data-i18n-user-dashboard="traffic_monitor.upload">Upload</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Bar Chart -->
                    <div class="realtime-traffic-chart mb-4">
                        <div class="traffic-bars">
                            {* Generate 8 sample bars with random heights *}
                            <div class="traffic-bar-group">
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--download" style="height: 55%;"></div>
                                </div>
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--upload" style="height: 40%;"></div>
                                </div>
                            </div>
                            <div class="traffic-bar-group">
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--download" style="height: 65%;"></div>
                                </div>
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--upload" style="height: 30%;"></div>
                                </div>
                            </div>
                            <div class="traffic-bar-group">
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--download" style="height: 45%;"></div>
                                </div>
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--upload" style="height: 20%;"></div>
                                </div>
                            </div>
                            <div class="traffic-bar-group">
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--download" style="height: 80%;"></div>
                                </div>
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--upload" style="height: 50%;"></div>
                                </div>
                            </div>
                            <div class="traffic-bar-group">
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--download" style="height: 70%;"></div>
                                </div>
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--upload" style="height: 45%;"></div>
                                </div>
                            </div>
                            <div class="traffic-bar-group">
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--download" style="height: 90%;"></div>
                                </div>
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--upload" style="height: 55%;"></div>
                                </div>
                            </div>
                            <div class="traffic-bar-group">
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--download" style="height: 75%;"></div>
                                </div>
                                <div class="traffic-bar-stack">
                                    <div class="traffic-bar traffic-bar--upload" style="height: 60%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Traffic Stats -->
                    <div class="row g-3">
                        <div class="col-6">
                            <div class="traffic-stat-box traffic-stat-box--download">
                                <div class="traffic-stat-box__icon">
                                    <i class="ti ti-arrow-down"></i>
                                </div>
                                <div class="traffic-stat-box__content">
                                    <div class="traffic-stat-box__label">DOWNLOAD</div>
                                    <div class="traffic-stat-box__value">{$user->LastusedTraffic()}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="traffic-stat-box traffic-stat-box--upload">
                                <div class="traffic-stat-box__icon">
                                    <i class="ti ti-arrow-up"></i>
                                </div>
                                <div class="traffic-stat-box__content">
                                    <div class="traffic-stat-box__label">UPLOAD</div>
                                    <div class="traffic-stat-box__value">{$user->TodayusedTraffic()}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Account Info -->
                    <p class="mt-3 mb-0 text-center">
                        {if $user->class === 0}
                        <span data-i18n-user-dashboard="account.go_to_shop">前往</span> <a href="/user/product" class="text-primary fw-bold" data-i18n-user-dashboard="account.shop">商店</a> <span data-i18n-user-dashboard="account.buy_package">购买套餐</span> · <span data-i18n-user-dashboard="account.remaining_traffic">剩余流量</span> <strong>{$user->unusedTraffic()}</strong>
                        {else}
                        <span data-i18n-user-dashboard="account.level_account">LV.</span> {$user->class} 账户 · {$class_expire_days} <span data-i18n-user-dashboard="account.expire_in_days">天后到期</span> · <span data-i18n-user-dashboard="account.remaining_traffic">剩余流量</span> <strong>{$user->unusedTraffic()}</strong>
                        {/if}
                    </p>
                </div>

                   <div class="traffic-card">
                    <div class="d-flex align-items-center mb-3">
                        <div class="platform-card__icon me-3" style="background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);">
                            <i class="ti ti-bell-ringing text-white"></i>
                        </div>
                        <div>
                            <h3 class="traffic-card__title mb-0" data-i18n-user-dashboard="announcement.title">置顶公告</h3>
                            {if $ann !== null}
                            <small class="text-muted">{$ann->date}</small>
                            {/if}
                        </div>
                    </div>
                    <p class="text-secondary mb-0">
                        {if $ann !== null}
                        {$ann->content}
                        {else}
                        <span data-i18n-user-dashboard="announcement.no_announcement">暂无公告</span>
                        {/if}
                    </p>
                </div>
                
                <!-- Traffic Log Chart -->
                {if $public_setting['traffic_log']}
                <div class="traffic-card">
                    <h3 class="traffic-card__title mb-3" data-i18n-user-dashboard="traffic_log.title">每小时用量</h3>
                    <div style="height: 250px;">
                        <div id="traffic-log" style="height: 100%;"></div>
                    </div>
                </div>
                {/if}
            </div>
            
            <!-- Right Column: Checkin + Announcement -->
            <div class="col-lg-5 col-12">
                {if $public_setting['enable_checkin']}
                <!-- Daily Checkin -->
                <div class="traffic-card mb-4">
                    <div class="d-flex align-items-center mb-3">
                        <div class="platform-card__icon me-3" style="background: linear-gradient(135deg, #10b981 0%, #059669 100%);">
                            <i class="ti ti-check text-white"></i>
                        </div>
                        <h3 class="traffic-card__title mb-0" data-i18n-user-dashboard="checkin.title">每日签到</h3>
                    </div>
                    <p class="mb-2">
                        <span data-i18n-user-dashboard="checkin.can_get">签到可领取</span>
                        {if $public_setting['checkin_min'] !== $public_setting['checkin_max']}
                        <code>{$public_setting['checkin_min']} MB</code>
                        <span data-i18n-user-dashboard="checkin.to">至</span>
                        <code>{$public_setting['checkin_max']} MB</code>
                        <span data-i18n-user-dashboard="checkin.range_traffic">范围内的流量</span>
                        {else}
                        <code>{$public_setting['checkin_min']} MB</code>
                        {/if}
                    </p>
                    <p class="mb-3">
                        <span data-i18n-user-dashboard="checkin.last_checkin">上次签到时间：</span><code id="last-checkin-time">{$user->lastCheckInTime()}</code>
                    </p>
                    <div class="d-flex">
                        {if !$user->isAbleToCheckin()}
                        <button id="check-in" class="btn-luminous-primary w-100" disabled><span data-i18n-user-dashboard="checkin.btn_checked">已签到</span></button>
                        {else}
                        {if $public_setting['enable_checkin_captcha']}
                        {include file='captcha/div.tpl'}
                        {/if}
                        <button id="check-in" class="btn-luminous-primary w-100"
                            hx-post="/user/checkin" hx-swap="none" hx-vals='js:{
                            {if $public_setting['enable_checkin_captcha']}
                            {include file='captcha/ajax.tpl'}
                            {/if}
                            }'>
                            <span data-i18n-user-dashboard="checkin.btn_checkin">签到</span>
                        </button>
                        {/if}
                    </div>
                </div>
                {/if}
                
                <!-- Platform Hub -->
                <div class="traffic-card mb-4">
                    <h3 class="traffic-card__title mb-3" data-i18n-user-dashboard="platform_hub.title">Platform Hub</h3>
                    
                    <!-- OS Selector Dropdown -->
                    <div class="mb-3">
                        <select class="form-select" id="platform-hub-selector" style="border-radius: var(--lg-radius-sm); border: 1px solid rgba(113, 42, 226, 0.2); padding: 0.625rem 1rem;">
                            <option value="Windows">Windows</option>
                            <option value="macOS">macOS</option>
                            <option value="Linux">Linux</option>
                            <option value="iOS">iOS</option>
                            <option value="Android">Android</option>
                        </select>
                    </div>
                    
                    <!-- Platform Cards Container -->
                    <div id="platform-hub-cards" class="d-flex flex-column gap-2">
                        <!-- Cards will be injected here by JavaScript -->
                    </div>
                </div>
                
                <!-- Announcement -->
             
            </div>
        </div>
        
    </div>
</div>

{if $public_setting['enable_checkin_captcha'] && $user->isAbleToCheckin()}
    {include file='captcha/js.tpl'}
{/if}

{if $public_setting['traffic_log']}
<script src="//{$config['jsdelivr_url']}/npm/@tabler/core@latest/dist/libs/apexcharts/dist/apexcharts.min.js"></script>
<script>
    function getTrafficChartConfig(trafficData) {
        return {
            chart: {
                type: "line",
                fontFamily: "Inter, sans-serif",
                height: '100%',
                parentHeightOffset: 0,
                toolbar: { show: false },
                animations: { enabled: true }
            },
            stroke: { curve: "smooth", width: 3 },
            fill: { opacity: 1 },
            series: [{ name: "使用流量（MB）", data: trafficData }],
            tooltip: { theme: "light" },
            grid: {
                padding: { top: 0, right: 0, left: 0, bottom: 0 },
                strokeDashArray: 4
            },
            xaxis: {
                title: { text: "小时" },
                labels: { padding: 0 },
                tooltip: { enabled: false },
                axisBorder: { show: false },
                categories: ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
            },
            yaxis: {
                title: { text: "使用流量（MB）", rotate: -90 },
                labels: { padding: 14 }
            },
            colors: ["#0051d5"],
            legend: { show: false }
        };
    }
    
    function initTrafficChart() {
        const chartElement = document.getElementById('traffic-log');
        if (!chartElement || !window.ApexCharts) return;
        
        try {
            const chart = new ApexCharts(chartElement, getTrafficChartConfig({$traffic_logs}));
            chart.render();
        } catch (error) {
            console.error('流量图表初始化失败:', error);
        }
    }
    
    document.addEventListener("DOMContentLoaded", function () {
        initTrafficChart();
    });
</script>
{/if}

<script>
window.APP_CONFIG = {
    enableR2Download: {if $config['enable_r2_client_download']}true{else}false{/if},
    universalSubUrl: "{$UniversalSub}",
    appName: "{$config['appName']}",
    enableSsSub: {if $public_setting['enable_ss_sub']}true{else}false{/if},
    enableV2Sub: {if $public_setting['enable_v2_sub']}true{else}false{/if},
    enableTrojanSub: {if $public_setting['enable_trojan_sub']}true{else}false{/if}
};

const platformIcons = {$platformIcons};
const clientRecommendations = {$clientData};

{literal}
// Get current locale using sspanelI18n
function getCurrentLocale() {
    if (window.sspanelI18n && typeof window.sspanelI18n.getLocale === 'function') {
        return window.sspanelI18n.getLocale();
    }
    // Fallback
    return localStorage.getItem('sspanel_locale') || 'en_US';
}

// Get i18n text by key
function getI18n(key, fallback = '') {
    const locale = getCurrentLocale();
    const keys = key.split('.');
    let value = window.i18nLocales?.user?.dashboard?.[locale];
    
    for (const k of keys) {
        if (!value) break;
        value = value[k];
    }
    
    return value || fallback;
}

// Get i18n client description
function getClientI18nDesc(clientName, fallbackDesc) {
    const locale = getCurrentLocale();
    const clients = window.i18nLocales?.user?.dashboard?.[locale]?.platform_hub?.clients;
    
    if (clients && clients[clientName]) {
        return clients[clientName];
    }
    
    return fallbackDesc || clientName;
}

function detectOS() {
    const userAgent = navigator.userAgent;
    if (userAgent.indexOf("Win") !== -1) return "Windows";
    if (userAgent.indexOf("Mac") !== -1) return "macOS";
    if (userAgent.indexOf("Android") !== -1) return "Android";
    if (userAgent.match(/iPhone|iPad|iPod/i)) return "iOS";
    if (userAgent.indexOf("Linux") !== -1) return "Linux";
    return "Windows";
}

const CONFIG = {
    ANIMATION_DURATION: 350,
    FEEDBACK_TIMEOUT: 2000,
    CLASSES: {
        BTN_GROUP_MOBILE: 'btn-group-vertical',
        BTN_GROUP_DESKTOP: 'btn-group btn-group-sm', 
        MOBILE_ONLY: 'd-md-none w-100',
        DESKTOP_ONLY: 'd-none d-md-flex',
        MOBILE_SM: 'd-sm-none w-100',
        DESKTOP_SM: 'd-none d-sm-flex'
    },
    BUTTONS: {
        download: { icon: 'ti-download', text: () => getI18n('buttons.download', '下载'), class: 'btn-primary' },
        downloadAppStore: { icon: 'ti-brand-appstore', text: 'App Store', class: 'btn-primary' },
        copy: { icon: 'ti-copy', text: () => getI18n('buttons.copy_subscription', '复制订阅'), class: 'btn-info copy' },
        import: { icon: 'ti-link', text: () => getI18n('buttons.import', '一键导入'), class: 'btn-success' },
        importRecommended: { icon: 'ti-rocket', text: () => getI18n('buttons.import', '一键导入'), class: 'btn-success' }
    }
};

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

function initClientSelector() {
    const os = detectOS();
    const osElement = document.getElementById('detected-os');
    if (osElement) osElement.textContent = os;
    
    const recommendations = clientRecommendations[os] || clientRecommendations["Windows"];
    const recommendedContainer = document.getElementById('recommended-clients');
    
    if (recommendedContainer) {
        recommendations.forEach(function(client) {
            recommendedContainer.insertAdjacentHTML('beforeend', generateClientHtml(client, true));
        });
    }
    
    const accordionContainer = document.getElementById('platform-accordion');
    
    if (accordionContainer) {
        Object.keys(clientRecommendations).forEach(function(platform) {
            const clients = clientRecommendations[platform];
            const platformId = 'platform-' + platform.toLowerCase();
            const icon = platformIcons[platform] || 'ti-device-desktop';
            
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

function initClipboard() {
    if (typeof ClipboardJS === 'undefined') {
        console.warn('ClipboardJS not loaded');
        return;
    }
    
    const clipboard = new ClipboardJS('.copy');
    
    clipboard.on('success', function(e) {
        e.clearSelection();
        const originalText = e.trigger.innerHTML;
        const checkIcon = createIcon('ti-check');
        e.trigger.innerHTML = '';
        e.trigger.appendChild(checkIcon);
        e.trigger.appendChild(document.createTextNode(' ' + getI18n('buttons.copy_success', '已复制')));
        setTimeout(function() {
            e.trigger.innerHTML = originalText;
        }, CONFIG.FEEDBACK_TIMEOUT);
    });
    
    clipboard.on('error', function(e) {
        console.error(getI18n('buttons.copy_error', 'Copy failed') + ':', e.action);
        alert(getI18n('buttons.copy_error', '复制失败，请手动选择并复制'));
    });
}

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

function renderPlatformCard(client, platform) {
    const icon = platformIcons[platform] || 'ti-device-desktop';
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
        Object.keys(clientRecommendations).forEach(platform => {
            const clients = clientRecommendations[platform];
            clients.forEach(client => {
                container.insertAdjacentHTML('beforeend', renderPlatformCard(client, platform));
            });
        });
    } else {
        // Show only selected platform
        const clients = clientRecommendations[selectedOS] || [];
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
    if (clientRecommendations[detectedOS]) {
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

// Apply i18n translations to all data-i18n-user-dashboard elements
function applyDashboardTranslations() {
    const locale = getCurrentLocale();
    const translations = window.i18nLocales?.user?.dashboard?.[locale];
    
    if (!translations) return;
    
    // Find all elements with data-i18n-user-dashboard attribute
    document.querySelectorAll('[data-i18n-user-dashboard]').forEach(element => {
        const key = element.getAttribute('data-i18n-user-dashboard');
        if (!key) return;
        
        const keys = key.split('.');
        let value = translations;
        
        for (const k of keys) {
            if (!value) break;
            value = value[k];
        }
        
        if (value && typeof value === 'string') {
            element.textContent = value;
        }
    });
}

// Apply i18n translations to all data-i18n-user-sidebar elements
function applySidebarTranslations() {
    const locale = getCurrentLocale();
    const translations = window.i18nLocales?.user?.sidebar?.[locale];
    
    if (!translations) return;
    
    // Find all elements with data-i18n-user-sidebar attribute
    document.querySelectorAll('[data-i18n-user-sidebar]').forEach(element => {
        const key = element.getAttribute('data-i18n-user-sidebar');
        if (!key) return;
        
        const value = translations[key];
        
        if (value && typeof value === 'string') {
            element.textContent = value;
        }
    });
}

document.addEventListener('DOMContentLoaded', function() {
    safeInit(applyDashboardTranslations, 'Dashboard i18n');
    safeInit(applySidebarTranslations, 'Sidebar i18n');
    safeInit(initClientSelector, '客户端选择器');
    safeInit(initClipboard, '剪贴板功能');
    safeInit(initCollapseAnimations, '折叠动画');
    safeInit(initPlatformHub, 'Platform Hub');
});
{/literal}
</script>

{include file='user/footer.tpl'}
