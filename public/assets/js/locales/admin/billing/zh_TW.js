window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.billing = window.i18nLocales.admin.billing || {};

window.i18nLocales.admin.billing.zh_TW = {
    index: {
        title:          "財務設定",
        subtitle:       "管理客戶可用的支付閘道。",
        save_btn:       "儲存",
        tab_gateway:    "閘道選擇",
        tab_f2f:        "支付寶當面付",
        gateway_list_title: "支付方式清單",
        set_webhook:    "設定 Webhook",
        enable:         "啟用",
        disable:        "停用",

        // Alipay F2F
        f2f_public_key:  "Alipay Public Key",
        f2f_private_key: "App Private Key",
        f2f_notify_url:  "自訂回調地址（可選）",

        // Stripe
        stripe_currency:     "閘道貨幣",
        stripe_card:         "銀行卡支付",
        stripe_alipay:       "支付寶支付",
        stripe_wechat:       "微信支付",
        stripe_min_recharge: "最低充值限額（整數）",
        stripe_max_recharge: "最高充值限額（整數）",

        // EPay
        epay_url:       "閘道地址",
        epay_pid:       "商戶ID",
        epay_key:       "商戶Key",
        epay_sign_type: "簽名方式",
        epay_alipay:    "支付寶",
        epay_wechat:    "微信支付",
        epay_qq:        "QQ錢包",

        // PayPal
        paypal_currency: "貨幣",
        paypal_locale:   "語言",

        // Cryptomus
        cryptomus_api_key_hint:  "您可以在個人帳戶設定中找到 API key。",
        cryptomus_uuid_hint:     "您可以在個人帳戶設定中找到 UUID。",
        cryptomus_subtract_hint: "客戶需支付的佣金比例（0-100%）",
        cryptomus_lifetime_hint: "已發行發票的有效期。（秒）",
    },
};
