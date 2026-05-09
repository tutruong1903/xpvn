window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.giftcard = window.i18nLocales.admin.giftcard || {};

window.i18nLocales.admin.giftcard.zh_TW = {
    index: {
        title:              "禮品卡列表",
        subtitle:           "查看並管理所有禮品卡。",
        search_placeholder: "按ID或卡號搜尋…",
        create_btn:         "建立",
        delete_confirm:     "確定刪除此禮品卡？",
        stat_total:         "總禮品卡數",
        stat_unused:        "未使用",
        stat_used:          "已使用",
    },
    fields: {
        op:          "操作",
        id:          "禮品卡ID",
        card:        "卡號",
        balance:     "面值",
        create_time: "建立時間",
        status:      "使用狀態",
        use_time:    "使用時間",
        use_user:    "使用用戶",
    },
    create_modal: {
        title:      "建立禮品卡",
        cancel_btn: "取消",
        submit_btn: "建立",        // Field labels
        field_card_number: "建立數量",
        field_card_value:  "礼品卡面値",
        field_card_length: "礼品卡長度",
        // Select options
        opt_12: "12位",
        opt_18: "18位",
        opt_24: "24位",
        opt_30: "30位",
        opt_36: "36位",    },
    badges: {
        unused: "未使用",
        used:   "已使用",
    },
};
