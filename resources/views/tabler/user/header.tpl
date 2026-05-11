<!doctype html>
<html lang="zh">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <meta name="referrer" content="never">
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
    <link href="/assets/css/user/dashboard.css{asset_ver path="/assets/css/user/dashboard.css"}" rel="stylesheet"/>
    <link href="/assets/css/user/ticket.css{asset_ver path="/assets/css/user/ticket.css"}" rel="stylesheet"/>
    <link href="/assets/css/user/invite.css{asset_ver path="/assets/css/user/invite.css"}" rel="stylesheet"/>
    
    <link href="/assets/css/user/product.css{asset_ver path="/assets/css/user/product.css"}" rel="stylesheet"/>
    <link href="/assets/css/user/order.css{asset_ver path="/assets/css/user/order.css"}" rel="stylesheet"/>
    <link href="/assets/css/user/server.css{asset_ver path="/assets/css/user/server.css"}" rel="stylesheet"/>
    <link href="/assets/css/user/announcement.css{asset_ver path="/assets/css/user/announcement.css"}" rel="stylesheet"/>
    <link href="/assets/css/user/docs.css{asset_ver path="/assets/css/user/docs.css"}" rel="stylesheet"/>
    
    <!-- JS files -->
    <script src="/assets/js/fuck.min.js"></script>
    <script src="//{$config['jsdelivr_url']}/npm/qrcode_js@latest/qrcode.min.js"></script>
    <script src="//{$config['jsdelivr_url']}/npm/clipboard@latest/dist/clipboard.min.js"></script>
    <script src="//{$config['jsdelivr_url']}/npm/htmx.org@latest/dist/htmx.min.js"></script>
    
    <!-- i18n - Global locales -->
    <script>window.siteConfig = { appName: '{$config['appName']}' };</script>
    <script src="/assets/js/locales/en_US.js{asset_ver path="/assets/js/locales/en_US.js"}"></script>
    <script src="/assets/js/locales/vn_VN.js{asset_ver path="/assets/js/locales/vn_VN.js"}"></script>
    <script src="/assets/js/locales/zh_CN.js{asset_ver path="/assets/js/locales/zh_CN.js"}"></script>
    <script src="/assets/js/locales/zh_TW.js{asset_ver path="/assets/js/locales/zh_TW.js"}"></script>
    <script src="/assets/js/locales/ja_JP.js{asset_ver path="/assets/js/locales/ja_JP.js"}"></script>
    
    <!-- i18n - User component locales -->
    <script src="/assets/js/locales/user/header/en_US.js{asset_ver path="/assets/js/locales/user/header/en_US.js"}"></script>
    <script src="/assets/js/locales/user/header/vn_VN.js{asset_ver path="/assets/js/locales/user/header/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/header/zh_CN.js{asset_ver path="/assets/js/locales/user/header/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/header/zh_TW.js{asset_ver path="/assets/js/locales/user/header/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/header/ja_JP.js{asset_ver path="/assets/js/locales/user/header/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/user/sidebar/en_US.js{asset_ver path="/assets/js/locales/user/sidebar/en_US.js"}"></script>
    <script src="/assets/js/locales/user/sidebar/vn_VN.js{asset_ver path="/assets/js/locales/user/sidebar/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/sidebar/zh_CN.js{asset_ver path="/assets/js/locales/user/sidebar/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/sidebar/zh_TW.js{asset_ver path="/assets/js/locales/user/sidebar/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/sidebar/ja_JP.js{asset_ver path="/assets/js/locales/user/sidebar/ja_JP.js"}"></script>
    
    <script src="/assets/js/locales/user/dashboard/en_US.js{asset_ver path="/assets/js/locales/user/dashboard/en_US.js"}"></script>
    <script src="/assets/js/locales/user/dashboard/vn_VN.js{asset_ver path="/assets/js/locales/user/dashboard/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/dashboard/zh_CN.js{asset_ver path="/assets/js/locales/user/dashboard/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/dashboard/zh_TW.js{asset_ver path="/assets/js/locales/user/dashboard/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/dashboard/ja_JP.js{asset_ver path="/assets/js/locales/user/dashboard/ja_JP.js"}"></script>
    
    <!-- i18n - Ticket component locales -->
    <script src="/assets/js/locales/user/ticket/en_US.js{asset_ver path="/assets/js/locales/user/ticket/en_US.js"}"></script>
    <script src="/assets/js/locales/user/ticket/vn_VN.js{asset_ver path="/assets/js/locales/user/ticket/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/ticket/zh_CN.js{asset_ver path="/assets/js/locales/user/ticket/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/ticket/zh_TW.js{asset_ver path="/assets/js/locales/user/ticket/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/ticket/ja_JP.js{asset_ver path="/assets/js/locales/user/ticket/ja_JP.js"}"></script>
    
    <!-- i18n - Invite component locales -->
    <script src="/assets/js/locales/user/invite/en_US.js{asset_ver path="/assets/js/locales/user/invite/en_US.js"}"></script>
    <script src="/assets/js/locales/user/invite/vn_VN.js{asset_ver path="/assets/js/locales/user/invite/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/invite/zh_CN.js{asset_ver path="/assets/js/locales/user/invite/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/invite/zh_TW.js{asset_ver path="/assets/js/locales/user/invite/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/invite/ja_JP.js{asset_ver path="/assets/js/locales/user/invite/ja_JP.js"}"></script>
    
    <!-- i18n - Product component locales -->
    <script src="/assets/js/locales/user/product/en_US.js{asset_ver path="/assets/js/locales/user/product/en_US.js"}"></script>
    <script src="/assets/js/locales/user/product/vn_VN.js{asset_ver path="/assets/js/locales/user/product/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/product/zh_CN.js{asset_ver path="/assets/js/locales/user/product/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/product/zh_TW.js{asset_ver path="/assets/js/locales/user/product/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/product/ja_JP.js{asset_ver path="/assets/js/locales/user/product/ja_JP.js"}"></script>
    
    <!-- i18n - Order component locales -->
    <script src="/assets/js/locales/user/order/en_US.js{asset_ver path="/assets/js/locales/user/order/en_US.js"}"></script>
    <script src="/assets/js/locales/user/order/vn_VN.js{asset_ver path="/assets/js/locales/user/order/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/order/zh_CN.js{asset_ver path="/assets/js/locales/user/order/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/order/zh_TW.js{asset_ver path="/assets/js/locales/user/order/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/order/ja_JP.js{asset_ver path="/assets/js/locales/user/order/ja_JP.js"}"></script>
    
    <!-- i18n - Invoice component locales -->
    <script src="/assets/js/locales/user/invoice/en_US.js{asset_ver path="/assets/js/locales/user/invoice/en_US.js"}"></script>
    <script src="/assets/js/locales/user/invoice/vn_VN.js{asset_ver path="/assets/js/locales/user/invoice/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/invoice/zh_CN.js{asset_ver path="/assets/js/locales/user/invoice/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/invoice/zh_TW.js{asset_ver path="/assets/js/locales/user/invoice/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/invoice/ja_JP.js{asset_ver path="/assets/js/locales/user/invoice/ja_JP.js"}"></script>
    
    <!-- i18n - Money component locales -->
    <script src="/assets/js/locales/user/money/en_US.js{asset_ver path="/assets/js/locales/user/money/en_US.js"}"></script>
    <script src="/assets/js/locales/user/money/vn_VN.js{asset_ver path="/assets/js/locales/user/money/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/money/zh_CN.js{asset_ver path="/assets/js/locales/user/money/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/money/zh_TW.js{asset_ver path="/assets/js/locales/user/money/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/money/ja_JP.js{asset_ver path="/assets/js/locales/user/money/ja_JP.js"}"></script>
    
    <!-- i18n - Server component locales -->
    <script src="/assets/js/locales/user/server/en_US.js{asset_ver path="/assets/js/locales/user/server/en_US.js"}"></script>
    <script src="/assets/js/locales/user/server/vn_VN.js{asset_ver path="/assets/js/locales/user/server/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/server/zh_CN.js{asset_ver path="/assets/js/locales/user/server/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/server/zh_TW.js{asset_ver path="/assets/js/locales/user/server/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/server/ja_JP.js{asset_ver path="/assets/js/locales/user/server/ja_JP.js"}"></script>
    
    <!-- i18n - Detect component locales -->
    <script src="/assets/js/locales/user/detect/en_US.js{asset_ver path="/assets/js/locales/user/detect/en_US.js"}"></script>
    <script src="/assets/js/locales/user/detect/vn_VN.js{asset_ver path="/assets/js/locales/user/detect/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/detect/zh_CN.js{asset_ver path="/assets/js/locales/user/detect/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/detect/zh_TW.js{asset_ver path="/assets/js/locales/user/detect/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/detect/ja_JP.js{asset_ver path="/assets/js/locales/user/detect/ja_JP.js"}"></script>
    
    <!-- i18n - DataTable locales (shared across all user pages with datatable) -->
    <script src="/assets/js/locales/user/datatable/en_US.js{asset_ver path="/assets/js/locales/user/datatable/en_US.js"}"></script>
    <script src="/assets/js/locales/user/datatable/vn_VN.js{asset_ver path="/assets/js/locales/user/datatable/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/datatable/zh_CN.js{asset_ver path="/assets/js/locales/user/datatable/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/datatable/zh_TW.js{asset_ver path="/assets/js/locales/user/datatable/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/datatable/ja_JP.js{asset_ver path="/assets/js/locales/user/datatable/ja_JP.js"}"></script>
    
    <!-- i18n - Footer dialog locales (shared across all user pages) -->
    <script src="/assets/js/locales/user/footer/en_US.js{asset_ver path="/assets/js/locales/user/footer/en_US.js"}"></script>
    <script src="/assets/js/locales/user/footer/vn_VN.js{asset_ver path="/assets/js/locales/user/footer/vn_VN.js"}"></script>
    <script src="/assets/js/locales/user/footer/zh_CN.js{asset_ver path="/assets/js/locales/user/footer/zh_CN.js"}"></script>
    <script src="/assets/js/locales/user/footer/zh_TW.js{asset_ver path="/assets/js/locales/user/footer/zh_TW.js"}"></script>
    <script src="/assets/js/locales/user/footer/ja_JP.js{asset_ver path="/assets/js/locales/user/footer/ja_JP.js"}"></script>
    
    <script src="/assets/js/i18n.js{asset_ver path="/assets/js/i18n.js"}"></script>
    
    <style>
        /* Material Icons config */
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
    </style>
</head>

{if $user->is_dark_mode}
<body data-bs-theme="dark" class="layout-fluid luminous-dashboard">
{else}
<body class="layout-fluid luminous-dashboard">
{/if}
<div class="page">
    {include file='user/sidebar.tpl'}
    <div class="page-wrapper">
        <!-- Luminous Guardian Header -->
        <header class="header-luminous" id="luminous-header">
            <div class="d-flex align-items-center w-100">
                <!-- Sidebar toggle -->
                <button class="header-luminous__toggle" id="sidebar-toggle" title="Toggle sidebar">
                    <span class="material-symbols-outlined header-luminous__toggle-icon">menu</span>
                </button>
                
                <!-- Mobile brand -->
                <a href="/user" class="d-lg-none ms-2 text-reset text-decoration-none fw-bold">{$config['appName']}</a>
                
                <!-- Desktop app title -->
                <h1 class="header-luminous__title" data-i18n-user-header="app_name">Trung tâm người dùng</h1>
                
                <!-- Spacer -->
                <div class="header-luminous__spacer"></div>
                
                <!-- Navigation -->
                <div class="header-luminous__nav">
                    <!-- Notification button -->
                    <button class="header-luminous__notification" id="notification-btn" title="Notifications">
                        <span class="material-symbols-outlined header-luminous__notification-icon">notifications</span>
                        <span class="header-luminous__notification-badge"></span>
                    </button>
                    
                    <!-- Language switcher — same markup as tabler/header.tpl + locale-switcher.js -->
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
                            <a href="/user/logout" class="dropdown-item header-dropdown__item">
                                <span class="material-symbols-outlined header-dropdown__icon">logout</span>
                                <span data-i18n-user-header="logout">登出</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <script src="/assets/js/locale-switcher.js{asset_ver path="/assets/js/locale-switcher.js"}"></script>
        <script src="/assets/js/user/header/scroll-shadow.js{asset_ver path="/assets/js/user/header/scroll-shadow.js"}"></script>
