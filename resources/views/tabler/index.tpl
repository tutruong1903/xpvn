{if $user->isLogin}
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="robots" content="noindex">
    <title>{$config['appName']}</title>
    <script>window.location.href = "/user"</script>
</head>
</html>
{else}
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="robots" content="noindex">
    <title>{$config['appName']}</title>

    <!-- Bootstrap 5 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- FontAwesome 6 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.2/css/all.min.css">
    <!-- Landing Page Custom CSS -->
    <link rel="stylesheet" href="/assets/css/landing/style.css">
    <!-- i18n -->
    <script>window.siteConfig = { appName: '{$config['appName']}' };</script>
    <script src="/assets/js/locales/en_US.js?v=4"></script>
    <script src="/assets/js/locales/vn_VN.js?v=4"></script>
    <script src="/assets/js/locales/zh_CN.js?v=4"></script>
    <script src="/assets/js/locales/zh_TW.js?v=4"></script>
    <script src="/assets/js/locales/ja_JP.js?v=4"></script>
    <script src="/assets/js/i18n.js?v=4"></script>
</head>

<body>

<!-- ============================================================
     NAVBAR
     ============================================================ -->
<nav class="navbar navbar-expand-lg fixed-top" id="navbar">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand logo" href="#">
            <img src="/assets/images/landing/logo-b.svg" alt="{$config['appName']}" class="logo-dark" height="28">
            <img src="/assets/images/landing/logo-allw.svg" alt="{$config['appName']}" class="logo-light" height="28">
        </a>

        <!-- Mobile toggler -->
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon-custom">
                <i data-feather="menu" style="width:24px;height:24px;color:inherit;"></i>
            </span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav ms-auto" id="navbar-navlist">
                <li class="nav-item"><a href="#home"     class="nav-link"><span data-i18n="landing.header.home">Trang chủ</span></a></li>
                <li class="nav-item"><a href="#services" class="nav-link"><span data-i18n="landing.header.services">Dịch vụ</span></a></li>
                <li class="nav-item"><a href="#features" class="nav-link"><span data-i18n="landing.header.features">Tính năng</span></a></li>
                <li class="nav-item"><a href="#pricing"  class="nav-link"><span data-i18n="landing.header.pricing">Bảng giá</span></a></li>
            </ul>
            <!-- Language Switcher -->
            <div class="dropdown d-inline-block ms-lg-2">
                <button class="btn btn-sm rounded-pill nav-btn-outline" type="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-globe me-1"></i> <span id="lang-label">VI</span>
                </button>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item lang-option" href="#" data-lang="vn_VN">🇻🇳 Tiếng Việt</a></li>
                    <li><a class="dropdown-item lang-option" href="#" data-lang="en_US">🇺🇸 English</a></li>
                    <li><a class="dropdown-item lang-option" href="#" data-lang="zh_CN">🇨🇳 中文</a></li>
                    <li><a class="dropdown-item lang-option" href="#" data-lang="zh_TW">🇹🇼 正體中文</a></li>
                    <li><a class="dropdown-item lang-option" href="#" data-lang="ja_JP">🇯🇵 日本語</a></li>
                </ul>
            </div>
            <a href="/auth/login" class="btn btn-sm rounded-pill nav-btn ms-lg-3">
                <i class="fas fa-sign-in-alt me-1"></i> <span data-i18n="landing.header.login">Đăng nhập</span>
            </a>
        </div>
    </div>
</nav>
<!-- End Navbar -->


<!-- ============================================================
     HERO
     ============================================================ -->
<div class="homepage_bg">
    <section class="hero-section" id="home">
        <div class="container">
            <div class="row align-items-center">

                <!-- Left: text -->
                <div class="col-lg-6 reveal">
                    <h1 class="text-white mb-4" data-i18n-html="landing.index.hero_title">
                        Dịch vụ VPN toàn cầu,<br>truy cập không giới hạn
                    </h1>
                    <p class="text-white-70 mb-4 fs-5" data-i18n="landing.index.hero_desc">
                        Hệ thống phân luồng thông minh, mã hóa chuẩn quân sự, bảo vệ dữ liệu và quyền riêng tư.
                        Tương thích với mọi thiết bị và nền tảng phổ biến.
                    </p>
                    <div class="d-flex flex-wrap gap-2">
                        <a class="btn btn-lg btn-light rounded-pill px-4" href="/auth/register">
                            <strong data-i18n="landing.index.get_started">Bắt đầu ngay</strong>
                            <i class="fas fa-arrow-right ms-2"></i>
                        </a>
                        <a class="btn btn-lg btn-outline-light rounded-pill px-4" href="/auth/login">
                            <i class="fas fa-sign-in-alt me-2"></i> <span data-i18n="landing.index.sign_in">Đăng nhập</span>
                        </a>
                    </div>
                </div>

                <!-- Right: visual -->
                <div class="col-lg-5 ms-lg-auto d-none d-lg-block reveal">
                    <div class="hero-visual text-center">
                        <div class="hero-shield">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <div class="hero-badges mt-3">
                            <span class="hero-badge badge-netflix">Netflix</span>
                            <span class="hero-badge badge-youtube">YouTube</span>
                            <span class="hero-badge badge-spotify">Spotify</span>
                            <span class="hero-badge badge-hbo">HBO Max</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</div>
<!-- End Hero -->


<!-- ============================================================
     SERVICES
     ============================================================ -->
<section class="section" id="services">
    <div class="container">

        <div class="row justify-content-center mb-5">
            <div class="col-lg-7 text-center reveal">
                <h2 class="fw-bold" data-i18n="landing.index.services_title">Giải pháp hoàn hảo cho mọi nhu cầu</h2>
                <p class="text-muted" data-i18n="landing.index.services_desc">
                    Được thiết kế riêng cho người dùng có nhu cầu truy cập quốc tế —
                    nhanh chóng, ổn định và an toàn tuyệt đối.
                </p>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-lg-4">
                <div class="service-box text-center px-4 py-5 reveal">
                    <div class="service-box-content p-3">
                        <div class="service-icon mx-auto mb-4">
                            <i class="text-primary" data-feather="zap"></i>
                        </div>
                        <h4 class="mb-3" data-i18n="landing.index.service_speed_title">Tốc độ cao, ổn định</h4>
                        <p class="text-muted mb-0" data-i18n="landing.index.service_speed_desc">
                            Trải nghiệm tốc độ truy cập như đang ở nước ngoài,
                            phù hợp cả mạng di động và cố định.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="service-box text-center px-4 py-5 active reveal">
                    <div class="service-box-content p-3">
                        <div class="service-icon mx-auto mb-4">
                            <i data-feather="layers"></i>
                        </div>
                        <h4 class="mb-3" data-i18n="landing.index.service_multi_title">Đa nền tảng</h4>
                        <p class="mb-0" data-i18n="landing.index.service_multi_desc">
                            Hỗ trợ macOS, iOS, Android, Windows và Linux với
                            thiết lập cực kỳ đơn giản.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="service-box text-center px-4 py-5 reveal">
                    <div class="service-box-content p-3">
                        <div class="service-icon mx-auto mb-4">
                            <i class="text-primary" data-feather="globe"></i>
                        </div>
                        <h4 class="mb-3" data-i18n="landing.index.service_global_title">Mạng lưới toàn cầu</h4>
                        <p class="text-muted mb-0" data-i18n="landing.index.service_global_desc">
                            Kết nối đến IXP trên toàn thế giới, truy cập
                            nhanh hơn đến mọi nhà cung cấp nội dung.
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
<!-- End Services -->


<!-- ============================================================
     FEATURES
     ============================================================ -->
<section class="section bg-light" id="features">
    <div class="container">

        <!-- Feature 1: Multi-platform -->
        <div class="row align-items-center mb-5">
            <div class="col-md-5 order-2 order-md-1 mt-md-0 mt-5 reveal">
                <span class="badge badge-pill badge-primary-custom mb-4" data-i18n="landing.index.feat_multi_badge">ĐA THIẾT BỊ & NỀN TẢNG</span>
                <h2 class="mb-4 fw-bold" data-i18n-html="landing.index.feat_multi_title">
                    Sử dụng trên thiết bị yêu thích của bạn,<br>dù là điện thoại hay máy tính.
                </h2>
                <p class="text-muted mb-4" data-i18n="landing.index.feat_multi_desc">
                    Dịch vụ {$config['appName']} hoạt động trên macOS, iOS, Android, Windows và Linux.
                    Thông qua ứng dụng bên thứ ba, có thể dùng trên điện thoại, máy tính, router,
                    TV Box và máy chơi game.
                </p>
                <a href="/auth/register" class="btn btn-primary btn-lg rounded-pill px-4">
                    <span data-i18n="landing.index.learn_more">Tìm hiểu thêm</span> <i class="fas fa-arrow-right ms-2"></i>
                </a>
            </div>

            <div class="col-md-6 ms-md-auto order-1 order-md-2 reveal">
                <div class="ms-md-4 features-img">
                    <div class="platform-visual">
                        <div class="platform-icons-grid">
                            <div class="platform-icon-item">
                                <i class="fab fa-windows"></i>
                                <span>Windows</span>
                            </div>
                            <div class="platform-icon-item">
                                <i class="fab fa-apple"></i>
                                <span>macOS</span>
                            </div>
                            <div class="platform-icon-item">
                                <i class="fab fa-android"></i>
                                <span>Android</span>
                            </div>
                            <div class="platform-icon-item">
                                <i class="fas fa-mobile-alt"></i>
                                <span>iOS</span>
                            </div>
                            <div class="platform-icon-item">
                                <i class="fab fa-linux"></i>
                                <span>Linux</span>
                            </div>
                            <div class="platform-icon-item">
                                <i class="fas fa-tv"></i>
                                <span>TV Box</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Feature 2: Streaming unlock -->
        <div class="row align-items-center pt-4">
            <div class="col-md-6 reveal">
                <div class="me-md-4 features-img">
                    <div class="streaming-visual">
                        <div class="streaming-icons-grid">
                            <div class="streaming-icon">Netflix</div>
                            <div class="streaming-icon">Hulu</div>
                            <div class="streaming-icon">HBO</div>
                            <div class="streaming-icon">Disney+</div>
                            <div class="streaming-icon">Spotify</div>
                            <div class="streaming-icon">YouTube</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-5 ms-md-auto reveal">
                <span class="badge badge-pill badge-primary-custom mb-4" data-i18n="landing.index.feat_streaming_badge">MỞ KHÓA STREAMING</span>
                <h2 class="mb-4 fw-bold" data-i18n="landing.index.feat_streaming_title">
                    Mở khóa nội dung streaming, thưởng thức chất lượng cao không giới hạn.
                </h2>
                <p class="text-muted mb-4" data-i18n="landing.index.feat_streaming_desc">
                    Thông qua {$config['appName']}, bạn có thể xem Netflix, Hulu, HBO, Disney+,
                    nghe Spotify, Pandora và hàng chục dịch vụ streaming hàng đầu thế giới.
                </p>
                <a href="/auth/register" class="btn btn-primary btn-lg rounded-pill px-4">
                    <span data-i18n="landing.index.learn_more">Tìm hiểu thêm</span> <i class="fas fa-arrow-right ms-2"></i>
                </a>
            </div>
        </div>

    </div>
</section>
<!-- End Features -->


<!-- ============================================================
     SUPPORT CTA
     ============================================================ -->
<section class="section bg-gradient-primary">
    <div class="bg-overlay-img"></div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center reveal">
                <h1 class="text-white mb-4" data-i18n="landing.index.support_title">Hỗ trợ khách hàng 24/7</h1>
                <p class="text-white-80 mb-5 fs-5" data-i18n="landing.index.support_desc">
                    Có bất kỳ câu hỏi nào về gói dịch vụ? Nhóm tư vấn của chúng tôi luôn sẵn sàng
                    hỗ trợ bạn trong suốt vòng đời đăng ký.
                </p>
                <a href="/user/ticket" class="btn btn-lg btn-light fw-bold rounded-pill px-5">
                    <i class="fas fa-headset me-2"></i> <span data-i18n="landing.index.support_btn">Liên hệ chúng tôi</span>
                </a>
            </div>
        </div>
    </div>
</section>
<!-- End Support CTA -->


<!-- ============================================================
     PRICING
     ============================================================ -->
<section class="section" id="pricing">
    <div class="container">

        <div class="row justify-content-center mb-5">
            <div class="col-lg-7 text-center reveal">
                <h2 class="fw-bold" data-i18n="landing.index.pricing_title">Trải nghiệm xuất sắc, giá cả bất ngờ</h2>
                <p class="text-muted" data-i18n="landing.index.pricing_desc">
                    Đừng lãng phí thời gian vào việc chờ đợi. Hãy bắt đầu ngay
                    dịch vụ VPN toàn cầu của {$config['appName']}.
                </p>
            </div>
        </div>

        <div class="row">
            <div class="col-12">

                <!-- Tab switcher -->
                <div class="text-center mb-4 pricing-tab">
                    <ul class="nav nav-pills rounded-pill justify-content-center d-inline-flex shadow-sm"
                        id="pricingpills-tab" role="tablist">
                        <li class="nav-item d-inline-block">
                            <a class="nav-link rounded-pill active" id="pills-monthly-tab"
                               data-bs-toggle="pill" href="#pills-monthly" role="tab"><span data-i18n="landing.index.pricing_monthly">Hàng tháng</span></a>
                        </li>
                        <li class="nav-item d-inline-block">
                            <a class="nav-link rounded-pill" id="pills-yearly-tab"
                               data-bs-toggle="pill" href="#pills-yearly" role="tab"><span data-i18n="landing.index.pricing_yearly">Hàng năm</span></a>
                        </li>
                    </ul>
                </div>

                <div class="tab-content" id="pricingpills-tabContent">

                    <!-- Monthly -->
                    <div class="tab-pane fade show active" id="pills-monthly" role="tabpanel">
                        <div class="row g-4 mt-2">

                            <div class="col-12 col-md-4 reveal">
                                <div class="pricing shadow">
                                    <div class="pricing-title" data-i18n="landing.index.plan_basic">Gói Cơ Bản</div>
                                    <div class="pricing-padding">
                                        <div class="pricing-price">
                                            <div data-i18n="landing.index.price_basic_monthly">99.000đ</div>
                                            <div data-i18n="landing.index.per_month">mỗi tháng</div>
                                        </div>
                                        <div class="pricing-details">
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.bandwidth_100gb">100 GB băng thông</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.devices_2">2 thiết bị cùng lúc</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.support_ticket">Hỗ trợ qua ticket</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_standard">Node tiêu chuẩn quốc tế</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-times-circle text-muted"></i>
                                                <span class="pricing-item-label text-muted"><del data-i18n="landing.index.node_relay">Node chuyển tiếp nội địa</del></span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-times-circle text-muted"></i>
                                                <span class="pricing-item-label text-muted"><del data-i18n="landing.index.node_iplc">Node IPLC chuyên dụng</del></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pricing-cta">
                                        <a href="/user/shop" style="background:var(--lp-accent);color:#fff;border-radius:0 0 14px 14px;" data-i18n="landing.index.subscribe_now">
                                            Đăng ký ngay
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-md-4 reveal">
                                <div class="pricing shadow">
                                    <div class="pricing-title" data-i18n="landing.index.plan_standard">Gói Tiêu Chuẩn</div>
                                    <div class="pricing-padding">
                                        <div class="pricing-price">
                                            <div data-i18n="landing.index.price_standard_monthly">179.000đ</div>
                                            <div data-i18n="landing.index.per_month">mỗi tháng</div>
                                        </div>
                                        <div class="pricing-details">
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.bandwidth_200gb">200 GB băng thông</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.devices_4">4 thiết bị cùng lúc</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.support_247">Hỗ trợ 24/7</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_standard">Node tiêu chuẩn quốc tế</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_relay">Node chuyển tiếp nội địa</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-times-circle text-muted"></i>
                                                <span class="pricing-item-label text-muted"><del data-i18n="landing.index.node_iplc">Node IPLC chuyên dụng</del></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pricing-cta">
                                        <a href="/user/shop" style="background:var(--lp-accent);color:#fff;border-radius:0 0 14px 14px;" data-i18n="landing.index.subscribe_now">
                                            Đăng ký ngay
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-md-4 reveal">
                                <div class="pricing shadow">
                                    <div class="pricing-title" data-i18n="landing.index.plan_premium">Gói Premium</div>
                                    <div class="pricing-padding">
                                        <div class="pricing-price">
                                            <div data-i18n="landing.index.price_premium_monthly">299.000đ</div>
                                            <div data-i18n="landing.index.per_month">mỗi tháng</div>
                                        </div>
                                        <div class="pricing-details">
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.bandwidth_500gb">500 GB băng thông</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.devices_8">8 thiết bị cùng lúc</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.support_247_priority">Hỗ trợ 24/7 ưu tiên</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_standard">Node tiêu chuẩn quốc tế</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_relay">Node chuyển tiếp nội địa</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_iplc">Node IPLC chuyên dụng</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pricing-cta">
                                        <a href="/user/shop" style="background:var(--lp-accent);color:#fff;border-radius:0 0 14px 14px;" data-i18n="landing.index.subscribe_now">
                                            Đăng ký ngay
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- End monthly -->

                    <!-- Yearly -->
                    <div class="tab-pane fade" id="pills-yearly" role="tabpanel">
                        <div class="row g-4 mt-2">

                            <div class="col-12 col-md-4">
                                <div class="pricing shadow">
                                    <div class="pricing-title" data-i18n="landing.index.plan_basic">Gói Cơ Bản</div>
                                    <div class="pricing-padding">
                                        <div class="pricing-price">
                                            <div data-i18n="landing.index.price_basic_yearly">990.000đ</div>
                                            <div><span data-i18n="landing.index.per_year">mỗi năm</span> <small class="text-success fw-bold">(<span data-i18n="landing.index.save_2_months">Tiết kiệm 2 tháng</span>)</small></div>
                                        </div>
                                        <div class="pricing-details">
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.bandwidth_100gb_monthly">100 GB băng thông / tháng</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.devices_2">2 thiết bị cùng lúc</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.support_ticket">Hỗ trợ qua ticket</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_standard">Node tiêu chuẩn quốc tế</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-times-circle text-muted"></i>
                                                <span class="pricing-item-label text-muted"><del data-i18n="landing.index.node_relay">Node chuyển tiếp nội địa</del></span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-times-circle text-muted"></i>
                                                <span class="pricing-item-label text-muted"><del data-i18n="landing.index.node_iplc">Node IPLC chuyên dụng</del></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pricing-cta">
                                        <a href="/user/shop" style="background:var(--lp-accent);color:#fff;border-radius:0 0 14px 14px;" data-i18n="landing.index.subscribe_now">
                                            Đăng ký ngay
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-md-4">
                                <div class="pricing shadow">
                                    <div class="pricing-title" data-i18n="landing.index.plan_standard">Gói Tiêu Chuẩn</div>
                                    <div class="pricing-padding">
                                        <div class="pricing-price">
                                            <div data-i18n="landing.index.price_standard_yearly">1.790.000đ</div>
                                            <div><span data-i18n="landing.index.per_year">mỗi năm</span> <small class="text-success fw-bold">(<span data-i18n="landing.index.save_2_months">Tiết kiệm 2 tháng</span>)</small></div>
                                        </div>
                                        <div class="pricing-details">
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.bandwidth_200gb_monthly">200 GB băng thông / tháng</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.devices_4">4 thiết bị cùng lúc</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.support_247">Hỗ trợ 24/7</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_standard">Node tiêu chuẩn quốc tế</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_relay">Node chuyển tiếp nội địa</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-times-circle text-muted"></i>
                                                <span class="pricing-item-label text-muted"><del data-i18n="landing.index.node_iplc">Node IPLC chuyên dụng</del></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pricing-cta">
                                        <a href="/user/shop" style="background:var(--lp-accent);color:#fff;border-radius:0 0 14px 14px;" data-i18n="landing.index.subscribe_now">
                                            Đăng ký ngay
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-md-4">
                                <div class="pricing shadow">
                                    <div class="pricing-title" data-i18n="landing.index.plan_premium">Gói Premium</div>
                                    <div class="pricing-padding">
                                        <div class="pricing-price">
                                            <div data-i18n="landing.index.price_premium_yearly">2.990.000đ</div>
                                            <div><span data-i18n="landing.index.per_year">mỗi năm</span> <small class="text-success fw-bold">(<span data-i18n="landing.index.save_2_months">Tiết kiệm 2 tháng</span>)</small></div>
                                        </div>
                                        <div class="pricing-details">
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.bandwidth_500gb_monthly">500 GB băng thông / tháng</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.devices_8">8 thiết bị cùng lúc</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.support_247_priority">Hỗ trợ 24/7 ưu tiên</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_standard">Node tiêu chuẩn quốc tế</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_relay">Node chuyển tiếp nội địa</span>
                                            </div>
                                            <div class="pricing-item">
                                                <i class="fas fa-check-circle" style="color:var(--lp-accent)"></i>
                                                <span class="pricing-item-label" data-i18n="landing.index.node_iplc">Node IPLC chuyên dụng</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pricing-cta">
                                        <a href="/user/shop" style="background:var(--lp-accent);color:#fff;border-radius:0 0 14px 14px;" data-i18n="landing.index.subscribe_now">
                                            Đăng ký ngay
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- End yearly -->

                </div>
            </div>
        </div>

    </div>
</section>
<!-- End Pricing -->


<!-- ============================================================
     FOOTER
     ============================================================ -->
<footer class="footer">
    <div class="container">
        <div class="row">

            <!-- Brand column -->
            <div class="col-lg-5 mb-4">
                <a href="#">
                    <img src="/assets/images/landing/logo-w.svg" alt="{$config['appName']}" height="40">
                </a>
                <p class="text-white-50 mt-4" style="font-size:.95rem;line-height:1.75;" data-i18n="landing.footer.description">
                    Cam kết cung cấp dịch vụ relay mạng tốc độ cao, ổn định và giá cả hợp lý.
                    Trải nghiệm như đang ở nước ngoài, phù hợp mọi thiết bị và mạng của bạn.
                </p>
                <p class="mb-0" style="font-size:.8rem;color:rgba(255,255,255,.25);">
                    Powered by <a href="/staff" class="footer-link" target="_blank">SSPanel</a>
                    &nbsp;©&nbsp;{$smarty.now|date_format:"%Y"} {$config['appName']}
                </p>
            </div>

            <!-- Links columns -->
            <div class="col-lg-7 d-none d-lg-block">
                <div class="row">
                    <div class="col-lg-4 col-6"></div>
                    <div class="col-lg-4 col-6">
                        <div class="mt-4">
                            <h5 class="text-white mb-3" data-i18n="landing.footer.home_title">Trang chủ</h5>
                            <ul class="footer-sub-menu">
                                <li><a href="/user/shop"    class="footer-link" data-i18n="landing.footer.shop">Cửa hàng</a></li>
                                <li><a href="/auth/register" class="footer-link" data-i18n="landing.footer.register">Đăng ký</a></li>
                                <li><a href="/auth/login"   class="footer-link" data-i18n="landing.footer.login">Đăng nhập</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-6">
                        <div class="mt-4">
                            <h5 class="text-white mb-3" data-i18n="landing.footer.support_title">Hỗ trợ</h5>
                            <ul class="footer-sub-menu">
                                <li><a href="/user/ticket"  class="footer-link" data-i18n="landing.footer.contact">Liên hệ</a></li>
                                <li><a href="/tos"          class="footer-link" data-i18n="landing.footer.tos">Điều khoản</a></li>
                                <li><a href="/staff"        class="footer-link" data-i18n="landing.footer.staff">Staff</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <hr style="border-color:rgba(255,255,255,.08);margin:32px 0 20px;">

        <div class="row">
            <div class="col text-center">
                <p class="mb-0" style="font-size:.82rem;color:rgba(255,255,255,.3);">
                    &copy; {$smarty.now|date_format:"%Y"} {$config['appName']}. <span data-i18n="landing.footer.rights">All rights reserved.</span>
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- End Footer -->


<!-- ============================================================
     JAVASCRIPT
     ============================================================ -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/feather-icons@4.29.2/dist/feather.min.js"></script>
<script>
    feather.replace();

    /* Navbar: transparent → solid on scroll */
    (function () {
        var navbar = document.getElementById('navbar');
        function onScroll() {
            if (window.scrollY > 50) {
                navbar.classList.add('navbar-scrolled');
            } else {
                navbar.classList.remove('navbar-scrolled');
            }
        }
        window.addEventListener('scroll', onScroll, { passive: true });
        onScroll();
    })();

    /* Smooth scroll for anchor links */
    document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
        anchor.addEventListener('click', function (e) {
            var href = this.getAttribute('href');
            if (href === '#') return;
            e.preventDefault();
            var target = document.querySelector(href);
            if (target) {
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                /* Close mobile navbar if open */
                var collapse = document.getElementById('navbarCollapse');
                if (collapse.classList.contains('show')) {
                    bootstrap.Collapse.getOrCreateInstance(collapse).hide();
                }
            }
        });
    });

    /* Scroll reveal animation */
    (function () {
        var elements = document.querySelectorAll('.reveal');
        var observer = new IntersectionObserver(function (entries) {
            entries.forEach(function (entry) {
                if (entry.isIntersecting) {
                    entry.target.classList.add('revealed');
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.12 });
        elements.forEach(function (el) { observer.observe(el); });
    })();

    /* Language switcher */
    (function () {
        var langLabels = { en_US: "EN", zh_CN: "CN", zh_TW: "TW", ja_JP: "JP", vn_VN: "VI" };
        var labelEl = document.getElementById('lang-label');
        var currentLocale = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'vn_VN';
        if (labelEl) labelEl.textContent = langLabels[currentLocale] || 'VI';

        document.querySelectorAll('.lang-option').forEach(function (el) {
            if (el.getAttribute('data-lang') === currentLocale) {
                el.classList.add('active');
            }
            el.addEventListener('click', function (e) {
                e.preventDefault();
                var lang = this.getAttribute('data-lang');
                if (window.sspanelI18n) {
                    window.sspanelI18n.setLocale(lang);
                }
                if (labelEl) labelEl.textContent = langLabels[lang] || lang;
                document.querySelectorAll('.lang-option').forEach(function (a) {
                    a.classList.remove('active');
                });
                this.classList.add('active');
            });
        });
    })();
</script>

</body>
</html>
{/if}
