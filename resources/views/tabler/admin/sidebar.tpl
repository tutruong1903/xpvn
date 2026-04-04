<!-- Mobile overlay -->
<div class="sidebar-overlay" id="sidebar-overlay"></div>

<nav class="sidebar-custom" id="sidebar">
    <!-- Brand -->
    <div class="sidebar-brand">
        <a href="/admin" class="sidebar-logo-link">
            <img src="/images/uim-logo-round_48x48.png" alt="Logo" style="filter:none;">
        </a>
        <div class="sidebar-admin-switch">
            <label class="sidebar-admin-toggle mb-0" for="admin-panel-switch">
                <input class="sidebar-admin-input" type="checkbox" id="admin-panel-switch" checked>
                <span class="sidebar-admin-track">
                    <span class="sidebar-admin-knob" aria-hidden="true"></span>
                    <span class="sidebar-admin-caption sidebar-admin-caption--user" data-i18n="admin.side-bar.panel_switch_user">User</span>
                    <span class="sidebar-admin-caption sidebar-admin-caption--admin" data-i18n="admin.side-bar.panel_switch_admin">Admin</span>
                </span>
            </label>
        </div>
    </div>

    <!-- Navigation -->
    <div class="sidebar-nav">
        <!-- Dashboard -->
        <div class="sidebar-section-label" data-i18n="admin.side-bar.overview.title">概况</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin" data-path="/admin">
                    <span class="nav-link-icon"><i class="ti ti-dashboard"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.overview.dashboard">仪表盘</span>
                </a>
            </li>
        </ul>

        <!-- Management -->
        <div class="sidebar-section-label" data-i18n="admin.side-bar.management.title">管理</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/user" data-path="/admin/user">
                    <span class="nav-link-icon"><i class="ti ti-users"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.management.users">用户</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/node" data-path="/admin/node">
                    <span class="nav-link-icon"><i class="ti ti-server-2"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.management.nodes">节点</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/system" data-path="/admin/system">
                    <span class="nav-link-icon"><i class="ti ti-tool"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.management.system">系统</span>
                </a>
            </li>
        </ul>

        <!-- Settings -->
        <div class="sidebar-section-label" data-i18n="admin.side-bar.settings.title">设置</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/setting/billing" data-path="/admin/setting/billing">
                    <span class="nav-link-icon"><i class="ti ti-cash"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.settings.billing">财务</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/setting/email" data-path="/admin/setting/email">
                    <span class="nav-link-icon"><i class="ti ti-mail"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.settings.email">邮件</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/setting/support" data-path="/admin/setting/support">
                    <span class="nav-link-icon"><i class="ti ti-headset"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.settings.support">客服</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/setting/captcha" data-path="/admin/setting/captcha">
                    <span class="nav-link-icon"><i class="ti ti-shield-check"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.settings.captcha">验证</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/setting/reg" data-path="/admin/setting/reg">
                    <span class="nav-link-icon"><i class="ti ti-user-plus"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.settings.registration">注册</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/setting/ref" data-path="/admin/setting/ref">
                    <span class="nav-link-icon"><i class="ti ti-share"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.settings.referral">邀请</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/setting/im" data-path="/admin/setting/im">
                    <span class="nav-link-icon"><i class="ti ti-message-circle"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.settings.im">IM</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/setting/sub" data-path="/admin/setting/sub">
                    <span class="nav-link-icon"><i class="ti ti-rss"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.settings.subscription">订阅</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/setting/cron" data-path="/admin/setting/cron">
                    <span class="nav-link-icon"><i class="ti ti-clock"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.settings.cron">定时任务</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/setting/feature" data-path="/admin/setting/feature">
                    <span class="nav-link-icon"><i class="ti ti-adjustments"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.settings.feature">其他设置</span>
                </a>
            </li>
        </ul>

        <!-- Operations -->
        <div class="sidebar-section-label" data-i18n="admin.side-bar.operations.title">运营</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/announcement" data-path="/admin/announcement">
                    <span class="nav-link-icon"><i class="ti ti-speakerphone"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.operations.announcements">公告</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/ticket" data-path="/admin/ticket">
                    <span class="nav-link-icon"><i class="ti ti-messages"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.operations.tickets">工单</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/docs" data-path="/admin/docs">
                    <span class="nav-link-icon"><i class="ti ti-notes"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.operations.docs">文档</span>
                </a>
            </li>
        </ul>

        <!-- Finance -->
        <div class="sidebar-section-label" data-i18n="admin.side-bar.finance.title">财务</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/product" data-path="/admin/product">
                    <span class="nav-link-icon"><i class="ti ti-list-details"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.finance.products">商品</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/order" data-path="/admin/order">
                    <span class="nav-link-icon"><i class="ti ti-receipt"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.finance.orders">订单</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/invoice" data-path="/admin/invoice">
                    <span class="nav-link-icon"><i class="ti ti-file-dollar"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.finance.invoices">账单</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/coupon" data-path="/admin/coupon">
                    <span class="nav-link-icon"><i class="ti ti-ticket"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.finance.coupons">优惠码</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/giftcard" data-path="/admin/giftcard">
                    <span class="nav-link-icon"><i class="ti ti-gift"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.finance.giftcards">礼品卡</span>
                </a>
            </li>
        </ul>

        <!-- Logs -->
        <div class="sidebar-section-label" data-i18n="admin.side-bar.logs.title">日志</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/login" data-path="/admin/login">
                    <span class="nav-link-icon"><i class="ti ti-login"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.logs.login">登录</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/subscribe" data-path="/admin/subscribe">
                    <span class="nav-link-icon"><i class="ti ti-rss"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.logs.subscribe">订阅</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/payback" data-path="/admin/payback">
                    <span class="nav-link-icon"><i class="ti ti-friends"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.logs.rebate">返利</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/money" data-path="/admin/money">
                    <span class="nav-link-icon"><i class="ti ti-coin"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.logs.balance">余额</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/gateway" data-path="/admin/gateway">
                    <span class="nav-link-icon"><i class="ti ti-torii"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.logs.gateway">支付网关</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/online" data-path="/admin/online">
                    <span class="nav-link-icon"><i class="ti ti-router"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.logs.online">在线IP</span>
                </a>
            </li>
        </ul>

        <!-- Audit -->
        <div class="sidebar-section-label" data-i18n="admin.side-bar.audit.title">审计</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/detect" data-path="/admin/detect">
                    <span class="nav-link-icon"><i class="ti ti-barrier-block"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.audit.rules">规则</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/detect/log" data-path="/admin/detect/log">
                    <span class="nav-link-icon"><i class="ti ti-file-search"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.audit.collision">碰撞记录</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/admin/detect/ban" data-path="/admin/detect/ban">
                    <span class="nav-link-icon"><i class="ti ti-ban"></i></span>
                    <span class="nav-link-title" data-i18n="admin.side-bar.audit.ban">封禁记录</span>
                </a>
            </li>
        </ul>
    </div>
</nav>
