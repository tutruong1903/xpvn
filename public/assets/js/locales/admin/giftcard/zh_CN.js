window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.giftcard = window.i18nLocales.admin.giftcard || {};

window.i18nLocales.admin.giftcard.zh_CN = {
    index: {
        title:              "礼品卡列表",
        subtitle:           "查看并管理所有礼品卡。",
        search_placeholder: "按ID或卡号搜索…",
        create_btn:         "创建",
        delete_confirm:     "确定删除此礼品卡？",
        stat_total:         "总礼品卡数",
        stat_unused:        "未使用",
        stat_used:          "已使用",
    },
    fields: {
        op:          "操作",
        id:          "礼品卡ID",
        card:        "卡号",
        balance:     "面值",
        create_time: "创建时间",
        status:      "使用状态",
        use_time:    "使用时间",
        use_user:    "使用用户",
    },
    create_modal: {
        title:      "创建礼品卡",
        cancel_btn: "取消",
        submit_btn: "创建",
        // Field labels
        field_card_number: "创建数量",
        field_card_value:  "礼品卡面值",
        field_card_length: "礼品卡长度",
        // Select options
        opt_12: "12位",
        opt_18: "18位",
        opt_24: "24位",
        opt_30: "30位",
        opt_36: "36位",
    },
    badges: {
        unused: "未使用",
        used:   "已使用",
    },
};
