window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.email = window.i18nLocales.admin.email || {};

window.i18nLocales.admin.email.ja_JP = {
    index: {
        title:    "メール設定",
        subtitle: "サイトのメール送信システムを設定します。",
        save_btn: "保存",

        // Tabs
        tab_email:       "メール設定",
        tab_limit:       "送信制限",
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
        driver_label:        "メールサービスプロバイダー",
        test_recipient:      "テストメール受信アドレス",
        test_send_btn:       "テストメール送信",

        // Limit tab
        verify_code_ttl:       "メール認証コード有効期限（秒）",
        password_reset_ttl:    "パスワードリセットリンク有効期限（秒）",
        ip_limit:              "IPあたりの1時間の最大送信リクエスト数",
        address_limit:         "メールアドレスあたりの1時間の最大送信リクエスト数",

        // SMTP tab
        smtp_ssl:    "Enable TLS/SSL",
        smtp_sender: "Sender",
        smtp_bbc:    "BCC",

        // Postmark
        postmark_sender: "Sender",

        // Common
        enable:  "有効",
        disable: "無効",
    },
};
