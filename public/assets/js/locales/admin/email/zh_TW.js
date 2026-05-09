window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.email = window.i18nLocales.admin.email || {};

window.i18nLocales.admin.email.zh_TW = {
    index: {
        title:    "郵件設定",
        subtitle: "設定站點的郵件發送系統。",
        save_btn: "儲存",

        // Tabs
        tab_email:       "郵件設定",
        tab_limit:       "發送限制",
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
        driver_label:        "郵件服務提供商",
        test_recipient:      "測試郵件接收地址",
        test_send_btn:       "發送測試郵件",

        // Limit tab
        verify_code_ttl:       "郵箱驗證碼有效期（秒）",
        password_reset_ttl:    "郵箱重設密碼連結有效期（秒）",
        ip_limit:              "單個IP每小時可請求的發信次數",
        address_limit:         "單個郵箱地址每小時可請求的發信次數",

        // SMTP tab
        smtp_ssl:    "Enable TLS/SSL",
        smtp_sender: "Sender",
        smtp_bbc:    "BCC",

        // Postmark
        postmark_sender: "Sender",

        // Common
        enable:  "啟用",
        disable: "停用",
    },
};
