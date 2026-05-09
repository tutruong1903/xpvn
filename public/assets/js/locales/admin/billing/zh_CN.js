window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.billing = window.i18nLocales.admin.billing || {};

window.i18nLocales.admin.billing.zh_CN = {
    index: {
        title:          "财务设置",
        subtitle:       "管理客户可用的支付网关。",
        save_btn:       "保存",
        tab_gateway:    "网关选择",
        tab_f2f:        "支付宝当面付",
        gateway_list_title: "支付方式列表",
        set_webhook:    "设置 Webhook",
        enable:         "启用",
        disable:        "停用",

        // Alipay F2F
        f2f_public_key:  "Alipay Public Key",
        f2f_private_key: "App Private Key",
        f2f_notify_url:  "自定义回调地址（可选）",

        // Stripe
        stripe_currency:     "网关货币",
        stripe_card:         "银行卡支付",
        stripe_alipay:       "支付宝支付",
        stripe_wechat:       "微信支付",
        stripe_min_recharge: "最低充值限额（整数）",
        stripe_max_recharge: "最高充值限额（整数）",

        // EPay
        epay_url:       "网关地址",
        epay_pid:       "商户ID",
        epay_key:       "商户Key",
        epay_sign_type: "签名方式",
        epay_alipay:    "支付宝",
        epay_wechat:    "微信支付",
        epay_qq:        "QQ钱包",

        // PayPal
        paypal_currency: "货币",
        paypal_locale:   "语言",

        // Cryptomus
        cryptomus_api_key_hint:  "您可以在个人账户设置中找到 API key。",
        cryptomus_uuid_hint:     "您可以在个人账户设置中找到 UUID。",
        cryptomus_subtract_hint: "客户需支付的佣金比例（0-100%）",
        cryptomus_lifetime_hint: "已发行发票的有效期。（秒）",
    },
};
