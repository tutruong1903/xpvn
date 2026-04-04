<!doctype html>
<html lang="{$config['locale']}" data-bs-theme="auto">

<head>
    <meta charset="utf-8"/>
    <meta name="robots" content="noindex">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>{$config['appName']}</title>
    <!-- Auto dark mode -->
    <script>
        ;(function () {
            const htmlElement = document.querySelector("html")
            const theme = htmlElement.getAttribute("data-bs-theme");

            if(theme === 'dark-auto' || theme === 'auto') {
                function updateTheme() {
                    htmlElement.setAttribute("data-bs-theme",
                        window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light")
                }
                window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', updateTheme)
                updateTheme()
            }
        })()
    </script>
    {* <!-- CSS files -->
    {* <link href="//{$config['jsdelivr_url']}/npm/@tabler/core@latest/dist/css/tabler.min.css" rel="stylesheet"/>
    <link href="//{$config['jsdelivr_url']}/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" rel="stylesheet"/> *}
    <!-- JS files -->
    <script src="/assets/js/fuck.min.js"></script>
    <script src="//{$config['jsdelivr_url']}/npm/htmx.org@v2/dist/htmx.min.js"></script>
    <!-- i18n: locale data files -->
    <script src="/assets/js/locales/en_US.js{asset_ver path="/assets/js/locales/en_US.js"}"></script>
    <script src="/assets/js/locales/zh_CN.js{asset_ver path="/assets/js/locales/zh_CN.js"}"></script>
    <script src="/assets/js/locales/zh_TW.js{asset_ver path="/assets/js/locales/zh_TW.js"}"></script>
    <script src="/assets/js/locales/ja_JP.js{asset_ver path="/assets/js/locales/ja_JP.js"}"></script>
    <script src="/assets/js/locales/vn_VN.js{asset_ver path="/assets/js/locales/vn_VN.js"}"></script>
    <!-- i18n: core + switcher -->
    <script src="/assets/js/i18n.js{asset_ver path="/assets/js/i18n.js"}"></script>
    <script src="/assets/js/locale-switcher.js{asset_ver path="/assets/js/locale-switcher.js"}"></script>
</head>
