window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.email = window.i18nLocales.admin.email || {};

window.i18nLocales.admin.email.en_US = {
    index: {
        title:    "Email Settings",
        subtitle: "Configure the email delivery system for your site.",
        save_btn: "Save",

        // Tabs
        tab_email:       "Email Settings",
        tab_limit:       "Send Limits",
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
        driver_label:        "Email Provider",
        test_recipient:      "Test Email Recipient",
        test_send_btn:       "Send Test Email",

        // Limit tab
        verify_code_ttl:       "Verification Code TTL (seconds)",
        password_reset_ttl:    "Password Reset Link TTL (seconds)",
        ip_limit:              "Max requests per IP per hour",
        address_limit:         "Max requests per email address per hour",

        // SMTP tab
        smtp_ssl:    "Enable TLS/SSL",
        smtp_sender: "Sender",
        smtp_bbc:    "BCC",

        // Postmark
        postmark_sender: "Sender",

        // Common
        enable:  "Enable",
        disable: "Disable",
    },
};
