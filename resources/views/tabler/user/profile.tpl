{include file='user/header.tpl'}

<link href="/assets/css/user/profile.css{asset_ver path="/assets/css/user/profile.css"}" rel="stylesheet"/>

<!-- Profile page locale files -->
<script src="/assets/js/locales/user/profile/en_US.js{asset_ver path="/assets/js/locales/user/profile/en_US.js"}"></script>
<script src="/assets/js/locales/user/profile/vn_VN.js{asset_ver path="/assets/js/locales/user/profile/vn_VN.js"}"></script>
<script src="/assets/js/locales/user/profile/zh_CN.js{asset_ver path="/assets/js/locales/user/profile/zh_CN.js"}"></script>
<script src="/assets/js/locales/user/profile/zh_TW.js{asset_ver path="/assets/js/locales/user/profile/zh_TW.js"}"></script>
<script src="/assets/js/locales/user/profile/ja_JP.js{asset_ver path="/assets/js/locales/user/profile/ja_JP.js"}"></script>

<div class="ev-profile-page">

    <!-- ── Page Header ── -->
    <div class="ev-profile-header">
        <h1 class="ev-profile-header__title" data-i18n-user-profile="page_title">Thông tin tài khoản</h1>
        <p class="ev-profile-header__subtitle" data-i18n-user-profile="page_subtitle">Quản lý thông tin tài khoản cốt lõi, theo dõi các phiên hoạt động và xem lại các sự kiện bảo mật gần đây từ bảng điều khiển tập trung.</p>
    </div>

    <!-- ── Upper Grid: Identity Details + Active Connections ── -->
    <div class="ev-upper-grid">
        <!-- Identity Details Card -->
        <div class="ev-identity-card">
            <div class="ev-identity-header">
                <div class="ev-identity-icon">
                    <span class="material-symbols-outlined">account_circle</span>
                </div>
                <h3 class="ev-identity-title" data-i18n-user-profile="identity_title">Thông tin danh tính</h3>
            </div>
            <div class="ev-identity-body">
                <div class="ev-identity-field">
                    <span class="material-symbols-outlined">alternate_email</span>
                    <div class="ev-identity-field-content">
                        <p class="ev-identity-field-label" data-i18n-user-profile="label_username">Username</p>
                        <p class="ev-identity-field-value">{$user->user_name}</p>
                    </div>
                </div>
                <div class="ev-identity-field">
                    <span class="material-symbols-outlined">mail</span>
                    <div class="ev-identity-field-content">
                        <p class="ev-identity-field-label" data-i18n-user-profile="label_email">Email Address</p>
                        <p class="ev-identity-field-value">{$user->email}</p>
                    </div>
                </div>
                <div class="ev-identity-grid">
                    <div class="ev-identity-grid-item">
                        <p class="ev-identity-field-label" data-i18n-user-profile="label_registered">Registered</p>
                        <p class="ev-identity-field-value">{$user->reg_date}</p>
                    </div>
                    <div class="ev-identity-grid-item">
                        <p class="ev-identity-field-label" data-i18n-user-profile="label_total_usage">Total Usage</p>
                        <p class="ev-identity-field-value">{$user->totalTraffic()}</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Active Node Connections Card -->
        <div class="ev-connections-card">
            <div class="ev-connections-header">
                <div class="ev-connections-header-left">
                    <div class="ev-connections-icon">
                        <span class="material-symbols-outlined">sensors</span>
                    </div>
                    <div class="ev-connections-title-group">
                        <h3 data-i18n-user-profile="connections_title">Kết nối node đang hoạt động</h3>
                        <p data-i18n-user-profile="connections_subtitle">Theo dõi thời gian thực các phiên hiện tại đang hoạt động</p>
                    </div>
                </div>
                <div class="ev-live-badge">
                    <span class="ev-live-badge-dot"></span>
                    <span class="ev-live-badge-text" data-i18n-user-profile="live_status">Live Status</span>
                </div>
            </div>
            <div class="ev-connections-table-wrapper">
                <table class="ev-connections-table">
                    <thead>
                        <tr>
                            <th data-i18n-user-profile="th_ip_address">IP Address</th>
                            <th data-i18n-user-profile="th_location">Location</th>
                            <th data-i18n-user-profile="th_node_name">Node Name</th>
                            <th data-i18n-user-profile="th_last_active">Last Active</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $ips as $ip}
                        <tr>
                            <td>{$ip->ip}</td>
                            <td>
                                <div class="ev-connections-location">
                                    <span class="material-symbols-outlined">public</span>
                                    <span>{$ip->location}</span>
                                </div>
                            </td>
                            <td>
                                <span class="ev-node-badge">{$ip->node_name}</span>
                            </td>
                            <td class="ev-time-just-now">{$ip->last_time}</td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    {if $public_setting['subscribe_log']}
    <!-- ── Security Audit: Subscribe Log ── -->
    <div class="ev-table-section">
        <div class="ev-audit-card">
            <div class="ev-audit-header">
                <div class="ev-audit-header-left">
                    <div class="ev-audit-icon">
                        <span class="material-symbols-outlined">link</span>
                    </div>
                    <div class="ev-audit-title-group">
                        <h3 data-i18n-user-profile="subscribe_title">Nhật ký đăng ký: Lịch sử truy cập</h3>
                        <p data-i18n-user-profile="subscribe_subtitle">10 sự kiện truy cập đăng ký gần nhất được ghi lại</p>
                    </div>
                </div>
            </div>
            <div class="ev-audit-table-wrapper">
                <table class="ev-audit-table">
                    <thead>
                        <tr>
                            <th data-i18n-user-profile="th_sub_type">Loại</th>
                            <th data-i18n-user-profile="th_sub_ua">User Agent</th>
                            <th data-i18n-user-profile="th_sub_ip">Network IP</th>
                            <th data-i18n-user-profile="th_sub_location">Thông tin vị trí địa lý</th>
                            <th data-i18n-user-profile="th_sub_time">Timestamp</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $subs as $sub}
                        <tr>
                            <td>{$sub->type}</td>
                            <td>{$sub->request_user_agent}</td>
                            <td>{$sub->request_ip}</td>
                            <td>
                                <div class="ev-location-indicator">
                                    <span class="ev-location-dot"></span>
                                    {$sub->location}
                                </div>
                            </td>
                            <td>{$sub->request_time}</td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    {/if}

    {if $public_setting['login_log']}
    <!-- ── Security Audit: Successful Logins ── -->
    <div class="ev-table-section">
        <div class="ev-audit-card">
            <div class="ev-audit-header">
                <div class="ev-audit-header-left">
                    <div class="ev-audit-icon">
                        <span class="material-symbols-outlined">verified_user</span>
                    </div>
                    <div class="ev-audit-title-group">
                        <h3 data-i18n-user-profile="login_title">Kiểm tra bảo mật: Đăng nhập thành công</h3>
                        <p data-i18n-user-profile="login_subtitle">10 sự kiện xác thực thành công gần nhất được ghi lại</p>
                    </div>
                </div>
            </div>
            <div class="ev-audit-table-wrapper">
                <table class="ev-audit-table">
                    <thead>
                        <tr>
                            <th data-i18n-user-profile="th_login_ip">Network IP</th>
                            <th data-i18n-user-profile="th_login_location">Thông tin vị trí địa lý</th>
                            <th data-i18n-user-profile="th_login_time">Timestamp</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $logins as $login}
                        <tr>
                            <td>{$login->ip}</td>
                            <td>
                                <div class="ev-location-indicator">
                                    <span class="ev-location-dot"></span>
                                    {$login->location}
                                </div>
                            </td>
                            <td>{$login->datetime}</td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    {/if}

</div>

{include file='user/footer.tpl'}
