<!-- Mobile overlay -->
<div class="sidebar-luminous-overlay" id="sidebar-overlay"></div>

<!-- Luminous Guardian Sidebar -->
<aside class="sidebar-luminous" id="sidebar">
    <!-- Brand Area -->
    <div class="sidebar-luminous__brand">
        <!-- Logo -->
        <div class="sidebar-luminous__logo">
            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">security</span>
        </div>
        
        <!-- Brand Text -->
        <div class="sidebar-luminous__brand-text">
            <h2 class="sidebar-luminous__brand-title" data-i18n-user-sidebar="brand_title">Của tôi</h2>
        </div>
        
        <!-- Admin/User Switch -->
        {if $user->is_admin}
        <div class="sidebar-luminous__switch">
            <div class="sidebar-switch">
                <button class="sidebar-switch__option sidebar-switch__option--active" id="switch-user" data-mode="user">
                    <span data-i18n-user-sidebar="panel_switch_user">User</span>
                </button>
                <button class="sidebar-switch__option" id="switch-admin" data-mode="admin">
                    <span data-i18n-user-sidebar="panel_switch_admin">Admin</span>
                </button>
            </div>
        </div>
        {/if}
    </div>

    <!-- Navigation -->
    <nav class="sidebar-luminous__nav">
        <!-- Home - Top Level -->
        <a class="sidebar-nav-link" href="/user" data-path="/user" id="nav-home">
            <span class="material-symbols-outlined sidebar-nav-link__icon">home</span>
            <span class="sidebar-nav-link__title" data-i18n-user-sidebar="home">Trang chủ</span>
        </a>
        
        <!-- Section: My Account -->
        <div class="sidebar-nav-section">
            <div class="sidebar-nav-section__header">
                <span data-i18n-user-sidebar="section_my_account">CỦA TÔI</span>
            </div>
            
            <a class="sidebar-nav-link" href="/user/profile" data-path="/user/profile">
                <span class="material-symbols-outlined sidebar-nav-link__icon">info</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="account_info">Thông tin tài khoản</span>
            </a>
            
            <a class="sidebar-nav-link" href="/user/edit" data-path="/user/edit">
                <span class="material-symbols-outlined sidebar-nav-link__icon">edit</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="profile_edit">Chỉnh sửa hồ sơ</span>
            </a>
            
            {if $public_setting['enable_ticket']}
            <a class="sidebar-nav-link" href="/user/ticket" data-path="/user/ticket">
                <span class="material-symbols-outlined sidebar-nav-link__icon">confirmation_number</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="tickets">Hệ thống ticket</span>
            </a>
            {/if}
            
            <a class="sidebar-nav-link" href="/user/invite" data-path="/user/invite">
                <span class="material-symbols-outlined sidebar-nav-link__icon">group_add</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="invite">Link mời</span>
            </a>
        </div>

        <!-- Section: Usage -->
        <div class="sidebar-nav-section">
            <div class="sidebar-nav-section__header">
                <span data-i18n-user-sidebar="section_usage">SỬ DỤNG</span>
            </div>
            
            <a class="sidebar-nav-link" href="/user/server" data-path="/user/server">
                <span class="material-symbols-outlined sidebar-nav-link__icon">dns</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="nodes">Danh sách node</span>
            </a>
            
            <a class="sidebar-nav-link" href="/user/rate" data-path="/user/rate">
                <span class="material-symbols-outlined sidebar-nav-link__icon">bar_chart</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="rate">Tỷ lệ lưu lượng</span>
            </a>
            
            <a class="sidebar-nav-link" href="/user/announcement" data-path="/user/announcement">
                <span class="material-symbols-outlined sidebar-nav-link__icon">campaign</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="announcement">Thông báo</span>
            </a>
            
            {if $public_setting['display_docs'] && (! $public_setting['display_docs_only_for_paid_user'] || $user->class !== 0)}
            <a class="sidebar-nav-link" href="/user/docs" data-path="/user/docs">
                <span class="material-symbols-outlined sidebar-nav-link__icon">description</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="docs">Hướng dẫn</span>
            </a>
            {/if}
        </div>

        <!-- Section: Audit -->
        <div class="sidebar-nav-section">
            <div class="sidebar-nav-section__header">
                <span data-i18n-user-sidebar="section_audit">KIỂM DUYỆT</span>
            </div>
            
            <a class="sidebar-nav-link" href="/user/detect" data-path="/user/detect">
                <span class="material-symbols-outlined sidebar-nav-link__icon">policy</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="rules">Quy tắc</span>
            </a>
            
            {if $public_setting['display_detect_log']}
            <a class="sidebar-nav-link" href="/user/detect/log" data-path="/user/detect/log">
                <span class="material-symbols-outlined sidebar-nav-link__icon">article</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="logs">Lịch sử</span>
            </a>
            {/if}
        </div>

        <!-- Section: Shop -->
        <div class="sidebar-nav-section">
            <div class="sidebar-nav-section__header">
                <span data-i18n-user-sidebar="section_shop">CỬA HÀNG</span>
            </div>
            
            <a class="sidebar-nav-link" href="/user/product" data-path="/user/product">
                <span class="material-symbols-outlined sidebar-nav-link__icon">shopping_bag</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="products">Sản phẩm</span>
            </a>
            
            <a class="sidebar-nav-link" href="/user/order" data-path="/user/order">
                <span class="material-symbols-outlined sidebar-nav-link__icon">receipt_long</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="orders">Đơn hàng</span>
            </a>
            
            <a class="sidebar-nav-link" href="/user/invoice" data-path="/user/invoice">
                <span class="material-symbols-outlined sidebar-nav-link__icon">receipt</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="invoices">Hóa đơn</span>
            </a>
            
            <a class="sidebar-nav-link" href="/user/money" data-path="/user/money">
                <span class="material-symbols-outlined sidebar-nav-link__icon">account_balance_wallet</span>
                <span class="sidebar-nav-link__title" data-i18n-user-sidebar="balance">Số dư</span>
            </a>
        </div>
    </nav>
</aside>

<script>
// Luminous Guardian Sidebar Script
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
            switchUser.classList.add('sidebar-switch__option--active');
            switchAdmin.classList.remove('sidebar-switch__option--active');
        });
        
        switchAdmin.addEventListener('click', function() {
            switchAdmin.classList.add('sidebar-switch__option--active');
            switchUser.classList.remove('sidebar-switch__option--active');
            // Redirect to admin panel
            window.location.href = '/admin';
        });
    }
    
    // Active link highlighting
    const currentPath = window.location.pathname.replace(/\/$/, '') || '/user';
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
