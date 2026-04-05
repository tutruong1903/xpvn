<!DOCTYPE html>
<html class="light" lang="{$config['locale']}">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta name="robots" content="noindex"/>
    <title>{$config['appName']} - VPN Tốc Độ Cao &amp; Bảo Mật</title>

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script src="/assets/js/landing/tailwind-config.js{asset_ver path="/assets/js/landing/tailwind-config.js"}"></script>

    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@300;400;500;600&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <link href="/assets/css/landing/tailwind-landing.css{asset_ver path="/assets/css/landing/tailwind-landing.css"}" rel="stylesheet"/>

    <script>window.siteConfig = { appName: '{$config['appName']}' };</script>
    <script src="/assets/js/i18n.js{asset_ver path="/assets/js/i18n.js"}"></script>
    <script src="/assets/js/locales/landing/en_US.js{asset_ver path="/assets/js/locales/landing/en_US.js"}"></script>
    <script src="/assets/js/locales/landing/vn_VN.js{asset_ver path="/assets/js/locales/landing/vn_VN.js"}"></script>
    <script src="/assets/js/locales/landing/zh_CN.js{asset_ver path="/assets/js/locales/landing/zh_CN.js"}"></script>
    <script src="/assets/js/locales/landing/zh_TW.js{asset_ver path="/assets/js/locales/landing/zh_TW.js"}"></script>
    <script src="/assets/js/locales/landing/ja_JP.js{asset_ver path="/assets/js/locales/landing/ja_JP.js"}"></script>
</head>

<body class="bg-background font-body text-on-surface antialiased">

<nav class="w-full top-0 sticky z-50 bg-background backdrop-blur-lg bg-opacity-90">
    <div class="flex justify-between items-center px-8 py-4 max-w-7xl mx-auto">
        <div class="flex items-center gap-12">
            <span class="text-xl font-bold tracking-tighter text-on-surface font-headline">{$config['appName']}</span>
            <div class="hidden md:flex gap-8 items-center">
                <a class="font-headline text-sm tracking-tight font-medium text-on-surface-variant hover:text-primary transition-colors duration-200" href="#hero" data-i18n="landing.nav.speed">Tốc độ</a>
                <a class="font-headline text-sm tracking-tight font-medium text-on-surface-variant hover:text-primary transition-colors duration-200" href="#features" data-i18n="landing.nav.features">Tính năng</a>
                <a class="font-headline text-sm tracking-tight font-medium text-on-surface-variant hover:text-primary transition-colors duration-200" href="#streaming" data-i18n="landing.nav.streaming">Streaming</a>
                <a class="font-headline text-sm tracking-tight font-medium text-on-surface-variant hover:text-primary transition-colors duration-200" href="#pricing" data-i18n="landing.nav.pricing">Bảng giá</a>
            </div>
        </div>
        <div class="flex items-center gap-6">
            <div class="lang-dropdown">
                <button type="button" id="lang-switcher-btn" class="text-on-surface-variant font-medium text-sm flex items-center gap-2 hover:text-primary transition-colors">
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
            <a class="bg-primary text-white px-6 py-2 rounded-full font-bold text-sm shadow-lg shadow-primary/20 hover:opacity-90 transition-all" href="/auth/login" data-i18n="landing.nav.login">Đăng nhập</a>
        </div>
    </div>
</nav>
