{include file='header.tpl'}

<script src="https://unpkg.com/@simplewebauthn/browser/dist/bundle/index.umd.min.js"></script>

<body class="border-top-wide border-primary d-flex flex-column">
<div class="page page-center">
    <div class="container-tight my-auto">
        <div class="text-center mb-4">
            <a href="#" class="navbar-brand navbar-brand-autodark">
                <img src="/images/uim-logo-round_96x96.png" height="64" alt="SSPanel-UIM Logo">
            </a>
        </div>
        <div class="card card-md">
            <div class="card-body">
                <h2 class="card-title text-center mb-4" data-i18n="auth.login.title">登录到用户中心</h2>
                <div class="mb-3">
                    <label class="form-label" data-i18n="auth.login.email">邮箱</label>
                    <input id="email" type="email" class="form-control">
                </div>
                <div class="mb-2">
                    <label class="form-label">
                        <span data-i18n="auth.login.password">登录密码</span>
                        <span class="form-label-description">
                                <a href="/password/reset" data-i18n="auth.login.forgot">忘记密码</a>
                            </span>
                    </label>
                    <div class="input-group input-group-flat">
                        <input id="password" type="password" class="form-control" autocomplete="off">
                    </div>
                </div>
                <div class="mb-2">
                    <label class="form-check">
                        <input id="remember_me" type="checkbox" class="form-check-input"/>
                        <span class="form-check-label" data-i18n="auth.login.remember">记住此设备</span>
                    </label>
                </div>
                <div class="mb-3">
                    <div class="input-group mb-3">
                    {if $public_setting['enable_login_captcha']}
                        {include file='captcha/div.tpl'}
                    {/if}
                    </div>
                </div>
                <div class="form-footer">
                    <button class="btn btn-primary w-100 mb-3"
                            hx-post="/auth/login" hx-swap="none" hx-vals='js:{
                                {if $public_setting['enable_login_captcha']}
                                    {include file='captcha/ajax.tpl'}
                                {/if}
                                email: document.getElementById("email").value,
                                password: document.getElementById("password").value,
                                remember_me: document.getElementById("remember_me").checked,
                             }'>
                        <span data-i18n="auth.login.btn">登录</span>
                    </button>
                    <button class="btn btn-primary w-100" id="webauthnLogin">
                        <span data-i18n="auth.login.webauthn">使用WebAuthn登录</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="text-center text-secondary mt-3">
            <span data-i18n="auth.login.no_account">还没有账户？</span> <a href="/auth/register" tabindex="-1" data-i18n="auth.login.register_link">点击注册</a>
        </div>
    </div>
</div>

{if $public_setting['enable_login_captcha']}
    {include file='captcha/js.tpl'}
{/if}

{include file='footer.tpl'}

{literal}
    <script>
        const { startAuthentication } = SimpleWebAuthnBrowser;
        document.getElementById('webauthnLogin').addEventListener('click', async () => {
            const resp = await fetch('/auth/webauthn');
            const options = await resp.json();
            let asseResp;
            try {
                asseResp = await startAuthentication({ optionsJSON: options });
            } catch (error) {
                document.getElementById("fail-message").innerHTML = error;
                throw error;
            }
            const verificationResp = await fetch('/auth/webauthn', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(asseResp),
            });
            const verificationJSON = await verificationResp.json();
            if (verificationJSON.ret === 1) {
                document.getElementById("success-message").innerHTML = verificationJSON.msg;
                successDialog.show();
                window.location.href = verificationJSON.redir;
            } else {
                document.getElementById("fail-message").innerHTML = verificationJSON.msg;
                failDialog.show();
            }
        });
    </script>
{/literal}