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
