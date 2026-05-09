window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.email = window.i18nLocales.admin.email || {};

window.i18nLocales.admin.email.zh_CN = {
    index: {
        title:    "邮件设置",
        subtitle: "配置站点的邮件发送系统。",
        save_btn: "保存",

        // Tabs
        tab_email:       "邮件设置",
        tab_limit:       "发送限制",
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
        driver_label:        "邮件服务提供商",
        test_recipient:      "测试邮件接收地址",
        test_send_btn:       "发送测试邮件",

        // Limit tab
        verify_code_ttl:       "邮箱验证码有效期（秒）",
        password_reset_ttl:    "邮箱重设密码链接有效期（秒）",
        ip_limit:              "单个IP每小时可请求的发信次数",
        address_limit:         "单个邮箱地址每小时可请求的发信次数",

        // SMTP tab
        smtp_ssl:    "Enable TLS/SSL",
        smtp_sender: "Sender",
        smtp_bbc:    "BCC",

        // Postmark
        postmark_sender: "Sender",

        // Common
        enable:  "启用",
        disable: "停用",
    },
};
