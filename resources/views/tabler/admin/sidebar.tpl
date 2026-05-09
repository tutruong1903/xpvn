<!-- Mobile overlay -->
<div class="sidebar-luminous-overlay" id="sidebar-overlay"></div>

<!-- Luminous Guardian Admin Sidebar -->
<aside class="sidebar-luminous" id="sidebar">
    <!-- Brand Area -->
    <div class="sidebar-luminous__brand">
        <!-- Logo -->
        <div class="sidebar-luminous__logo">
            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">admin_panel_settings</span>
        </div>
        
        <!-- Brand Text -->
        <div class="sidebar-luminous__brand-text">
            <h2 class="sidebar-luminous__brand-title" data-i18n="admin.side-bar.brand_title">Quản trị</h2>
        </div>
        
        <!-- Admin/User Switch -->
        <div class="sidebar-luminous__switch">
            <div class="sidebar-switch">
                <button class="sidebar-switch__option" id="switch-user" data-mode="user">
                    <span data-i18n="admin.side-bar.panel_switch_user">User</span>
                </button>
                <button class="sidebar-switch__option sidebar-switch__option--active" id="switch-admin" data-mode="admin">
                    <span data-i18n="admin.side-bar.panel_switch_admin">Admin</span>
                </button>
            </div>
        </div>
    </div>

    <!-- Navigation -->
    <nav class="sidebar-luminous__nav">
        <!-- Dashboard - Top Level -->
        <a class="sidebar-nav-link" href="/admin" data-path="/admin" id="nav-dashboard">
            <span class="material-symbols-outlined sidebar-nav-link__icon">dashboard</span>
            <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.overview.dashboard">Bảng điều khiển</span>
        </a>
        
        <!-- Section: Management -->
        <div class="sidebar-nav-section">
            <div class="sidebar-nav-section__header">
                <span data-i18n="admin.side-bar.management.title">QUẢN LÝ</span>
            </div>
            
            <a class="sidebar-nav-link" href="/admin/user" data-path="/admin/user">
                <span class="material-symbols-outlined sidebar-nav-link__icon">group</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.management.users">Người dùng</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/node" data-path="/admin/node">
                <span class="material-symbols-outlined sidebar-nav-link__icon">dns</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.management.nodes">Node</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/system" data-path="/admin/system">
                <span class="material-symbols-outlined sidebar-nav-link__icon">settings</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.management.system">Hệ thống</span>
            </a>
        </div>

        <!-- Section: Settings -->
        <div class="sidebar-nav-section">
            <div class="sidebar-nav-section__header">
                <span data-i18n="admin.side-bar.settings.title">CÀI ĐẶT</span>
            </div>
            
            <a class="sidebar-nav-link" href="/admin/setting/billing" data-path="/admin/setting/billing">
                <span class="material-symbols-outlined sidebar-nav-link__icon">payments</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.billing">Tài chính</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/setting/email" data-path="/admin/setting/email">
                <span class="material-symbols-outlined sidebar-nav-link__icon">mail</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.email">Email</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/setting/support" data-path="/admin/setting/support">
                <span class="material-symbols-outlined sidebar-nav-link__icon">support_agent</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.support">Hỗ trợ</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/setting/captcha" data-path="/admin/setting/captcha">
                <span class="material-symbols-outlined sidebar-nav-link__icon">verified_user</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.captcha">Captcha</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/setting/reg" data-path="/admin/setting/reg">
                <span class="material-symbols-outlined sidebar-nav-link__icon">person_add</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.registration">Đăng ký</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/setting/ref" data-path="/admin/setting/ref">
                <span class="material-symbols-outlined sidebar-nav-link__icon">share</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.referral">Giới thiệu</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/setting/im" data-path="/admin/setting/im">
                <span class="material-symbols-outlined sidebar-nav-link__icon">chat</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.im">IM</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/setting/sub" data-path="/admin/setting/sub">
                <span class="material-symbols-outlined sidebar-nav-link__icon">rss_feed</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.subscription">Đăng ký</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/setting/cron" data-path="/admin/setting/cron">
                <span class="material-symbols-outlined sidebar-nav-link__icon">schedule</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.cron">Định thời</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/setting/feature" data-path="/admin/setting/feature">
                <span class="material-symbols-outlined sidebar-nav-link__icon">tune</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.feature">Cài đặt khác</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/setting/llm" data-path="/admin/setting/llm">
                <span class="material-symbols-outlined sidebar-nav-link__icon">smart_toy</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.settings.llm">AI / LLM</span>
            </a>
        </div>

        <!-- Section: Operations -->
        <div class="sidebar-nav-section">
            <div class="sidebar-nav-section__header">
                <span data-i18n="admin.side-bar.operations.title">VẬN HÀNH</span>
            </div>
            
            <a class="sidebar-nav-link" href="/admin/announcement" data-path="/admin/announcement">
                <span class="material-symbols-outlined sidebar-nav-link__icon">campaign</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.operations.announcements">Thông báo</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/ticket" data-path="/admin/ticket">
                <span class="material-symbols-outlined sidebar-nav-link__icon">confirmation_number</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.operations.tickets">Ticket</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/docs" data-path="/admin/docs">
                <span class="material-symbols-outlined sidebar-nav-link__icon">description</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.operations.docs">Tài liệu</span>
            </a>
        </div>

        <!-- Section: Finance -->
        <div class="sidebar-nav-section">
            <div class="sidebar-nav-section__header">
                <span data-i18n="admin.side-bar.finance.title">TÀI CHÍNH</span>
            </div>
            
            <a class="sidebar-nav-link" href="/admin/product" data-path="/admin/product">
                <span class="material-symbols-outlined sidebar-nav-link__icon">inventory_2</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.finance.products">Sản phẩm</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/order" data-path="/admin/order">
                <span class="material-symbols-outlined sidebar-nav-link__icon">receipt_long</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.finance.orders">Đơn hàng</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/invoice" data-path="/admin/invoice">
                <span class="material-symbols-outlined sidebar-nav-link__icon">receipt</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.finance.invoices">Hóa đơn</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/coupon" data-path="/admin/coupon">
                <span class="material-symbols-outlined sidebar-nav-link__icon">local_offer</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.finance.coupons">Mã giảm giá</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/giftcard" data-path="/admin/giftcard">
                <span class="material-symbols-outlined sidebar-nav-link__icon">card_giftcard</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.finance.giftcards">Thẻ quà tặng</span>
            </a>
        </div>

        <!-- Section: Logs -->
        <div class="sidebar-nav-section">
            <div class="sidebar-nav-section__header">
                <span data-i18n="admin.side-bar.logs.title">NHẬT KÝ</span>
            </div>
            
            <a class="sidebar-nav-link" href="/admin/login" data-path="/admin/login">
                <span class="material-symbols-outlined sidebar-nav-link__icon">login</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.logs.login">Đăng nhập</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/subscribe" data-path="/admin/subscribe">
                <span class="material-symbols-outlined sidebar-nav-link__icon">rss_feed</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.logs.subscribe">Đăng ký</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/payback" data-path="/admin/payback">
                <span class="material-symbols-outlined sidebar-nav-link__icon">volunteer_activism</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.logs.rebate">Hoàn tiền</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/money" data-path="/admin/money">
                <span class="material-symbols-outlined sidebar-nav-link__icon">account_balance_wallet</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.logs.balance">Số dư</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/gateway" data-path="/admin/gateway">
                <span class="material-symbols-outlined sidebar-nav-link__icon">savings</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.logs.gateway">Cổng thanh toán</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/online" data-path="/admin/online">
                <span class="material-symbols-outlined sidebar-nav-link__icon">wifi</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.logs.online">IP trực tuyến</span>
            </a>
        </div>

        <!-- Section: Audit -->
        <div class="sidebar-nav-section">
            <div class="sidebar-nav-section__header">
                <span data-i18n="admin.side-bar.audit.title">KIỂM DUYỆT</span>
            </div>
            
            <a class="sidebar-nav-link" href="/admin/detect" data-path="/admin/detect">
                <span class="material-symbols-outlined sidebar-nav-link__icon">policy</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.audit.rules">Quy tắc</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/detect/log" data-path="/admin/detect/log">
                <span class="material-symbols-outlined sidebar-nav-link__icon">article</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.audit.collision">Lịch sử vi phạm</span>
            </a>
            
            <a class="sidebar-nav-link" href="/admin/detect/ban" data-path="/admin/detect/ban">
                <span class="material-symbols-outlined sidebar-nav-link__icon">block</span>
                <span class="sidebar-nav-link__title" data-i18n="admin.side-bar.audit.ban">Danh sách chặn</span>
            </a>
        </div>
    </nav>
</aside>

<script>
(function() {
    'use strict';

    const sidebar = document.getElementById('sidebar');
    const overlay = document.getElementById('sidebar-overlay');
    const toggleBtn = document.getElementById('sidebar-toggle');

    // Mobile sidebar toggle
    if (toggleBtn) {
        toggleBtn.addEventListener('click', function() {
            const isMobile = window.innerWidth < 992;
            if (isMobile) {
                sidebar.classList.toggle('sidebar-luminous--mobile-open');
                overlay.classList.toggle('sidebar-luminous-overlay--active');
            }
        });
    }

    // Close sidebar on overlay click (mobile)
    if (overlay) {
        overlay.addEventListener('click', function() {
            sidebar.classList.remove('sidebar-luminous--mobile-open');
            overlay.classList.remove('sidebar-luminous-overlay--active');
        });
    }

    // Admin/User switch
    const switchUser = document.getElementById('switch-user');
    const switchAdmin = document.getElementById('switch-admin');

    if (switchUser && switchAdmin) {
        switchUser.addEventListener('click', function() {
            window.location.href = '/user';
        });
    }

    // Active link highlighting
    const currentPath = window.location.pathname.replace(/\/$/, '') || '/admin';
    const navLinks = document.querySelectorAll('.sidebar-nav-link[data-path]');

    let bestMatch = null;
    let bestLen = 0;

    navLinks.forEach(function(link) {
        const linkPath = link.getAttribute('data-path');
        if (currentPath === linkPath || (currentPath.indexOf(linkPath) === 0 && linkPath.length > bestLen)) {
            bestMatch = link;
            bestLen = linkPath.length;
        }
    });

    if (bestMatch) {
        bestMatch.classList.add('sidebar-nav-link--active');
    }
})();
</script>
