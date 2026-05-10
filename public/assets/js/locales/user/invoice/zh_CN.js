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

    // 账单详情页
    view_title:              "账单详情",
    view_btn_order:          "查看订单",
    section_basic_info:      "基本信息",
    section_invoice_details: "账单明细",
    section_payment:         "支付",
    tab_balance_pay:         "余额支付",
    tab_gateway_pay:         "网关支付",
    label_order_id:          "订单ID",
    label_invoice_amount:    "账单金额",
    label_invoice_status:    "账单状态",
    label_create_time:       "创建时间",
    label_update_time:       "更新时间",
    label_pay_time:          "支付时间",
    label_gateway_tradeno:   "网关单号",
    label_item_name:         "名称",
    label_item_price:        "价格",
    label_balance_available: "当前可用余额",
    btn_pay:                 "立即支付",
    no_payment_method:       "暂无可用支付方式",

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
