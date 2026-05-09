window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.billing = window.i18nLocales.admin.billing || {};

window.i18nLocales.admin.billing.en_US = {
    index: {
        title:          "Financial Settings",
        subtitle:       "Manage payment gateways available to your customers.",
        save_btn:       "Save",
        tab_gateway:    "Gateway Selection",
        tab_f2f:        "Alipay F2F",
        gateway_list_title: "Payment Methods",
        set_webhook:    "Set Webhook",
        enable:         "Enable",
        disable:        "Disable",

        // Alipay F2F
        f2f_public_key:  "Alipay Public Key",
        f2f_private_key: "App Private Key",
        f2f_notify_url:  "Custom Callback URL (optional)",

        // Stripe
        stripe_currency:     "Gateway Currency",
        stripe_card:         "Card Payment",
        stripe_alipay:       "Alipay Payment",
        stripe_wechat:       "WeChat Pay",
        stripe_min_recharge: "Min Recharge Amount (integer)",
        stripe_max_recharge: "Max Recharge Amount (integer)",

        // EPay
        epay_url:       "Gateway URL",
        epay_pid:       "Merchant ID",
        epay_key:       "Merchant Key",
        epay_sign_type: "Signature Type",
        epay_alipay:    "Alipay",
        epay_wechat:    "WeChat Pay",
        epay_qq:        "QQ Wallet",

        // PayPal
        paypal_currency: "Currency",
        paypal_locale:   "Language",

        // Cryptomus
        cryptomus_api_key_hint:  "You can find the API key in the settings of your personal account.",
        cryptomus_uuid_hint:     "You can find the UUID in the settings of your personal account.",
        cryptomus_subtract_hint: "How much commission does the client pay (0–100%)",
        cryptomus_lifetime_hint: "The lifespan of the issued invoice. (In seconds)",
    },
};
