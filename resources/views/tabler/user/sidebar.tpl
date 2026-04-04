<!-- Mobile overlay -->
<div class="sidebar-overlay" id="sidebar-overlay"></div>

<nav class="sidebar-custom" id="sidebar">
    <!-- Brand -->
    <div class="sidebar-brand">
        <a href="/user" class="sidebar-logo-link">
            <img src="/images/uim-logo-round_48x48.png" alt="Logo" style="filter:none;">
        </a>
        {if $user->is_admin}
        <div class="sidebar-admin-switch">
            <label class="sidebar-admin-toggle mb-0" for="admin-panel-switch">
                <input class="sidebar-admin-input" type="checkbox" id="admin-panel-switch">
                <span class="sidebar-admin-track">
                    <span class="sidebar-admin-knob" aria-hidden="true"></span>
                    <span class="sidebar-admin-caption sidebar-admin-caption--user" data-i18n="user.side-bar.panel_switch_user">User</span>
                    <span class="sidebar-admin-caption sidebar-admin-caption--admin" data-i18n="user.side-bar.panel_switch_admin">Admin</span>
                </span>
            </label>
        </div>
        {/if}
    </div>

    <!-- Navigation -->
    <div class="sidebar-nav">
        <!-- Section: My Account -->
        <div class="sidebar-section-label" data-i18n="user.side-bar.menu-me.title">我的</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user" data-path="/user">
                    <span class="nav-link-icon"><i class="ti ti-home"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.home">主页</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/profile" data-path="/user/profile">
                    <span class="nav-link-icon"><i class="ti ti-info-square"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.menu-me.account">账户</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/edit" data-path="/user/edit">
                    <span class="nav-link-icon"><i class="ti ti-edit"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.menu-me.profile">资料</span>
                </a>
            </li>
            {if $public_setting['enable_ticket']}
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/ticket" data-path="/user/ticket">
                    <span class="nav-link-icon"><i class="ti ti-ticket"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.menu-me.tickets">工单</span>
                </a>
            </li>
            {/if}
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/invite" data-path="/user/invite">
                    <span class="nav-link-icon"><i class="ti ti-friends"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.menu-me.invite">邀请</span>
                </a>
            </li>
        </ul>

        <!-- Section: Usage -->
        <div class="sidebar-section-label" data-i18n="user.side-bar.usage.title">使用</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/server" data-path="/user/server">
                    <span class="nav-link-icon"><i class="ti ti-server"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.usage.nodes">节点</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/rate" data-path="/user/rate">
                    <span class="nav-link-icon"><i class="ti ti-chart-bar"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.usage.rate">流量倍率</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/announcement" data-path="/user/announcement">
                    <span class="nav-link-icon"><i class="ti ti-speakerphone"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.usage.announcement">公告</span>
                </a>
            </li>
            {if $public_setting['display_docs'] &&
            (! $public_setting['display_docs_only_for_paid_user'] || $user->class !== 0)}
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/docs" data-path="/user/docs">
                    <span class="nav-link-icon"><i class="ti ti-notes"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.usage.docs">文档</span>
                </a>
            </li>
            {/if}
        </ul>

        <!-- Section: Audit -->
        <div class="sidebar-section-label" data-i18n="user.side-bar.audit.title">审计</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/detect" data-path="/user/detect">
                    <span class="nav-link-icon"><i class="ti ti-barrier-block"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.audit.rules">规则</span>
                </a>
            </li>
            {if $public_setting['display_detect_log']}
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/detect/log" data-path="/user/detect/log">
                    <span class="nav-link-icon"><i class="ti ti-notes"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.audit.logs">日志</span>
                </a>
            </li>
            {/if}
        </ul>

        <!-- Section: Shop -->
        <div class="sidebar-section-label" data-i18n="user.side-bar.shop.title">商店</div>
        <ul class="list-unstyled mb-0">
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/product" data-path="/user/product">
                    <span class="nav-link-icon"><i class="ti ti-list"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.shop.products">商品</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/order" data-path="/user/order">
                    <span class="nav-link-icon"><i class="ti ti-file-invoice"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.shop.orders">订单</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/invoice" data-path="/user/invoice">
                    <span class="nav-link-icon"><i class="ti ti-file-dollar"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.shop.invoices">账单</span>
                </a>
            </li>
            <li class="sidebar-sub-item">
                <a class="nav-link" href="/user/money" data-path="/user/money">
                    <span class="nav-link-icon"><i class="ti ti-home-dollar"></i></span>
                    <span class="nav-link-title" data-i18n="user.side-bar.shop.balance">余额</span>
                </a>
            </li>
        </ul>
    </div>
</nav>
