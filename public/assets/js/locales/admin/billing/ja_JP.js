window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.billing = window.i18nLocales.admin.billing || {};

window.i18nLocales.admin.billing.ja_JP = {
    index: {
        title:          "財務設定",
        subtitle:       "顧客が利用可能な決済ゲートウェイを管理します。",
        save_btn:       "保存",
        tab_gateway:    "ゲートウェイ選択",
        tab_f2f:        "Alipay 対面払い",
        gateway_list_title: "決済方法一覧",
        set_webhook:    "Webhook 設定",
        enable:         "有効",
        disable:        "無効",

        // Alipay F2F
        f2f_public_key:  "Alipay Public Key",
        f2f_private_key: "App Private Key",
        f2f_notify_url:  "カスタムコールバックURL（任意）",

        // Stripe
        stripe_currency:     "ゲートウェイ通貨",
        stripe_card:         "カード支払い",
        stripe_alipay:       "Alipay 支払い",
        stripe_wechat:       "WeChat Pay",
        stripe_min_recharge: "最低チャージ額（整数）",
        stripe_max_recharge: "最高チャージ額（整数）",

        // EPay
        epay_url:       "ゲートウェイURL",
        epay_pid:       "マーチャントID",
        epay_key:       "マーチャントKey",
        epay_sign_type: "署名方式",
        epay_alipay:    "Alipay",
        epay_wechat:    "WeChat Pay",
        epay_qq:        "QQウォレット",

        // PayPal
        paypal_currency: "通貨",
        paypal_locale:   "言語",

        // Cryptomus
        cryptomus_api_key_hint:  "APIキーはパーソナルアカウントの設定で確認できます。",
        cryptomus_uuid_hint:     "UUIDはパーソナルアカウントの設定で確認できます。",
        cryptomus_subtract_hint: "クライアントが支払う手数料（0–100%）",
        cryptomus_lifetime_hint: "発行された請求書の有効期間。（秒）",
    },
};
