{include file='user/header.tpl'}

<link href="/assets/css/user/edit.css{asset_ver path="/assets/css/user/edit.css"}" rel="stylesheet"/>

<!-- Edit page locale files -->
<script src="/assets/js/locales/user/edit/en_US.js{asset_ver path="/assets/js/locales/user/edit/en_US.js"}"></script>
<script src="/assets/js/locales/user/edit/vn_VN.js{asset_ver path="/assets/js/locales/user/edit/vn_VN.js"}"></script>
<script src="/assets/js/locales/user/edit/zh_CN.js{asset_ver path="/assets/js/locales/user/edit/zh_CN.js"}"></script>
<script src="/assets/js/locales/user/edit/zh_TW.js{asset_ver path="/assets/js/locales/user/edit/zh_TW.js"}"></script>
<script src="/assets/js/locales/user/edit/ja_JP.js{asset_ver path="/assets/js/locales/user/edit/ja_JP.js"}"></script>

<script src="//{$config['jsdelivr_url']}/npm/jquery/dist/jquery.min.js"></script>
<script src="https://unpkg.com/@simplewebauthn/browser/dist/bundle/index.umd.min.js"></script>

<div class="ev-edit-page">

    <!-- ── Page Header ── -->
    <div class="ev-edit-header">
        <h1 class="ev-edit-header__title" data-i18n-user-edit="page_title">Chỉnh sửa thông tin</h1>
        <p class="ev-edit-header__subtitle" data-i18n-user-edit="page_subtitle">Cập nhật và quản lý các thiết lập tài khoản cá nhân của bạn trên hệ thống.</p>
    </div>

    <!-- ── Tab Navigation ── -->
    <div class="ev-tabs" role="tablist">
        <button class="ev-tab-btn active"
                data-bs-toggle="tab" data-bs-target="#personal_information"
                role="tab" aria-selected="true"
                data-i18n-user-edit="tab_info">Thông tin</button>
        <button class="ev-tab-btn"
                data-bs-toggle="tab" data-bs-target="#login_security"
                role="tab" aria-selected="false"
                data-i18n-user-edit="tab_login">Đăng nhập</button>
        <button class="ev-tab-btn"
                data-bs-toggle="tab" data-bs-target="#use_safety"
                role="tab" aria-selected="false"
                data-i18n-user-edit="tab_usage">Sử dụng</button>
        <button class="ev-tab-btn"
                data-bs-toggle="tab" data-bs-target="#other_settings"
                role="tab" aria-selected="false"
                data-i18n-user-edit="tab_other">Khác</button>
    </div>

    <!-- ── Tab Content ── -->
    <div class="tab-content ev-tab-content">

        <!-- ══ Tab 1: Personal Information ══ -->
        <div class="tab-pane active show" id="personal_information" role="tabpanel">
            <div class="ev-bento-grid">

                <!-- Card: Login Email -->
                <div class="ev-card">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--primary">
                                <span class="material-symbols-outlined ev-icon-primary">mail</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_email_title">Email đăng nhập</h3>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_current_email">Email hiện tại</label>
                            <span class="ev-current-value" id="email">{$user->email}</span>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_new_email">Email mới</label>
                            <input id="new-email" type="email" class="ev-input"
                                   data-i18n-user-edit-ph="label_new_email"
                                   placeholder="Nhập địa chỉ email mới"
                                   {if !$config['enable_change_email']}disabled{/if}>
                        </div>
                        {if $public_setting['reg_email_verify'] && $config['enable_change_email']}
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_email_code">Mã xác nhận</label>
                            <input id="email-code" type="text" class="ev-input"
                                   data-i18n-user-edit-ph="label_email_code"
                                   placeholder="Nhập mã xác nhận">
                        </div>
                        {/if}
                    </div>
                    <div class="ev-card-footer">
                        {if $public_setting['reg_email_verify'] && $config['enable_change_email']}
                        <div class="ev-action-row">
                            <button class="ev-btn-link"
                                    hx-post="/user/edit/send" hx-swap="none"
                                    hx-vals='js:{ email: document.getElementById("new-email").value }'
                                    data-i18n-user-edit="btn_get_code">Lấy mã</button>
                            <button class="ev-btn-primary"
                                    hx-post="/user/edit/email" hx-swap="none"
                                    hx-vals='js:{
                                        newemail: document.getElementById("new-email").value,
                                        emailcode: document.getElementById("email-code").value
                                    }'
                                    data-i18n-user-edit="btn_update_email">Cập nhật</button>
                        </div>
                        {elseif $config['enable_change_email']}
                        <button class="ev-btn-primary"
                                hx-post="/user/edit/email" hx-swap="none"
                                hx-vals='js:{ newemail: document.getElementById("new-email").value }'
                                data-i18n-user-edit="btn_update_email">Cập nhật</button>
                        {else}
                        <button class="ev-btn-primary" disabled
                                data-i18n-user-edit="btn_email_disabled">Không cho phép thay đổi</button>
                        {/if}
                    </div>
                </div>

                <!-- Card: Username -->
                <div class="ev-card">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--secondary">
                                <span class="material-symbols-outlined ev-icon-secondary">badge</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_username_title">Tên người dùng</h3>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_current_username">Tên hiện tại</label>
                            <span class="ev-current-value" id="username">{$user->user_name}</span>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_new_username">Tên mới</label>
                            <input id="new-username" type="text" class="ev-input"
                                   data-i18n-user-edit-ph="label_new_username"
                                   placeholder="Nhập tên người dùng mới" autocomplete="off">
                        </div>
                    </div>
                    <div class="ev-card-footer">
                        <button class="ev-btn-primary"
                                hx-post="/user/edit/username" hx-swap="none"
                                hx-vals='js:{ newusername: document.getElementById("new-username").value }'
                                data-i18n-user-edit="btn_update_username">Cập nhật</button>
                    </div>
                </div>

                <!-- Card: IM Link -->
                <div class="ev-card">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--tertiary">
                                <span class="material-symbols-outlined ev-icon-tertiary">chat</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_im_link_title">Liên kết tài khoản IM</h3>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_im_type">Loại IM</label>
                            <select id="imtype" class="ev-select"
                                    {if $user->im_type !== 0 && $user->im_value !== ''}disabled{/if}>
                                <option value="0" {if $user->im_type === 0}selected{/if}
                                        data-i18n-user-edit="option_im_none">Chưa liên kết</option>
                                <option value="1" {if $user->im_type === 1}selected{/if}>Slack</option>
                                <option value="2" {if $user->im_type === 2}selected{/if}>Discord</option>
                                <option value="4" {if $user->im_type === 4}selected{/if}>Telegram</option>
                            </select>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_im_id">ID / Username</label>
                            <input id="imvalue" type="text" class="ev-input"
                                   value="{$user->im_value}" disabled
                                   data-i18n-user-edit-ph="label_im_id"
                                   placeholder="@username_hoac_id">
                        </div>
                    </div>
                    <div class="ev-card-footer">
                        <div class="ev-oauth-wrap" id="oauth-provider"
                             data-telegram-bot="{$public_setting['telegram_bot']}"></div>
                    </div>
                </div>

                <!-- Card: IM Unlink -->
                <div class="ev-card ev-card--utility">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--error">
                                <span class="material-symbols-outlined ev-icon-error">link_off</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_im_unlink_title">Hủy liên kết tài khoản IM</h3>
                        </div>
                        {if $user->im_type === 0}
                        <p class="ev-info-text" data-i18n-user-edit="im_not_linked_text">Hiện tại bạn không có tài khoản nhắn tin tức thời (IM) nào được liên kết với hệ thống.</p>
                        <div class="ev-info-status">
                            <span class="material-symbols-outlined">info</span>
                            <span data-i18n-user-edit="im_status_not_linked">Trạng thái: Chưa liên kết</span>
                        </div>
                        {else}
                        <p class="ev-info-text">
                            Dịch vụ IM đang liên kết: <strong>{$user->imType()}</strong><br>
                            ID tài khoản: <span class="ev-spoiler">{$user->im_value}</span>
                        </p>
                        {/if}
                    </div>
                    {if $user->im_type !== 0}
                    <div class="ev-card-footer">
                        <button class="ev-btn-danger"
                                hx-post="/user/edit/unbind_im" hx-swap="none"
                                data-i18n-user-edit="btn_unlink_im">Hủy liên kết</button>
                    </div>
                    {/if}
                </div>

            </div>
        </div>

        <!-- ══ Tab 2: Login & Security ══ -->
        <div class="tab-pane" id="login_security" role="tabpanel">
            <div class="ev-bento-grid">

                <!-- Card: Change Password -->
                <div class="ev-card">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--primary">
                                <span class="material-symbols-outlined ev-icon-primary">lock_reset</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_password_title">Đổi mật khẩu đăng nhập</h3>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_current_password">Mật khẩu hiện tại</label>
                            <form>
                                <input id="password" type="password" class="ev-input"
                                       data-i18n-user-edit-ph="label_current_password"
                                       placeholder="Nhập mật khẩu hiện tại" autocomplete="off">
                            </form>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_new_password">Mật khẩu mới</label>
                            <form>
                                <input id="new_password" type="password" class="ev-input"
                                       data-i18n-user-edit-ph="label_new_password"
                                       placeholder="Nhập mật khẩu mới" autocomplete="off">
                            </form>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_confirm_password">Xác nhận mật khẩu mới</label>
                            <form>
                                <input id="confirm_new_password" type="password" class="ev-input"
                                       data-i18n-user-edit-ph="label_confirm_password"
                                       placeholder="Nhập lại mật khẩu mới" autocomplete="off">
                            </form>
                        </div>
                    </div>
                    <div class="ev-card-footer">
                        <button class="ev-btn-primary"
                                hx-post="/user/edit/password" hx-swap="none"
                                hx-vals='js:{
                                    new_password: document.getElementById("new_password").value,
                                    confirm_new_password: document.getElementById("confirm_new_password").value,
                                    password: document.getElementById("password").value
                                }'
                                data-i18n-user-edit="btn_change_password">Đổi mật khẩu</button>
                    </div>
                </div>

                <!-- Card: TOTP -->
                <div class="ev-card">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--{if $totpDevices}success{else}warning{/if}">
                                <span class="material-symbols-outlined ev-icon-{if $totpDevices}success{else}warning{/if}">verified_user</span>
                            </div>
                            <h3 class="ev-card-title">
                                <span data-i18n-user-edit="card_totp_title">TOTP</span>
                                {if $totpDevices}
                                <span class="ev-badge ev-badge--success" data-i18n-user-edit="badge_enabled">Đã bật</span>
                                {else}
                                <span class="ev-badge ev-badge--danger" data-i18n-user-edit="badge_disabled">Chưa bật</span>
                                {/if}
                            </h3>
                        </div>
                        <p class="ev-info-text" data-i18n-user-edit="totp_description">TOTP là thuật toán mật khẩu một lần dựa trên thời gian. Bạn có thể sử dụng Google Authenticator hoặc Authy để xác thực.</p>
                    </div>
                    <div class="ev-card-footer">
                        {if $totpDevices}
                        <button class="ev-btn-danger"
                                hx-delete="/user/totp"
                                hx-confirm="{$smarty.ldelim}i18n_user_edit.confirm_disable_totp{$smarty.rdelim}"
                                hx-swap="none"
                                data-i18n-user-edit="btn_disable_totp">Tắt TOTP</button>
                        {else}
                        <button class="ev-btn-primary" id="enableTotp"
                                data-i18n-user-edit="btn_enable_totp">Bật TOTP</button>
                        {/if}
                    </div>
                </div>

                <!-- Card: Passkey / WebAuthn (full width) -->
                <div class="ev-card ev-card--full">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--secondary">
                                <span class="material-symbols-outlined ev-icon-secondary">passkey</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_passkey_title">Passkey</h3>
                        </div>
                        <p class="ev-info-text" data-i18n-user-edit="passkey_description">Passkey là tiêu chuẩn xác thực mới, sử dụng sinh trắc học hoặc khóa bảo mật để thay thế mật khẩu truyền thống.</p>
                        {if $webauthnDevices}
                        <div class="ev-device-grid">
                            {foreach $webauthnDevices as $device}
                            <div class="ev-device-card">
                                <div class="ev-device-card__name">{$device->name|default:'Chưa đặt tên'}</div>
                                <div class="ev-device-card__meta">
                                    <span data-i18n-user-edit="passkey_added_at">Thêm lúc:</span>
                                    {$device->created_at}
                                </div>
                                <div class="ev-device-card__meta">
                                    <span data-i18n-user-edit="passkey_last_used">Dùng lần cuối:</span>
                                    {$device->used_at|default:'Chưa sử dụng'}
                                </div>
                                <button class="ev-device-card__btn"
                                        hx-delete="/user/webauthn/{$device->id}"
                                        hx-swap="none"
                                        hx-confirm="Xác nhận xóa thiết bị này?"
                                        data-i18n-user-edit="btn_delete_device">Xóa</button>
                            </div>
                            {/foreach}
                        </div>
                        {/if}
                    </div>
                    <div class="ev-card-footer">
                        <button class="ev-btn-primary" id="webauthnReg"
                                data-i18n-user-edit="btn_register_passkey">Đăng ký Passkey</button>
                    </div>
                </div>

                <!-- Card: FIDO2 (full width) -->
                <div class="ev-card ev-card--full">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--{if $fidoDevices}success{else}primary{/if}">
                                <span class="material-symbols-outlined ev-icon-{if $fidoDevices}success{else}primary{/if}">security_key</span>
                            </div>
                            <h3 class="ev-card-title">
                                <span data-i18n-user-edit="card_fido_title">FIDO2</span>
                                {if $fidoDevices}
                                <span class="ev-badge ev-badge--success" data-i18n-user-edit="badge_enabled">Đã bật</span>
                                {else}
                                <span class="ev-badge ev-badge--danger" data-i18n-user-edit="badge_disabled">Chưa bật</span>
                                {/if}
                            </h3>
                        </div>
                        <p class="ev-info-text" data-i18n-user-edit="fido_description">FIDO2 là tiêu chuẩn xác thực dựa trên mã hóa khóa công khai, hỗ trợ Yubikey và các khóa bảo mật phần cứng.</p>
                        {if $fidoDevices}
                        <div class="ev-device-grid">
                            {foreach $fidoDevices as $device}
                            <div class="ev-device-card">
                                <div class="ev-device-card__name">{$device->name|default:'Chưa đặt tên'}</div>
                                <div class="ev-device-card__meta">
                                    <span data-i18n-user-edit="passkey_added_at">Thêm lúc:</span>
                                    {$device->created_at}
                                </div>
                                <div class="ev-device-card__meta">
                                    <span data-i18n-user-edit="passkey_last_used">Dùng lần cuối:</span>
                                    {$device->used_at|default:'Chưa sử dụng'}
                                </div>
                                <button class="ev-device-card__btn"
                                        hx-delete="/user/fido/{$device->id}"
                                        hx-swap="none"
                                        hx-confirm="Xác nhận xóa thiết bị này?"
                                        data-i18n-user-edit="btn_delete_device">Xóa</button>
                            </div>
                            {/foreach}
                        </div>
                        {/if}
                    </div>
                    <div class="ev-card-footer">
                        <button class="ev-btn-primary" id="fidoReg"
                                data-i18n-user-edit="btn_register_fido">Đăng ký FIDO2</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- ══ Tab 3: Usage / Safety ══ -->
        <div class="tab-pane" id="use_safety" role="tabpanel">
            <div class="ev-bento-grid">

                <!-- Card: Encryption Method -->
                <div class="ev-card">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--primary">
                                <span class="material-symbols-outlined ev-icon-primary">passkey </span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_method_title">Phương thức mã hóa</h3>
                        </div>
                        <p class="ev-info-text" data-i18n-user-edit="method_description">Các ứng dụng khác nhau hỗ trợ các phương thức mã hóa khác nhau. Vui lòng tham khảo danh sách hỗ trợ của ứng dụng để chọn đúng.</p>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_current_method">Phương thức hiện tại</label>
                            <select id="user-method" class="ev-select">
                                {foreach $methods as $method}
                                <option value="{$method}" {if $user->method === $method}selected{/if}>{$method}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="ev-card-footer">
                        <button class="ev-btn-primary"
                                hx-post="/user/edit/method" hx-swap="none"
                                hx-vals='js:{ method: document.getElementById("user-method").value }'
                                data-i18n-user-edit="btn_update_method">Cập nhật</button>
                    </div>
                </div>

                <!-- Card: Reset Subscription URL -->
                <div class="ev-card ev-card--utility">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--warning">
                                <span class="material-symbols-outlined ev-icon-warning">link</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_url_reset_title">Đặt lại địa chỉ đăng ký</h3>
                        </div>
                        <p class="ev-info-text" data-i18n-user-edit="url_reset_description">Sau khi đặt lại, địa chỉ đăng ký cũ sẽ không còn hoạt động. Cấu hình node hiện tại vẫn tiếp tục được sử dụng cho đến khi đặt lại mật khẩu kết nối.</p>
                    </div>
                    <div class="ev-card-footer">
                        <button class="ev-btn-danger"
                                hx-post="/user/edit/url_reset" hx-swap="none"
                                data-i18n-user-edit="btn_reset_url">Đặt lại</button>
                    </div>
                </div>

                <!-- Card: Reset Connection Password -->
                <div class="ev-card ev-card--utility">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--error">
                                <span class="material-symbols-outlined ev-icon-error">key_off</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_passwd_reset_title">Đặt lại mật khẩu kết nối</h3>
                        </div>
                        <p class="ev-info-text" data-i18n-user-edit="passwd_reset_description">Đặt lại mật khẩu kết nối và UUID. Sau khi đặt lại, bạn cần cập nhật lại đăng ký để tiếp tục sử dụng.</p>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_current_passwd">Mật khẩu kết nối hiện tại</label>
                            <span class="ev-spoiler" id="passwd">{$user->passwd}</span>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_current_uuid">UUID hiện tại</label>
                            <span class="ev-spoiler" id="uuid">{$user->uuid}</span>
                        </div>
                    </div>
                    <div class="ev-card-footer">
                        <button class="ev-btn-danger"
                                hx-post="/user/edit/passwd_reset" hx-swap="none"
                                data-i18n-user-edit="btn_reset_passwd">Đặt lại</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- ══ Tab 4: Other Settings ══ -->
        <div class="tab-pane" id="other_settings" role="tabpanel">
            <div class="ev-bento-grid">

                <!-- Card: Daily Traffic Report -->
                <div class="ev-card">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--secondary">
                                <span class="material-symbols-outlined ev-icon-secondary">mark_email_read</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_daily_mail_title">Báo cáo lưu lượng hàng ngày</h3>
                        </div>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_receive_method">Phương thức nhận</label>
                            <select id="daily-mail" class="ev-select">
                                <option value="0" {if $user->daily_mail_enable === 0}selected{/if}
                                        data-i18n-user-edit="option_no_receive">Không nhận</option>
                                <option value="1" {if $user->daily_mail_enable === 1}selected{/if}
                                        data-i18n-user-edit="option_email_receive">Nhận qua Email</option>
                                <option value="2" {if $user->daily_mail_enable === 2}selected{/if}
                                        data-i18n-user-edit="option_im_receive">Nhận qua IM</option>
                            </select>
                        </div>
                    </div>
                    <div class="ev-card-footer">
                        <button class="ev-btn-primary"
                                hx-post="/user/edit/daily_mail" hx-swap="none"
                                hx-vals='js:{ mail: document.getElementById("daily-mail").value }'
                                data-i18n-user-edit="btn_update_daily_mail">Cập nhật</button>
                    </div>
                </div>

                <!-- Card: Preferred Contact Method -->
                <div class="ev-card">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--tertiary">
                                <span class="material-symbols-outlined ev-icon-tertiary">contact_mail</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_contact_method_title">Phương thức liên hệ ưa thích</h3>
                        </div>
                        <p class="ev-info-text" data-i18n-user-edit="contact_method_description">Khi IM chưa được liên kết, hệ thống sẽ luôn gửi thông báo qua email tài khoản.</p>
                        <div class="ev-field">
                            <label class="ev-label" data-i18n-user-edit="label_contact_method">Phương thức</label>
                            <select id="contact-method" class="ev-select">
                                <option value="1" {if $user->contact_method === 1}selected{/if}
                                        data-i18n-user-edit="option_email">Email</option>
                                <option value="2" {if $user->contact_method === 2}selected{/if}
                                        data-i18n-user-edit="option_im">IM</option>
                            </select>
                        </div>
                    </div>
                    <div class="ev-card-footer">
                        <button class="ev-btn-primary"
                                hx-post="/user/edit/contact_method" hx-swap="none"
                                hx-vals='js:{ contact: document.getElementById("contact-method").value }'
                                data-i18n-user-edit="btn_update_contact">Cập nhật</button>
                    </div>
                </div>

                {if $config['enable_kill']}
                <!-- Card: Delete Account -->
                <div class="ev-card ev-card--utility">
                    <div class="ev-card-body">
                        <div class="ev-card-icon-wrap">
                            <div class="ev-card-icon ev-card-icon--error">
                                <span class="material-symbols-outlined ev-icon-error">delete_forever</span>
                            </div>
                            <h3 class="ev-card-title" data-i18n-user-edit="card_delete_account_title">Xóa dữ liệu tài khoản</h3>
                        </div>
                        <p class="ev-info-text" data-i18n-user-edit="delete_account_description">Thao tác này không thể hoàn tác. Toàn bộ dữ liệu tài khoản của bạn sẽ bị xóa vĩnh viễn khỏi hệ thống.</p>
                    </div>
                    <div class="ev-card-footer">
                        <button class="ev-btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#destroy-account"
                                data-i18n-user-edit="btn_delete_account">Xóa tài khoản</button>
                    </div>
                </div>
                {/if}

            </div>
        </div>

    </div>

    <!-- ── Page Footer ── -->
    <footer class="ev-page-footer">
        <p data-i18n-user-edit="footer_note">Tất cả thay đổi đều yêu cầu xác thực phiên đăng nhập hiện tại để đảm bảo an toàn.</p>
    </footer>

</div>

<!-- ── Modal: Delete Account ── -->
{if $config['enable_kill']}
<div class="modal modal-blur fade" id="destroy-account" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-danger"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-alert-circle icon mb-2 text-danger icon-lg" style="font-size:3.5rem;"></i>
                <h3 data-i18n-user-edit="delete_confirm_title">Xác nhận xóa</h3>
                <div class="text-secondary" data-i18n-user-edit="delete_confirm_text">
                    Xác nhận xóa tài khoản? Thao tác này không thể hoàn tác. Toàn bộ dữ liệu sẽ bị xóa vĩnh viễn.
                </div>
                <div class="py-3">
                    <form>
                        <input id="confirm_kill_password" type="password" class="form-control"
                               placeholder="Nhập mật khẩu đăng nhập" autocomplete="off">
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <button class="btn w-100" data-bs-dismiss="modal"
                                    data-i18n-user-edit="btn_cancel">Hủy</button>
                        </div>
                        <div class="col">
                            <button class="btn btn-danger w-100" data-bs-dismiss="modal"
                                    hx-post="/user/edit/kill" hx-swap="none"
                                    hx-vals='js:{ password: document.getElementById("confirm_kill_password").value }'
                                    data-i18n-user-edit="btn_confirm_delete">Xác nhận xóa</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{/if}

<!-- ── Modal: TOTP Setup ── -->
<div class="modal" id="totpModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" data-i18n-user-edit="totp_modal_title">Thiết lập TOTP</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <div class="row">
                    <div class="col-md-12">
                        <p data-i18n-user-edit="totp_scan_instruction">Sử dụng Google Authenticator hoặc Authy để quét mã QR bên dưới</p>
                    </div>
                    <div class="col-md-12 d-flex justify-content-center align-items-center">
                        <div id="qrcode"></div>
                    </div>
                    <div class="col-md-12">
                        <p data-i18n-user-edit="totp_manual_key">Nếu không quét được mã QR, hãy nhập thủ công khóa bí mật sau:</p>
                        <p id="totpSecret"></p>
                    </div>
                    <div class="col-md-12">
                        <input type="text" id="totpCode" class="form-control mx-auto"
                               placeholder="TOTP Code">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submitTotp"
                        data-i18n-user-edit="btn_confirm_totp">Xác nhận</button>
            </div>
        </div>
    </div>
</div>

{include file='user/footer.tpl'}

<!-- ── Edit Page Scripts ── -->
<script src="/assets/js/user/edit/tabs.js{asset_ver path="/assets/js/user/edit/tabs.js"}"></script>
<script src="/assets/js/user/edit/totp.js{asset_ver path="/assets/js/user/edit/totp.js"}"></script>
<script src="/assets/js/user/edit/passkey.js{asset_ver path="/assets/js/user/edit/passkey.js"}"></script>
<script src="/assets/js/user/edit/im-oauth.js{asset_ver path="/assets/js/user/edit/im-oauth.js"}"></script>
