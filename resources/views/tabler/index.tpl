{if $user->isLogin}
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="robots" content="noindex">
    <title>{$config['appName']}</title>
    <script>window.location.href = "/user"</script>
</head>
</html>
{else}
{include file='header.tpl'}

<body class="d-flex flex-column">

<div class="page">
    <!-- Navbar -->
    <header class="navbar navbar-expand-md navbar-light d-print-none">
        <div class="container-xl">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
                <a href="/">
                    <img src="/images/uim-logo-round_96x96.png" width="32" height="32" alt="Logo" class="navbar-brand-image me-2">
                    {$config['appName']}
                </a>
            </h1>
            <div class="navbar-nav flex-row order-md-last">
                <a href="/auth/login" class="btn btn-outline-primary me-2">
                    <i class="ti ti-login icon"></i>
                    Login
                </a>
                <a href="/auth/register" class="btn btn-primary">
                    <i class="ti ti-user-plus icon"></i>
                    Register
                </a>
            </div>
        </div>
    </header>

    <div class="page-wrapper">
        <!-- Hero Section -->
        <div class="page-body">
            <div class="container-xl">
                <div class="row align-items-center justify-content-center" style="min-height: 70vh;">
                    <div class="col-lg-6 text-center text-lg-start">
                        <h1 class="display-4 fw-bold mb-3">
                            Secure & Fast
                            <span class="text-primary">VPN Service</span>
                        </h1>
                        <p class="text-secondary fs-3 mb-4">
                            Access the internet freely, securely, and without limits.
                            Powered by next-generation protocols for the best experience.
                        </p>
                        <div class="d-flex gap-2 justify-content-center justify-content-lg-start">
                            <a href="/auth/register" class="btn btn-primary btn-lg px-4">
                                <i class="ti ti-rocket icon"></i>
                                Get Started
                            </a>
                            <a href="/auth/login" class="btn btn-outline-primary btn-lg px-4">
                                <i class="ti ti-login icon"></i>
                                Sign In
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-5 d-none d-lg-block text-center">
                        <div class="p-4">
                            <svg xmlns="http://www.w3.org/2000/svg" width="280" height="280" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="text-primary" style="opacity:.3">
                                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Features Section -->
        <div class="page-body border-top">
            <div class="container-xl py-4">
                <div class="text-center mb-4">
                    <h2 class="h1">Why Choose Us?</h2>
                    <p class="text-secondary">Everything you need for secure internet access</p>
                </div>
                <div class="row row-cards">
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="mb-3">
                                    <span class="avatar avatar-lg bg-primary-lt">
                                        <i class="ti ti-bolt fs-1"></i>
                                    </span>
                                </div>
                                <h3 class="card-title">Lightning Fast</h3>
                                <p class="text-secondary">High-performance servers with optimized routing for the best speeds.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="mb-3">
                                    <span class="avatar avatar-lg bg-green-lt">
                                        <i class="ti ti-shield-lock fs-1"></i>
                                    </span>
                                </div>
                                <h3 class="card-title">Fully Encrypted</h3>
                                <p class="text-secondary">Military-grade encryption protects your data and privacy at all times.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="mb-3">
                                    <span class="avatar avatar-lg bg-azure-lt">
                                        <i class="ti ti-world fs-1"></i>
                                    </span>
                                </div>
                                <h3 class="card-title">Global Network</h3>
                                <p class="text-secondary">Servers worldwide give you unrestricted access to any content.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="mb-3">
                                    <span class="avatar avatar-lg bg-purple-lt">
                                        <i class="ti ti-devices fs-1"></i>
                                    </span>
                                </div>
                                <h3 class="card-title">Multi-Platform</h3>
                                <p class="text-secondary">Works on Windows, macOS, iOS, Android, and Linux with easy setup.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Protocols Section -->
        <div class="page-body">
            <div class="container-xl py-4">
                <div class="text-center mb-4">
                    <h2 class="h1">Supported Protocols</h2>
                    <p class="text-secondary">Latest protocols for the best performance and security</p>
                </div>
                <div class="row row-cards justify-content-center">
                    <div class="col-auto">
                        <span class="badge bg-blue-lt fs-4 px-3 py-2">Shadowsocks 2022</span>
                    </div>
                    <div class="col-auto">
                        <span class="badge bg-green-lt fs-4 px-3 py-2">V2Ray / VMess</span>
                    </div>
                    <div class="col-auto">
                        <span class="badge bg-purple-lt fs-4 px-3 py-2">Trojan</span>
                    </div>
                    <div class="col-auto">
                        <span class="badge bg-orange-lt fs-4 px-3 py-2">TUIC</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- CTA Section -->
        <div class="page-body border-top bg-primary-lt">
            <div class="container-xl py-5 text-center">
                <h2 class="h1 mb-3">Ready to Get Started?</h2>
                <p class="text-secondary fs-3 mb-4">Join now and experience the internet without boundaries.</p>
                <a href="/auth/register" class="btn btn-primary btn-lg px-5">
                    <i class="ti ti-rocket icon"></i>
                    Create Free Account
                </a>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer footer-transparent d-print-none">
            <div class="container-xl">
                <div class="row text-center align-items-center">
                    <div class="col-12">
                        <ul class="list-inline list-inline-dots mb-0">
                            <li class="list-inline-item">
                                &copy; {$smarty.now|date_format:"%Y"} {$config['appName']}. All rights reserved.
                            </li>
                            <li class="list-inline-item">
                                <a href="/tos" class="link-secondary">Terms of Service</a>
                            </li>
                            <li class="list-inline-item">
                                <a href="/staff" class="link-secondary">Staff</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

{include file='footer.tpl'}
{/if}
