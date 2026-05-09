window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.invoice = window.i18nLocales.admin.invoice || {};

window.i18nLocales.admin.invoice.zh_TW = {
    index: {
        title:              "帳單列表",
        subtitle:           "管理所有用戶帳單。",
        search_placeholder: "按ID或用戶搜尋…",
        mark_paid_confirm:  "確定將此帳單標記為已付款（管理員）？",
        stat_total:         "總帳單數",
        stat_paid:          "已付款",
        stat_unpaid:        "未付款",
        stat_cancelled:     "已取消",
    },
    fields: {
        op:          "操作",
        id:          "帳單ID",
        user_id:     "歸屬用戶",
        order_id:    "訂單ID",
        price:       "帳單金額",
        status:      "帳單狀態",
        create_time: "建立時間",
        update_time: "更新時間",
        pay_time:    "付款時間",
    },
    badges: {
        unpaid:           "未付款",
        paid_gateway:     "已付款（支付閘道）",
        paid_balance:     "已付款（帳戶餘額）",
        paid_admin:       "已付款（管理員）",
        cancelled:        "已取消",
        refunded_balance: "已退款（帳戶餘額）",
        partially_paid:   "部分付款",
    },
};
