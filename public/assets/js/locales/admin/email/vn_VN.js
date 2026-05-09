window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.email = window.i18nLocales.admin.email || {};

window.i18nLocales.admin.email.vn_VN = {
    index: {
        title:    "Cài đặt Email",
        subtitle: "Cấu hình hệ thống gửi email cho trang web của bạn.",
        save_btn: "Lưu",

        // Tabs
        tab_email:       "Cài đặt Email",
        tab_limit:       "Giới hạn gửi",
        tab_smtp:        "SMTP",
        tab_mailgun:     "Mailgun",
        tab_sendgrid:    "Sendgrid",
        tab_postal:      "Postal",
        tab_ses:         "AWS SES",
        tab_mailchimp:   "Mailchimp",
        tab_alibaba:     "AlibabaCloud DM",
        tab_postmark:    "Postmark",
        tab_resend:      "Resend",

        // Email tab
        driver_label:        "Nhà cung cấp Email",
        test_recipient:      "Địa chỉ nhận email thử",
        test_send_btn:       "Gửi email thử",

        // Limit tab
        verify_code_ttl:       "Thời hạn mã xác minh (giây)",
        password_reset_ttl:    "Thời hạn link đặt lại mật khẩu (giây)",
        ip_limit:              "Số lần gửi tối đa mỗi IP mỗi giờ",
        address_limit:         "Số lần gửi tối đa mỗi địa chỉ email mỗi giờ",

        // SMTP tab
        smtp_ssl:    "Bật TLS/SSL",
        smtp_sender: "Sender",
        smtp_bbc:    "BCC",

        // Postmark
        postmark_sender: "Sender",

        // Common
        enable:  "Bật",
        disable: "Tắt",
    },
};
