<!doctype html>
<html lang="zh">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>
    <meta name="format-detection" content="telephone=no"/>
    <title>{$config['appName']}</title>
    
    <!-- Google Fonts - Luminous Guardian Typography -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    
    <!-- Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    
    <!-- CSS files -->
    <link href="//{$config['jsdelivr_url']}/npm/@tabler/core@latest/dist/css/tabler.min.css" rel="stylesheet"/>
    <link href="//{$config['jsdelivr_url']}/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" rel="stylesheet"/>
    <link href="/assets/css/user/sidebar-luminous.css{asset_ver path="/assets/css/user/sidebar-luminous.css"}" rel="stylesheet"/>
    <link href="/assets/css/user/header-luminous.css{asset_ver path="/assets/css/user/header-luminous.css"}" rel="stylesheet"/>
    <link href="/assets/css/locale-switcher.css{asset_ver path="/assets/css/locale-switcher.css"}" rel="stylesheet"/>
    
    <!-- JS files -->
    <script src="//{$config['jsdelivr_url']}/npm/qrcode_js@latest/qrcode.min.js"></script>
    <script src="//{$config['jsdelivr_url']}/npm/clipboard@latest/dist/clipboard.min.js"></script>
    <script src="//{$config['jsdelivr_url']}/npm/jquery/dist/jquery.min.js"></script>
    <script src="//{$config['jsdelivr_url']}/npm/htmx.org@latest/dist/htmx.min.js"></script>

    
    <!-- i18n - Admin component locales -->
    <script>window.siteConfig = { appName: '{$config['appName']}' };</script>
    <script src="/assets/js/locales/admin/sidebar/en_US.js{asset_ver path="/assets/js/locales/admin/sidebar/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/sidebar/vn_VN.js{asset_ver path="/assets/js/locales/admin/sidebar/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/sidebar/zh_CN.js{asset_ver path="/assets/js/locales/admin/sidebar/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/sidebar/zh_TW.js{asset_ver path="/assets/js/locales/admin/sidebar/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/sidebar/ja_JP.js{asset_ver path="/assets/js/locales/admin/sidebar/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/header/en_US.js{asset_ver path="/assets/js/locales/admin/header/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/header/vn_VN.js{asset_ver path="/assets/js/locales/admin/header/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/header/zh_CN.js{asset_ver path="/assets/js/locales/admin/header/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/header/zh_TW.js{asset_ver path="/assets/js/locales/admin/header/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/header/ja_JP.js{asset_ver path="/assets/js/locales/admin/header/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/dialog/en_US.js{asset_ver path="/assets/js/locales/admin/dialog/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/dialog/vn_VN.js{asset_ver path="/assets/js/locales/admin/dialog/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/dialog/zh_CN.js{asset_ver path="/assets/js/locales/admin/dialog/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/dialog/zh_TW.js{asset_ver path="/assets/js/locales/admin/dialog/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/dialog/ja_JP.js{asset_ver path="/assets/js/locales/admin/dialog/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/user/en_US.js{asset_ver path="/assets/js/locales/admin/user/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/user/vn_VN.js{asset_ver path="/assets/js/locales/admin/user/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/user/zh_CN.js{asset_ver path="/assets/js/locales/admin/user/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/user/zh_TW.js{asset_ver path="/assets/js/locales/admin/user/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/user/ja_JP.js{asset_ver path="/assets/js/locales/admin/user/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/node/en_US.js{asset_ver path="/assets/js/locales/admin/node/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/node/vn_VN.js{asset_ver path="/assets/js/locales/admin/node/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/node/zh_CN.js{asset_ver path="/assets/js/locales/admin/node/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/node/zh_TW.js{asset_ver path="/assets/js/locales/admin/node/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/node/ja_JP.js{asset_ver path="/assets/js/locales/admin/node/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/billing/en_US.js{asset_ver path="/assets/js/locales/admin/billing/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/billing/vn_VN.js{asset_ver path="/assets/js/locales/admin/billing/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/billing/zh_CN.js{asset_ver path="/assets/js/locales/admin/billing/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/billing/zh_TW.js{asset_ver path="/assets/js/locales/admin/billing/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/billing/ja_JP.js{asset_ver path="/assets/js/locales/admin/billing/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/email/en_US.js{asset_ver path="/assets/js/locales/admin/email/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/email/vn_VN.js{asset_ver path="/assets/js/locales/admin/email/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/email/zh_CN.js{asset_ver path="/assets/js/locales/admin/email/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/email/zh_TW.js{asset_ver path="/assets/js/locales/admin/email/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/email/ja_JP.js{asset_ver path="/assets/js/locales/admin/email/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/support/en_US.js{asset_ver path="/assets/js/locales/admin/support/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/support/vn_VN.js{asset_ver path="/assets/js/locales/admin/support/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/support/zh_CN.js{asset_ver path="/assets/js/locales/admin/support/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/support/zh_TW.js{asset_ver path="/assets/js/locales/admin/support/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/support/ja_JP.js{asset_ver path="/assets/js/locales/admin/support/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/captcha/en_US.js{asset_ver path="/assets/js/locales/admin/captcha/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/captcha/vn_VN.js{asset_ver path="/assets/js/locales/admin/captcha/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/captcha/zh_CN.js{asset_ver path="/assets/js/locales/admin/captcha/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/captcha/zh_TW.js{asset_ver path="/assets/js/locales/admin/captcha/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/captcha/ja_JP.js{asset_ver path="/assets/js/locales/admin/captcha/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/reg/en_US.js{asset_ver path="/assets/js/locales/admin/reg/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/reg/vn_VN.js{asset_ver path="/assets/js/locales/admin/reg/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/reg/zh_CN.js{asset_ver path="/assets/js/locales/admin/reg/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/reg/zh_TW.js{asset_ver path="/assets/js/locales/admin/reg/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/reg/ja_JP.js{asset_ver path="/assets/js/locales/admin/reg/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/ref/en_US.js{asset_ver path="/assets/js/locales/admin/ref/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/ref/vn_VN.js{asset_ver path="/assets/js/locales/admin/ref/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/ref/zh_CN.js{asset_ver path="/assets/js/locales/admin/ref/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/ref/zh_TW.js{asset_ver path="/assets/js/locales/admin/ref/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/ref/ja_JP.js{asset_ver path="/assets/js/locales/admin/ref/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/datatable/en_US.js{asset_ver path="/assets/js/locales/admin/datatable/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/datatable/vn_VN.js{asset_ver path="/assets/js/locales/admin/datatable/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/datatable/zh_CN.js{asset_ver path="/assets/js/locales/admin/datatable/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/datatable/zh_TW.js{asset_ver path="/assets/js/locales/admin/datatable/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/datatable/ja_JP.js{asset_ver path="/assets/js/locales/admin/datatable/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/admin/system/en_US.js{asset_ver path="/assets/js/locales/admin/system/en_US.js"}"></script>
    <script src="/assets/js/locales/admin/system/vn_VN.js{asset_ver path="/assets/js/locales/admin/system/vn_VN.js"}"></script>
    <script src="/assets/js/locales/admin/system/zh_CN.js{asset_ver path="/assets/js/locales/admin/system/zh_CN.js"}"></script>
    <script src="/assets/js/locales/admin/system/zh_TW.js{asset_ver path="/assets/js/locales/admin/system/zh_TW.js"}"></script>
    <script src="/assets/js/locales/admin/system/ja_JP.js{asset_ver path="/assets/js/locales/admin/system/ja_JP.js"}"></script>
    
    <script src="/assets/js/i18n.js{asset_ver path="/assets/js/i18n.js"}"></script>
    
    <style>
        /* Material Icons config */
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
    </style>
</head>

{if $user->is_dark_mode}
<body data-bs-theme="dark" class="layout-fluid">
{else}
<body class="layout-fluid">
{/if}
<div class="page">
    {include file='admin/sidebar.tpl'}
    <div class="page-wrapper">
        <!-- Luminous Guardian Admin Header -->
        <header class="header-luminous" id="luminous-header">
            <div class="d-flex align-items-center w-100">
                <!-- Sidebar toggle -->
                <button class="header-luminous__toggle" id="sidebar-toggle" title="Toggle sidebar">
                    <span class="material-symbols-outlined header-luminous__toggle-icon">menu</span>
                </button>
                
                <!-- Mobile brand -->
                <a href="/admin" class="d-lg-none ms-2 text-reset text-decoration-none fw-bold">{$config['appName']}</a>
                
                <!-- Desktop app title -->
                <h1 class="header-luminous__title" data-i18n="admin.header.app_name">Admin Panel</h1>
                
                <!-- Spacer -->
                <div class="header-luminous__spacer"></div>
                
                <!-- Navigation -->
                <div class="header-luminous__nav">
                    <!-- Notification button -->
                    <button class="header-luminous__notification" id="notification-btn" title="Notifications">
                        <span class="material-symbols-outlined header-luminous__notification-icon">notifications</span>
                        <span class="header-luminous__notification-badge"></span>
                    </button>
                    
                    <!-- Language switcher -->
                    <div class="lang-dropdown">
                        <button type="button" id="lang-switcher-btn" class="text-on-surface-variant font-medium text-sm flex items-center gap-2 hover:text-primary transition-colors" aria-label="Change language">
                            <span class="material-symbols-outlined text-xl">language</span>
                            <span id="current-lang-label">Tiếng Việt</span>
                            <span class="material-symbols-outlined text-lg">expand_more</span>
                        </button>
                        <div class="lang-dropdown-content">
                            <div class="lang-dropdown-item" data-lang="vn_VN">
                                <span>🇻🇳</span>
                                <span>Tiếng Việt</span>
                            </div>
                            <div class="lang-dropdown-item" data-lang="en_US">
                                <span>🇺🇸</span>
                                <span>English</span>
                            </div>
                            <div class="lang-dropdown-item" data-lang="zh_CN">
                                <span>🇨🇳</span>
                                <span>简体中文</span>
                            </div>
                            <div class="lang-dropdown-item" data-lang="zh_TW">
                                <span>🇹🇼</span>
                                <span>正體中文</span>
                            </div>
                            <div class="lang-dropdown-item" data-lang="ja_JP">
                                <span>🇯🇵</span>
                                <span>日本語</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- User dropdown (Bootstrap) -->
                    <div class="header-luminous__user nav-item dropdown">
                        <button type="button" class="header-luminous__user-trigger dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false" aria-label="Open user menu">
                            <img src="{$user->dice_bear}" alt="User avatar" class="header-luminous__user-avatar"/>
                            <div class="header-luminous__user-info">
                                <p class="header-luminous__user-name">{$user->email}</p>
                                <p class="header-luminous__user-role">{$user->user_name}</p>
                            </div>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end header-dropdown">
                            {if $user->is_dark_mode}
                                <a class="dropdown-item header-dropdown__item" hx-post="/user/switch_theme_mode" hx-swap="none">
                                    <span class="material-symbols-outlined header-dropdown__icon">light_mode</span>
                                    <span data-i18n="admin.header.light_mode">Chế độ sáng</span>
                                </a>
                            {else}
                                <a class="dropdown-item header-dropdown__item" hx-post="/user/switch_theme_mode" hx-swap="none">
                                    <span class="material-symbols-outlined header-dropdown__icon">dark_mode</span>
                                    <span data-i18n="admin.header.dark_mode">Chế độ tối</span>
                                </a>
                            {/if}
                            <div class="dropdown-divider"></div>
                            <a href="/user/logout" class="dropdown-item header-dropdown__item">
                                <span class="material-symbols-outlined header-dropdown__icon">logout</span>
                                <span data-i18n="admin.header.logout">Đăng xuất</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <script src="/assets/js/locale-switcher.js{asset_ver path="/assets/js/locale-switcher.js"}"></script>
        <script src="/assets/js/admin/header/scroll-shadow.js{asset_ver path="/assets/js/admin/header/scroll-shadow.js"}"></script>
