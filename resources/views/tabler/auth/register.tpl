<!DOCTYPE html>
<html class="light" lang="{$config['locale']}">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta name="robots" content="noindex"/>
    <title data-i18n="register.brand">{$config['appName']}</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@300;400;500;600&amp;display=swap" rel="stylesheet"/>
    <!-- Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <!-- Custom Auth CSS -->
    <link href="/assets/css/auth/tailwind-auth.css{asset_ver path="/assets/css/auth/tailwind-auth.css"}" rel="stylesheet"/>
    <!-- Shared language dropdown -->
    <link href="/assets/css/locale-switcher.css{asset_ver path="/assets/css/locale-switcher.css"}" rel="stylesheet"/>
    
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
    <!-- Language switcher -->
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
            {if $public_setting['reg_mode'] !== 'close'}
                <!-- Brand -->
                <div class="auth-brand" data-i18n="register.brand">{$config['appName']}</div>
                
                <!-- Heading -->
                <h1 class="auth-heading" data-i18n="register.heading">Create account</h1>
                <p class="auth-subtitle" data-i18n="register.subtitle">Start your digital velocity journey.</p>
                
                <!-- Register Form -->
                <form id="register-form">
                    <!-- Name -->
                    <div class="form-group">
                        <label class="auth-label" data-i18n="register.name_label">Display name</label>
                        <input 
                            id="name" 
                            type="text" 
                            class="auth-input" 
                            placeholder="Your name"
                            data-i18n-placeholder="register.name_placeholder"
                            required
                        />
                    </div>
                    
                    <!-- Email -->
                    <div class="form-group">
                        <label class="auth-label" data-i18n="register.email_label">Email address</label>
                        <input 
                            id="email" 
                            type="email" 
                            class="auth-input" 
                            placeholder="name@company.com"
                            data-i18n-placeholder="register.email_placeholder"
                            required
                        />
                    </div>
                    
                    <!-- Email Verification Code -->
                    {if $public_setting['reg_email_verify']}
                    <div class="form-group">
                        <label class="auth-label" data-i18n="register.email_code_label">Email verification code</label>
                        <div style="display: flex; gap: 0.5rem;">
                            <div style="flex: 1; min-width: 0;">
                                <input 
                                    id="emailcode" 
                                    type="text" 
                                    class="auth-input" 
                                    placeholder="Enter verification code"
                                    data-i18n-placeholder="register.email_code_placeholder"
                                    required
                                />
                            </div>
                            <div style="flex: 1; min-width: 0;">
                                <button 
                                    id="send-verify-email" 
                                    type="button"
                                    class="auth-btn-secondary"
                                    style="white-space: nowrap; padding: 0.75rem 1rem; box-sizing: border-box; width: 100%; display: flex; justify-content: center; align-items: center;"
                                    hx-post="/auth/send" 
                                    hx-swap="none" 
                                    hx-disabled-elt="this"
                                    hx-vals='js:{ email: document.getElementById("email").value }'>
                                    <span data-i18n="register.email_code_get">Get code</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    {/if}
                    
                    <!-- Password -->
                    <div class="form-group">
                        <label class="auth-label" data-i18n="register.password_label">Password</label>
                        <input 
                            id="password" 
                            type="password" 
                            class="auth-input" 
                            placeholder="••••••••"
                            data-i18n-placeholder="register.password_placeholder"
                            required
                            autocomplete="off"
                        />
                    </div>
                    
                    <!-- Confirm Password -->
                    <div class="form-group">
                        <label class="auth-label" data-i18n="register.confirm_password_label">Confirm password</label>
                        <input 
                            id="confirm_password" 
                            type="password" 
                            class="auth-input" 
                            placeholder="••••••••"
                            data-i18n-placeholder="register.confirm_password_placeholder"
                            required
                            autocomplete="off"
                        />
                    </div>
                    
                    <!-- Invite Code -->
                    <div class="form-group">
                        <label class="auth-label" data-i18n="register.invite_code_label">Invitation code</label>
                        <input 
                            id="invite_code" 
                            type="text" 
                            class="auth-input"
                            placeholder="Invitation code {if $public_setting['reg_mode'] === 'open'}(Optional){else}(Required){/if}"
                            data-i18n-placeholder="register.invite_code_placeholder_{if $public_setting['reg_mode'] === 'open'}optional{else}required{/if}"
                            value="{$invite_code}"
                            {if $public_setting['reg_mode'] !== 'open'}required{/if}
                        />
                    </div>
                    
                    <!-- Terms of Service -->
                    <label class="auth-checkbox">
                        <input id="tos" type="checkbox" required/>
                        <span>
                            <span data-i18n="register.tos_prefix">I have read and agree to the</span> 
                            <a href="#" id="tos-link" class="auth-link" data-i18n="register.tos_link">Terms of Service & Privacy Policy</a>
                        </span>
                    </label>
                    
                    <!-- Captcha (if enabled) -->
                    {if $public_setting['enable_reg_captcha']}
                    <div class="form-group">
                        {include file='captcha/div.tpl'}
                    </div>
                    {/if}
                    
                    <!-- Register Button -->
                    <button 
                        type="button"
                        class="auth-btn-primary"
                        hx-post="/auth/register" 
                        hx-swap="none" 
                        hx-vals='js:{
                            {if $public_setting['reg_email_verify']}
                                emailcode: document.getElementById("emailcode").value,
                            {/if}
                            {if $public_setting['enable_reg_captcha']}
                                {include file='captcha/ajax.tpl'}
                            {/if}
                            name: document.getElementById("name").value,
                            email: document.getElementById("email").value,
                            password: document.getElementById("password").value,
                            confirm_password: document.getElementById("confirm_password").value,
                            invite_code: document.getElementById("invite_code").value,
                            tos: document.getElementById("tos").checked
                        }'>
                        <span data-i18n="register.register_button">Create account</span>
                        <span class="material-symbols-outlined" style="font-size: 1.25rem;">arrow_forward</span>
                    </button>
                </form>
                
                <!-- Footer -->
                <div class="auth-footer">
                    <span data-i18n="register.has_account">Already have an account?</span>
                    <a href="/auth/login" class="auth-link" data-i18n="register.login_link">Login here</a>
                </div>
            {else}
                <!-- Registration Closed -->
                <div class="auth-brand" data-i18n="register.brand">{$config['appName']}</div>
                <h1 class="auth-heading" data-i18n="register.heading">Create account</h1>
                <p class="auth-subtitle" data-i18n="register.closed_message">Registration is not open yet. Please check back later.</p>
                <div class="auth-footer" style="margin-top: 2rem;">
                    <span data-i18n="register.has_account">Already have an account?</span>
                    <a href="/auth/login" class="auth-link" data-i18n="register.login_link">Login here</a>
                </div>
            {/if}
        </div>
    </div>

<!-- ToS Modal -->
<div style="display: none;" id="tos-modal">
    <div style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 2.5rem; border-radius: 1rem; box-shadow: 0 20px 60px rgba(0,0,0,0.3); z-index: 10001; max-width: 600px; width: 90%; max-height: 80vh; overflow-y: auto;">
        <h2 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 1.5rem; font-family: 'Manrope', sans-serif;" data-i18n="register.tos_modal_title">Terms of Service & Privacy Policy</h2>
        
        <div style="margin-bottom: 1.5rem;">
            <h3 style="font-size: 1.125rem; font-weight: 600; margin-bottom: 0.75rem; color: #712ae2;" data-i18n="register.tos_privacy_title">Privacy & Security</h3>
            <p style="margin-bottom: 0.5rem; color: #4b5563; line-height: 1.6;" data-i18n="register.tos_privacy_1">Email is the only credential for our service. Please keep it secure.</p>
            <p style="margin-bottom: 0.5rem; color: #4b5563; line-height: 1.6;" data-i18n="register.tos_privacy_2">User passwords are encrypted and stored securely. However, please use strong passwords or a password manager.</p>
        </div>
        
        <div style="margin-bottom: 1.5rem;">
            <h3 style="font-size: 1.125rem; font-weight: 600; margin-bottom: 0.75rem; color: #712ae2;" data-i18n="register.tos_terms_title">Terms of Use</h3>
            <p style="margin-bottom: 0.5rem; color: #4b5563; line-height: 1.6;" data-i18n="register.tos_terms_1">When using the service, you must comply with the laws of the country where the site and nodes are located.</p>
            <p style="margin-bottom: 0.5rem; color: #4b5563; line-height: 1.6;" data-i18n="register.tos_terms_2">For free users, we reserve the right to delete accounts without notice.</p>
            <p style="margin-bottom: 0.5rem; color: #4b5563; line-height: 1.6;" data-i18n="register.tos_terms_3">Any user who violates the terms will have their account deleted and service access revoked.</p>
        </div>
        
        <button id="tos-close" style="width: 100%; padding: 0.75rem; background: #712ae2; color: white; border: none; border-radius: 0.5rem; cursor: pointer; font-weight: 600; font-size: 1rem;">
            <span data-i18n="register.tos_close">Close</span>
        </button>
    </div>
    <div id="tos-backdrop" style="position: fixed; inset: 0; background: rgba(0,0,0,0.5); z-index: 10000;"></div>
</div>

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

<!-- Captcha JS -->
{if $public_setting['enable_reg_captcha']}
    {include file='captcha/js.tpl'}
{/if}

<!-- Auth Common JS -->
<script src="/assets/js/auth/auth.js{asset_ver path="/assets/js/auth/auth.js"}"></script>
<script src="/assets/js/locale-switcher.js{asset_ver path="/assets/js/locale-switcher.js"}"></script>

</body>
</html>

