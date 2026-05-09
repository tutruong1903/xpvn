window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.order = window.i18nLocales.admin.order || {};

window.i18nLocales.admin.order.en_US = {
    // Order list page
    index: {
        title:              "Order List",
        subtitle:           "Manage all customer orders.",
        search_btn:         "Find by Gateway ID",
        search_placeholder: "Search by ID or user...",
        delete_confirm:     "Are you sure you want to delete this order?",
        cancel_confirm:     "Are you sure you want to cancel this order? If the associated invoice has been paid, it will be refunded to the user's balance.",

        stat_total:    "Total Orders",
        stat_pending:  "Pending",
        stat_active:   "Activated",
        stat_cancelled:"Cancelled",
    },

    // Column labels
    fields: {
        op:           "Actions",
        id:           "Order ID",
        user_id:      "User ID",
        product_id:   "Product ID",
        product_type: "Type",
        product_name: "Product Name",
        coupon:       "Coupon",
        price:        "Amount",
        status:       "Status",
        create_time:  "Created At",
        update_time:  "Updated At",
    },

    // Gateway search modal
    search_modal: {
        title:        "Find Order",
        label:        "Gateway Order ID",
        cancel_btn:   "Cancel",
        submit_btn:   "Find",
    },

    // Status & type badges (for badge translation)
    badges: {
        pending_payment:     "Pending Payment",
        pending_activation:  "Pending Activation",
        activated:           "Activated",
        expired:             "Expired",
        cancelled:           "Cancelled",
        type_tabp:           "Time+Traffic",
        type_time:           "Time",
        type_bandwidth:      "Bandwidth",
        type_topup:          "Top-up",
    },
};
