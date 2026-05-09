window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.coupon = window.i18nLocales.admin.coupon || {};

window.i18nLocales.admin.coupon.zh_TW = {
    index: {
        title:           "優惠碼列表",
        subtitle:        "查看並管理所有優惠碼。",
        search_placeholder: "按ID或優惠碼搜尋…",
        create_btn:      "建立",
        delete_confirm:  "確定刪除此優惠碼？",
        disable_confirm: "確定停用此優惠碼？",
        stat_total:      "總優惠碼數",
        stat_active:     "啟用中",
        stat_disabled:   "已停用",
    },
    fields: {
        op:             "操作",
        id:             "ID",
        code:           "優惠碼",
        type:           "類型",
        value:          "額度",
        product_id:     "可用商品ID",
        use_time:       "每用戶使用次數",
        total_use_time: "累計使用次數",
        new_user:       "僅限新用戶",
        disabled:       "已停用",
        use_count:      "已使用次數",
        create_time:    "建立時間",
        expire_time:    "過期時間",
    },
    create_modal: {
        title:        "建立優惠碼",
        expire_label: "過期時間（留空則為不限制）",
        cancel_btn:   "取消",
        submit_btn:   "建立",
        // Field labels
        field_code:             "優惠碼",
        field_type:             "優惠碼類型",
        field_value:            "優惠碼額度",
        field_product_id:       "可用商品ID（多個ID以英文半角逗號分隔）",
        field_use_time:         "每個用戶可使用次數限制（小於0為不限）",
        field_total_use_time:   "累計可使用次數限制（小於0為不限）",
        field_new_user:         "僅限新用戶使用",
        field_generate_method:  "生成方式",
        // Select options
        opt_percentage:   "百分比",
        opt_fixed:        "固定金額",
        opt_1:            "是",
        opt_0:            "否",
        opt_char:         "指定字元",
        opt_random:       "隨機字元（無視優惠碼參數）",
        opt_char_random:  "指定字元+隨機字元",
    },
    badges: {
        percentage: "百分比",
        fixed:      "固定金額",
        unlimited:  "不限次數",
        never:      "永久有效",
        yes:        "是",
        no:         "否",
    },
};
