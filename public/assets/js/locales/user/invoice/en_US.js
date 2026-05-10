window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.invoice = window.i18nLocales.user.invoice || {};

window.i18nLocales.user.invoice.en_US = {
    // Invoice list page
    index_title:              "Invoice List",
    index_subtitle:           "View and manage invoices in your account.",
    index_search_placeholder: "Quick search ID, amount or status...",
    index_stat_total:         "Total Invoices",
    index_stat_unpaid:        "Unpaid",
    index_stat_paid:          "Paid",
    index_stat_total_paid:    "Total Paid ($)",

    // Invoice view page
    view_title:              "Invoice Details",
    view_btn_order:          "View Order",
    section_basic_info:      "Basic Information",
    section_invoice_details: "Invoice Details",
    section_payment:         "Payment",
    tab_balance_pay:         "Balance Payment",
    tab_gateway_pay:         "Gateway Payment",
    label_order_id:          "Order ID",
    label_invoice_amount:    "Invoice Amount",
    label_invoice_status:    "Invoice Status",
    label_create_time:       "Created At",
    label_update_time:       "Updated At",
    label_pay_time:          "Paid At",
    label_gateway_tradeno:   "Gateway Transaction ID",
    label_item_name:         "Item Name",
    label_item_price:        "Price",
    label_balance_available: "Available Balance",
    btn_pay:                 "Pay Now",
    no_payment_method:       "No payment methods available",

    // Table column headers
    fields: {
        op:          "Actions",
        id:          "Invoice ID",
        order_id:    "Order ID",
        price:       "Amount",
        status:      "Status",
        create_time: "Created At",
        update_time: "Updated At",
        pay_time:    "Paid At",
    },
};
