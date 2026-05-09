window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.invoice = window.i18nLocales.admin.invoice || {};

window.i18nLocales.admin.invoice.zh_CN = {
    index: {
        title:              "账单列表",
        subtitle:           "管理所有用户账单。",
        search_placeholder: "按ID或用户搜索…",
        mark_paid_confirm:  "确定将此账单标记为已支付（管理员）？",
        stat_total:         "总账单数",
        stat_paid:          "已支付",
        stat_unpaid:        "未支付",
        stat_cancelled:     "已取消",
    },
    fields: {
        op:          "操作",
        id:          "账单ID",
        user_id:     "归属用户",
        order_id:    "订单ID",
        price:       "账单金额",
        status:      "账单状态",
        create_time: "创建时间",
        update_time: "更新时间",
        pay_time:    "支付时间",
    },
    badges: {
        unpaid:           "未支付",
        paid_gateway:     "已支付（支付网关）",
        paid_balance:     "已支付（账户余额）",
        paid_admin:       "已支付（管理员）",
        cancelled:        "已取消",
        refunded_balance: "已退款（账户余额）",
        partially_paid:   "部分支付",
    },
};
