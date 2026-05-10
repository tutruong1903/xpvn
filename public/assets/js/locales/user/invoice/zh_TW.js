window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.invoice = window.i18nLocales.user.invoice || {};

window.i18nLocales.user.invoice.zh_TW = {
    // 帳單列表頁
    index_title:              "帳單列表",
    index_subtitle:           "查看並管理帳戶中的帳單。",
    index_search_placeholder: "快速搜尋 ID、金額或狀態...",
    index_stat_total:         "總帳單數",
    index_stat_unpaid:        "待付款",
    index_stat_paid:          "已支付",
    index_stat_total_paid:    "累計支付 ($)",

    // 帳單詳情頁
    view_title:              "帳單詳情",
    view_btn_order:          "查看訂單",
    section_basic_info:      "基本資訊",
    section_invoice_details: "帳單明細",
    section_payment:         "支付",
    tab_balance_pay:         "餘額支付",
    tab_gateway_pay:         "閘道支付",
    label_order_id:          "訂單ID",
    label_invoice_amount:    "帳單金額",
    label_invoice_status:    "帳單狀態",
    label_create_time:       "建立時間",
    label_update_time:       "更新時間",
    label_pay_time:          "付款時間",
    label_gateway_tradeno:   "閘道單號",
    label_item_name:         "名稱",
    label_item_price:        "價格",
    label_balance_available: "目前可用餘額",
    btn_pay:                 "立即支付",
    no_payment_method:       "目前無可用支付方式",

    // 列標題
    fields: {
        op:          "操作",
        id:          "帳單ID",
        order_id:    "訂單ID",
        price:       "帳單金額",
        status:      "帳單狀態",
        create_time: "建立時間",
        update_time: "更新時間",
        pay_time:    "付款時間",
    },
};
