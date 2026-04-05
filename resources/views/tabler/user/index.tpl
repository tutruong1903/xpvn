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
                                    <div class="traffic-stat-box__label" data-i18n-user-dashboard="traffic_monitor.label_download">DOWNLOAD</div>
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
                                    <div class="traffic-stat-box__label" data-i18n-user-dashboard="traffic_monitor.upload">UPLOAD</div>
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
    // Set traffic data for chart
    window.trafficLogData = {$traffic_logs};
</script>
<script src="/assets/js/user/index/traffic-chart.js{asset_ver path="/assets/js/user/index/traffic-chart.js"}"></script>
{/if}

<!-- Index Page Scripts -->
<script>
// Populate global configuration from template
window.APP_CONFIG = {
    enableR2Download: {if $config['enable_r2_client_download']}true{else}false{/if},
    universalSubUrl: "{$UniversalSub}",
    appName: "{$config['appName']}",
    enableSsSub: {if $public_setting['enable_ss_sub']}true{else}false{/if},
    enableV2Sub: {if $public_setting['enable_v2_sub']}true{else}false{/if},
    enableTrojanSub: {if $public_setting['enable_trojan_sub']}true{else}false{/if}
};

window.platformIcons = {$platformIcons};
window.clientRecommendations = {$clientData};
</script>

<!-- Load all index page modules -->
<script src="/assets/js/user/index/config.js{asset_ver path="/assets/js/user/index/config.js"}"></script>
<script src="/assets/js/user/index/i18n-helper.js{asset_ver path="/assets/js/user/index/i18n-helper.js"}"></script>
<script src="/assets/js/user/index/os-detector.js{asset_ver path="/assets/js/user/index/os-detector.js"}"></script>
<script src="/assets/js/user/index/ui-constants.js{asset_ver path="/assets/js/user/index/ui-constants.js"}"></script>
<script src="/assets/js/user/index/ui-elements.js{asset_ver path="/assets/js/user/index/ui-elements.js"}"></script>
<script src="/assets/js/user/index/client-generator.js{asset_ver path="/assets/js/user/index/client-generator.js"}"></script>
<script src="/assets/js/user/index/client-selector.js{asset_ver path="/assets/js/user/index/client-selector.js"}"></script>
<script src="/assets/js/user/index/clipboard-init.js{asset_ver path="/assets/js/user/index/clipboard-init.js"}"></script>
<script src="/assets/js/user/index/collapse-animations.js{asset_ver path="/assets/js/user/index/collapse-animations.js"}"></script>
<script src="/assets/js/user/index/platform-hub.js{asset_ver path="/assets/js/user/index/platform-hub.js"}"></script>
<script src="/assets/js/user/index/translations.js{asset_ver path="/assets/js/user/index/translations.js"}"></script>
<script src="/assets/js/user/index/init.js{asset_ver path="/assets/js/user/index/init.js"}"></script>



{include file='user/footer.tpl'}
