window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.coupon = window.i18nLocales.admin.coupon || {};

window.i18nLocales.admin.coupon.zh_CN = {
    index: {
        title:           "优惠码列表",
        subtitle:        "查看并管理所有优惠码。",
        search_placeholder: "按ID或优惠码搜索…",
        create_btn:      "创建",
        delete_confirm:  "确定删除此优惠码？",
        disable_confirm: "确定禁用此优惠码？",
        stat_total:      "总优惠码数",
        stat_active:     "启用中",
        stat_disabled:   "已禁用",
    },
    fields: {
        op:             "操作",
        id:             "ID",
        code:           "优惠码",
        type:           "类型",
        value:          "额度",
        product_id:     "可用商品ID",
        use_time:       "每用户使用次数",
        total_use_time: "累计使用次数",
        new_user:       "仅限新用户",
        disabled:       "已禁用",
        use_count:      "已使用次数",
        create_time:    "创建时间",
        expire_time:    "过期时间",
    },
    create_modal: {
        title:        "创建优惠码",
        expire_label: "过期时间（留空则为不限制）",
        cancel_btn:   "取消",
        submit_btn:   "创建",
        // Field labels
        field_code:             "优惠码",
        field_type:             "优惠码类型",
        field_value:            "优惠码额度",
        field_product_id:       "可用商品ID（多个ID以英文半角逗号分隔）",
        field_use_time:         "每个用户可使用次数限制（小于0为不限）",
        field_total_use_time:   "累计可使用次数限制（小于0为不限）",
        field_new_user:         "仅限新用户使用",
        field_generate_method:  "生成方式",
        // Select options
        opt_percentage:   "百分比",
        opt_fixed:        "固定金额",
        opt_1:            "是",
        opt_0:            "否",
        opt_char:         "指定字符",
        opt_random:       "随机字符（无视优惠码参数）",
        opt_char_random:  "指定字符+随机字符",
    },
    badges: {
        percentage: "百分比",
        fixed:      "固定金额",
        unlimited:  "不限次数",
        never:      "永久有效",
        yes:        "是",
        no:         "否",
    },
};
