window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.invoice = window.i18nLocales.admin.invoice || {};

window.i18nLocales.admin.invoice.en_US = {
    index: {
        title:              "Invoice List",
        subtitle:           "Manage all customer invoices.",
        search_placeholder: "Search by ID or user...",
        mark_paid_confirm:  "Mark this invoice as paid (Admin)?",
        stat_total:         "Total Invoices",
        stat_paid:          "Paid",
        stat_unpaid:        "Unpaid",
        stat_cancelled:     "Cancelled",
    },
    fields: {
        op:          "Actions",
        id:          "Invoice ID",
        user_id:     "User ID",
        order_id:    "Order ID",
        price:       "Amount",
        status:      "Status",
        create_time: "Created At",
        update_time: "Updated At",
        pay_time:    "Paid At",
    },
    badges: {
        unpaid:           "Unpaid",
        paid_gateway:     "Paid (Gateway)",
        paid_balance:     "Paid (Balance)",
        paid_admin:       "Paid (Admin)",
        cancelled:        "Cancelled",
        refunded_balance: "Refunded (Balance)",
        partially_paid:   "Partially Paid",
    },
};
