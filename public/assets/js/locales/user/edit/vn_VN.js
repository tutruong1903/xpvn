window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.edit = window.i18nLocales.user.edit || {};

window.i18nLocales.user.edit.vn_VN = {
    // Page header
    page_title: "Chỉnh sửa thông tin",
    page_subtitle: "Cập nhật và quản lý các thiết lập tài khoản cá nhân của bạn trên hệ thống.",

    // Tabs
    tab_info: "Thông tin",
    tab_login: "Đăng nhập",
    tab_usage: "Sử dụng",
    tab_other: "Khác",

    // Card: Login Email
    card_email_title: "Email đăng nhập",
    label_current_email: "Email hiện tại",
    label_new_email: "Email mới",
    label_email_code: "Mã xác nhận",
    btn_get_code: "Lấy mã",
    btn_update_email: "Cập nhật",
    btn_email_disabled: "Không cho phép thay đổi",

    // Card: Username
    card_username_title: "Tên người dùng",
    label_current_username: "Tên hiện tại",
    label_new_username: "Tên mới",
    btn_update_username: "Cập nhật",

    // Card: IM Link
    card_im_link_title: "Liên kết tài khoản IM",
    label_im_type: "Loại IM",
    option_im_none: "Chưa liên kết",
    label_im_id: "ID / Username",
    btn_link_slack: "Liên kết Slack",
    btn_link_discord: "Liên kết Discord",

    // Card: IM Unlink
    card_im_unlink_title: "Hủy liên kết tài khoản IM",
    im_not_linked_text: "Hiện tại bạn không có tài khoản nhắn tin tức thời (IM) nào được liên kết với hệ thống.",
    im_status_not_linked: "Trạng thái: Chưa liên kết",
    btn_unlink_im: "Hủy liên kết",

    // Card: Change Password
    card_password_title: "Đổi mật khẩu đăng nhập",
    label_current_password: "Mật khẩu hiện tại",
    label_new_password: "Mật khẩu mới",
    label_confirm_password: "Xác nhận mật khẩu mới",
    btn_change_password: "Đổi mật khẩu",

    // Card: TOTP
    card_totp_title: "TOTP",
    badge_enabled: "Đã bật",
    badge_disabled: "Chưa bật",
    totp_description: "TOTP là thuật toán mật khẩu một lần dựa trên thời gian. Bạn có thể sử dụng Google Authenticator hoặc Authy để xác thực.",
    btn_disable_totp: "Tắt TOTP",
    btn_enable_totp: "Bật TOTP",
    confirm_disable_totp: "Xác nhận tắt TOTP?",

    // Card: Passkey
    card_passkey_title: "Passkey",
    passkey_description: "Passkey là tiêu chuẩn xác thực mới, sử dụng sinh trắc học hoặc khóa bảo mật để thay thế mật khẩu truyền thống.",
    passkey_added_at: "Thêm lúc:",
    passkey_last_used: "Dùng lần cuối:",
    passkey_never_used: "Chưa sử dụng",
    passkey_unnamed: "Chưa đặt tên",
    btn_delete_device: "Xóa",
    confirm_delete_device: "Xác nhận xóa thiết bị này?",
    btn_register_passkey: "Đăng ký Passkey",
    passkey_device_name_prompt: "Nhập tên thiết bị:",

    // Card: FIDO2
    card_fido_title: "FIDO2",
    fido_description: "FIDO2 là tiêu chuẩn xác thực dựa trên mã hóa khóa công khai, hỗ trợ Yubikey và các khóa bảo mật phần cứng.",
    btn_register_fido: "Đăng ký FIDO2",

    // Card: Encryption Method
    card_method_title: "Phương thức mã hóa",
    method_description: "Các ứng dụng khác nhau hỗ trợ các phương thức mã hóa khác nhau. Vui lòng tham khảo danh sách hỗ trợ của ứng dụng để chọn đúng.",
    label_current_method: "Phương thức hiện tại",
    btn_update_method: "Cập nhật",

    // Card: Reset Subscription URL
    card_url_reset_title: "Đặt lại địa chỉ đăng ký",
    url_reset_description: "Sau khi đặt lại, địa chỉ đăng ký cũ sẽ không còn hoạt động. Cấu hình node hiện tại vẫn tiếp tục được sử dụng cho đến khi đặt lại mật khẩu kết nối.",
    btn_reset_url: "Đặt lại",

    // Card: Reset Connection Password
    card_passwd_reset_title: "Đặt lại mật khẩu kết nối",
    passwd_reset_description: "Đặt lại mật khẩu kết nối và UUID. Sau khi đặt lại, bạn cần cập nhật lại đăng ký để tiếp tục sử dụng.",
    label_current_passwd: "Mật khẩu kết nối hiện tại",
    label_current_uuid: "UUID hiện tại",
    btn_reset_passwd: "Đặt lại",

    // Card: Daily Mail
    card_daily_mail_title: "Báo cáo lưu lượng hàng ngày",
    label_receive_method: "Phương thức nhận",
    option_no_receive: "Không nhận",
    option_email_receive: "Nhận qua Email",
    option_im_receive: "Nhận qua IM",
    btn_update_daily_mail: "Cập nhật",

    // Card: Contact Method
    card_contact_method_title: "Phương thức liên hệ ưa thích",
    contact_method_description: "Khi IM chưa được liên kết, hệ thống sẽ luôn gửi thông báo qua email tài khoản.",
    label_contact_method: "Phương thức",
    option_email: "Email",
    option_im: "IM",
    btn_update_contact: "Cập nhật",

    // Card: Delete Account
    card_delete_account_title: "Xóa dữ liệu tài khoản",
    delete_account_description: "Thao tác này không thể hoàn tác. Toàn bộ dữ liệu tài khoản của bạn sẽ bị xóa vĩnh viễn khỏi hệ thống.",
    btn_delete_account: "Xóa tài khoản",

    // Modal: TOTP Setup
    totp_modal_title: "Thiết lập TOTP",
    totp_scan_instruction: "Sử dụng Google Authenticator hoặc Authy để quét mã QR bên dưới",
    totp_manual_key: "Nếu không quét được mã QR, hãy nhập thủ công khóa bí mật sau:",
    btn_confirm_totp: "Xác nhận",

    // Modal: Delete Account Confirm
    delete_confirm_title: "Xác nhận xóa",
    delete_confirm_text: "Xác nhận xóa tài khoản? Thao tác này không thể hoàn tác. Toàn bộ dữ liệu sẽ bị xóa vĩnh viễn.",
    btn_cancel: "Hủy",
    btn_confirm_delete: "Xác nhận xóa",

    // Footer note
    footer_note: "Tất cả thay đổi đều yêu cầu xác thực phiên đăng nhập hiện tại để đảm bảo an toàn.",
};
