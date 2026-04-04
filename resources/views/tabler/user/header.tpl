<!doctype html>
<html lang="zh">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <meta name="referrer" content="never">
    <title>{$config['appName']}</title>
    <!-- CSS files -->
    <link href="//{$config['jsdelivr_url']}/npm/@tabler/core@latest/dist/css/tabler.min.css" rel="stylesheet"/>
    <link href="//{$config['jsdelivr_url']}/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" rel="stylesheet"/>
    <link href="/assets/css/user/sidebar.css{asset_ver path="/assets/css/user/sidebar.css"}" rel="stylesheet"/>
    <link href="/assets/css/user/header.css{asset_ver path="/assets/css/user/header.css"}" rel="stylesheet"/>
    <!-- JS files -->
    <script src="/assets/js/fuck.min.js"></script>
    <script src="//{$config['jsdelivr_url']}/npm/qrcode_js@latest/qrcode.min.js"></script>
    <script src="//{$config['jsdelivr_url']}/npm/clipboard@latest/dist/clipboard.min.js"></script>
    <script src="//{$config['jsdelivr_url']}/npm/htmx.org@latest/dist/htmx.min.js"></script>
    <!-- i18n -->
    <script>window.siteConfig = { appName: '{$config['appName']}' };</script>
    <script src="/assets/js/locales/en_US.js{asset_ver path="/assets/js/locales/en_US.js"}"></script>
    <script src="/assets/js/locales/vn_VN.js{asset_ver path="/assets/js/locales/vn_VN.js"}"></script>
    <script src="/assets/js/locales/zh_CN.js{asset_ver path="/assets/js/locales/zh_CN.js"}"></script>
    <script src="/assets/js/locales/zh_TW.js{asset_ver path="/assets/js/locales/zh_TW.js"}"></script>
    <script src="/assets/js/locales/ja_JP.js{asset_ver path="/assets/js/locales/ja_JP.js"}"></script>
    <script src="/assets/js/i18n.js{asset_ver path="/assets/js/i18n.js"}"></script>
    <style>
        .home-subtitle {
            font-size: 14px;
        }

        .home-title {
            font-size: 36px;
        }
    </style>
</head>

{if $user->is_dark_mode}
<body data-bs-theme="dark" class="layout-fluid">
{else}
<body class="layout-fluid">
{/if}
<div class="page">
    {include file='user/sidebar.tpl'}
    <div class="page-wrapper">
     <header class="user-header">
        <div class="d-flex align-items-center w-100">
            <!-- Sidebar toggle -->
            <button class="sidebar-toggle-btn" id="sidebar-toggle" title="Toggle sidebar">
                <i class="ti ti-menu-2"></i>
            </button>
            <!-- Mobile brand -->
            <a href="/user" class="d-lg-none ms-2 text-reset text-decoration-none fw-bold">{$config['appName']}</a>
            <!-- Spacer -->
            <div class="ms-auto"></div>
            <!-- Language dropdown (separate, to the left of user dropdown) -->
            <div class="nav-item dropdown me-3">
                <a href="#" class="nav-link p-0" data-bs-toggle="dropdown" aria-label="Change language">
                    <span class="lang-badge" id="lang-badge">🇻🇳 Tiếng Việt</span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <a class="dropdown-item header-lang-option" href="#" data-lang="vn_VN">🇻🇳 Tiếng Việt</a>
                    <a class="dropdown-item header-lang-option" href="#" data-lang="en_US">🇺🇸 English</a>
                    <a class="dropdown-item header-lang-option" href="#" data-lang="zh_CN">🇨🇳 中文</a>
                    <a class="dropdown-item header-lang-option" href="#" data-lang="zh_TW">🇹🇼 正體中文</a>
                    <a class="dropdown-item header-lang-option" href="#" data-lang="ja_JP">🇯🇵 日本語</a>
                </div>
            </div>
            <!-- User dropdown -->
            <div class="nav-item dropdown">
                <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown"
                   aria-label="Open user menu">
                    <span class="avatar avatar-sm"
                          style="background-image: url({$user->dice_bear})"></span>
                    <div class="d-none d-xl-block ps-2">
                        <div>{$user->email}</div>
                        <div class="mt-1 small text-secondary">{$user->user_name}</div>
                    </div>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    {if $user->is_dark_mode}
                        <a class="dropdown-item" hx-post="/user/switch_theme_mode" hx-swap="none">
                            <i class="ti ti-sun me-2"></i><span data-i18n="user.header.light_mode">浅色模式</span>
                        </a>
                    {else}
                        <a class="dropdown-item" hx-post="/user/switch_theme_mode" hx-swap="none">
                            <i class="ti ti-moon me-2"></i><span data-i18n="user.header.dark_mode">深色模式</span>
                        </a>
                    {/if}
                    <div class="dropdown-divider"></div>
                    <a href="/user/logout" class="dropdown-item">
                        <i class="ti ti-logout me-2"></i><span data-i18n="user.header.logout">登出</span>
                    </a>
                </div>
            </div>
        </div>
    </header>
