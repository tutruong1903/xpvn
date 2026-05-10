window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.invoice = window.i18nLocales.user.invoice || {};

window.i18nLocales.user.invoice.zh_CN = {
    // 账单列表页
    index_title:              "账单列表",
    index_subtitle:           "查看并管理账户中的账单。",
    index_search_placeholder: "快速搜索 ID、金额或状态...",
    index_stat_total:         "总账单数",
    index_stat_unpaid:        "待付款",
    index_stat_paid:          "已支付",
    index_stat_total_paid:    "累计支付 ($)",

    // 列标题
    fields: {
        op:          "操作",
        id:          "账单ID",
        order_id:    "订单ID",
        price:       "账单金额",
        status:      "账单状态",
        create_time: "创建时间",
        update_time: "更新时间",
        pay_time:    "支付时间",
    },
};
