<!DOCTYPE html>
<html class="light" lang="{$config['locale']}">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta name="robots" content="noindex"/>
    <title data-i18n="login.brand">{$config['appName']}</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@300;400;500;600&amp;display=swap" rel="stylesheet"/>
    <!-- Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <!-- Custom Auth CSS -->
    <link href="/assets/css/auth/tailwind-auth.css{asset_ver path="/assets/css/auth/tailwind-auth.css"}" rel="stylesheet"/>
    <!-- Shared language dropdown (locale-switcher.js) -->
    <link href="/assets/css/locale-switcher.css{asset_ver path="/assets/css/locale-switcher.css"}" rel="stylesheet"/>
    
    <!-- WebAuthn -->
    <script src="https://unpkg.com/@simplewebauthn/browser/dist/bundle/index.umd.min.js"></script>
    
    <!-- i18n - Auth -->
    <script>window.siteConfig = { appName: '{$config['appName']}' };</script>
    <script src="/assets/js/i18n.js{asset_ver path="/assets/js/i18n.js"}"></script>
    <script src="/assets/js/locales/auth/en_US.js{asset_ver path="/assets/js/locales/auth/en_US.js"}"></script>
    <script src="/assets/js/locales/auth/vn_VN.js{asset_ver path="/assets/js/locales/auth/vn_VN.js"}"></script>
    <script src="/assets/js/locales/auth/zh_CN.js{asset_ver path="/assets/js/locales/auth/zh_CN.js"}"></script>
    <script src="/assets/js/locales/auth/zh_TW.js{asset_ver path="/assets/js/locales/auth/zh_TW.js"}"></script>
    <script src="/assets/js/locales/auth/ja_JP.js{asset_ver path="/assets/js/locales/auth/ja_JP.js"}"></script>
    
    <!-- HTMX -->
    <script src="/assets/js/fuck.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/htmx.org@v2/dist/htmx.min.js"></script>
    
    <script id="tailwind-config">
        tailwind.config = {
          darkMode: "class",
          theme: {
            extend: {
              colors: {
                primary: "#712ae2",
                "primary-container": "#8a4cfc",
                secondary: "#0051d5"
              },
              borderRadius: {
                DEFAULT: "0.5rem",
                lg: "0.75rem",
                xl: "1rem",
                "2xl": "1.5rem",
                full: "9999px"
              },
              fontFamily: {
                headline: ["Manrope", "sans-serif"],
                body: ["Inter", "sans-serif"]
              }
            }
          }
        }
    </script>
</head>

<body>
    <!-- Language switcher: same markup as landing; script: locale-switcher.js -->
    <div class="fixed top-8 right-8 z-[1000]">
        <div class="lang-dropdown">
            <button type="button" id="lang-switcher-btn" class="auth-lang-switcher">
                <span class="material-symbols-outlined" style="font-size: 1.125rem;">language</span>
                <span id="current-lang-label">Tiếng Việt</span>
                <span class="material-symbols-outlined" style="font-size: 1.125rem;">expand_more</span>
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
    </div>

    <!-- Auth Page Container -->
    <div class="auth-page">
        <div class="auth-card">
            <!-- Brand -->
            <div class="auth-brand" data-i18n="login.brand">{$config['appName']}</div>
            
            <!-- Heading -->
            <h1 class="auth-heading" data-i18n="login.welcome">Welcome back</h1>
            <p class="auth-subtitle" data-i18n="login.subtitle">Secure access to your digital velocity.</p>
            
            <!-- Login Form -->
            <form id="login-form">
                <!-- Email -->
                <div class="form-group">
                    <label class="auth-label" data-i18n="login.email_label">Email address</label>
                    <input 
                        id="email" 
                        type="email" 
                        class="auth-input" 
                        placeholder="name@company.com"
                        data-i18n-placeholder="login.email_placeholder"
                        required
                    />
                </div>
                
                <!-- Password -->
                <div class="form-group">
                    <div class="form-group-flex">
                        <label class="auth-label" data-i18n="login.password_label">Password</label>
                        <a href="/password/reset" class="auth-link" style="font-size: 0.875rem;" data-i18n="login.forgot_password">Forgot password?</a>
                    </div>
                    <input 
                        id="password" 
                        type="password" 
                        class="auth-input" 
                        placeholder="••••••••"
                        data-i18n-placeholder="login.password_placeholder"
                        required
                        autocomplete="off"
                    />
                </div>
                
                <!-- Remember Device -->
                <label class="auth-checkbox">
                    <input id="remember_me" type="checkbox"/>
                    <span data-i18n="login.remember_device">Remember this device</span>
                </label>
                
                <!-- Captcha (if enabled) -->
                {if $public_setting['enable_login_captcha']}
                <div class="form-group">
                    {include file='captcha/div.tpl'}
                </div>
                {/if}
                
                <!-- Login Button -->
                <button 
                    type="button"
                    class="auth-btn-primary"
                    hx-post="/auth/login" 
                    hx-swap="none" 
                    hx-vals='js:{
                        {if $public_setting['enable_login_captcha']}
                            {include file='captcha/ajax.tpl'}
                        {/if}
                        email: document.getElementById("email").value,
                        password: document.getElementById("password").value,
                        remember_me: document.getElementById("remember_me").checked
                    }'
                >
                    <span data-i18n="login.login_button">Login</span>
                    <span class="material-symbols-outlined" style="font-size: 1.25rem;">arrow_forward</span>
                </button>
            </form>
            
            <!-- Divider -->
            <div class="auth-divider">
                <span data-i18n="login.passwordless_divider">PASSWORDLESS ACCESS</span>
            </div>
            
            <!-- WebAuthn Button -->
            <button id="webauthnLogin" class="auth-btn-secondary">
                <span class="material-symbols-outlined" style="font-size: 1.25rem;">fingerprint</span>
                <span data-i18n="login.webauthn_button">Login with WebAuthn</span>
            </button>
            
            <!-- Footer -->
            <div class="auth-footer">
                <span data-i18n="login.new_user">New to Ether Velocity?</span>
                <a href="/auth/register" class="auth-link" data-i18n="login.create_account">Create an account</a>
            </div>
        </div>
    </div>

<!-- Captcha JS -->
{if $public_setting['enable_login_captcha']}
    {include file='captcha/js.tpl'}
{/if}

<!-- Success/Fail Modals -->
<div style="display: none;" id="success-dialog">
    <div style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 2rem; border-radius: 1rem; box-shadow: 0 20px 60px rgba(0,0,0,0.2); z-index: 10000; max-width: 400px; width: 90%;">
        <div style="text-align: center;">
            <span class="material-symbols-outlined" style="font-size: 4rem; color: #2fb344;">check_circle</span>
            <p id="success-message" style="margin-top: 1rem; font-size: 1.125rem; font-weight: 600;"></p>
            <button onclick="authModals.success.hide()" style="margin-top: 1.5rem; padding: 0.75rem 2rem; background: #2fb344; color: white; border: none; border-radius: 0.5rem; cursor: pointer; font-weight: 600;">OK</button>
        </div>
    </div>
    <div onclick="authModals.success.hide()" style="position: fixed; inset: 0; background: rgba(0,0,0,0.5); z-index: 9999;"></div>
</div>

<div style="display: none;" id="fail-dialog">
    <div style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 2rem; border-radius: 1rem; box-shadow: 0 20px 60px rgba(0,0,0,0.2); z-index: 10000; max-width: 400px; width: 90%;">
        <div style="text-align: center;">
            <span class="material-symbols-outlined" style="font-size: 4rem; color: #d63939;">cancel</span>
            <p id="fail-message" style="margin-top: 1rem; font-size: 1.125rem; font-weight: 600;"></p>
            <button onclick="authModals.fail.hide()" style="margin-top: 1.5rem; padding: 0.75rem 2rem; background: #d63939; color: white; border: none; border-radius: 0.5rem; cursor: pointer; font-weight: 600;">OK</button>
        </div>
    </div>
    <div onclick="authModals.fail.hide()" style="position: fixed; inset: 0; background: rgba(0,0,0,0.5); z-index: 9999;"></div>
</div>

<!-- Auth Common JS -->
<script src="/assets/js/auth/auth.js{asset_ver path="/assets/js/auth/auth.js"}"></script>
<script src="/assets/js/locale-switcher.js{asset_ver path="/assets/js/locale-switcher.js"}"></script>

</body>
</html>
