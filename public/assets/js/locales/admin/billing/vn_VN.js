window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.billing = window.i18nLocales.admin.billing || {};

window.i18nLocales.admin.billing.vn_VN = {
    index: {
        title:          "Cài đặt tài chính",
        subtitle:       "Quản lý các cổng thanh toán khả dụng cho khách hàng của bạn.",
        save_btn:       "Lưu",
        tab_gateway:    "Mạng lựa chọn",
        tab_f2f:        "Alipay thanh toán trực tiếp",
        gateway_list_title: "Danh sách phương thức thanh toán",
        set_webhook:    "Thiết lập Webhook",
        enable:         "Bật",
        disable:        "Tắt",

        // Alipay F2F
        f2f_public_key:  "Alipay Public Key",
        f2f_private_key: "App Private Key",
        f2f_notify_url:  "URL callback tùy chỉnh (tùy chọn)",

        // Stripe
        stripe_currency:     "Tiền tệ cổng thanh toán",
        stripe_card:         "Thanh toán thẻ ngân hàng",
        stripe_alipay:       "Thanh toán Alipay",
        stripe_wechat:       "Thanh toán WeChat",
        stripe_min_recharge: "Mức nạp tối thiểu (số nguyên)",
        stripe_max_recharge: "Mức nạp tối đa (số nguyên)",

        // EPay
        epay_url:       "Địa chỉ cổng thanh toán",
        epay_pid:       "ID thương nhân",
        epay_key:       "Khóa thương nhân",
        epay_sign_type: "Phương thức ký",
        epay_alipay:    "Alipay",
        epay_wechat:    "WeChat Pay",
        epay_qq:        "Ví QQ",

        // PayPal
        paypal_currency: "Tiền tệ",
        paypal_locale:   "Ngôn ngữ",

        // Cryptomus
        cryptomus_api_key_hint:  "Bạn có thể tìm thấy API key trong cài đặt tài khoản cá nhân.",
        cryptomus_uuid_hint:     "Bạn có thể tìm thấy UUID trong cài đặt tài khoản cá nhân.",
        cryptomus_subtract_hint: "Phần trăm hoa hồng khách hàng phải trả (0–100%)",
        cryptomus_lifetime_hint: "Thời hạn tồn tại của hóa đơn được phát hành. (Tính bằng giây)",
    },
};
