window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.coupon = window.i18nLocales.admin.coupon || {};

window.i18nLocales.admin.coupon.en_US = {
    index: {
        title:           "Coupon List",
        subtitle:        "View and manage discount coupons.",
        search_placeholder: "Search by ID or code...",
        create_btn:      "Create",
        delete_confirm:  "Are you sure you want to delete this coupon?",
        disable_confirm: "Are you sure you want to disable this coupon?",
        stat_total:      "Total Coupons",
        stat_active:     "Active",
        stat_disabled:   "Disabled",
    },
    fields: {
        op:             "Actions",
        id:             "ID",
        code:           "Code",
        type:           "Type",
        value:          "Value",
        product_id:     "Product ID(s)",
        use_time:       "Per-user Limit",
        total_use_time: "Total Limit",
        new_user:       "New User Only",
        disabled:       "Disabled",
        use_count:      "Used Count",
        create_time:    "Created At",
        expire_time:    "Expires At",
    },
    create_modal: {
        title:        "Create Coupon",
        expire_label: "Expiry (leave blank for unlimited)",
        cancel_btn:   "Cancel",
        submit_btn:   "Create",
        // Field labels
        field_code:             "Coupon Code",
        field_type:             "Type",
        field_value:            "Value",
        field_product_id:       "Applicable Product ID(s) (comma-separated)",
        field_use_time:         "Per-user Usage Limit (< 0 for unlimited)",
        field_total_use_time:   "Total Usage Limit (< 0 for unlimited)",
        field_new_user:         "New Users Only",
        field_generate_method:  "Generation Method",
        // Select options
        opt_percentage:   "Percentage",
        opt_fixed:        "Fixed Amount",
        opt_1:            "Yes",
        opt_0:            "No",
        opt_char:         "Specified Characters",
        opt_random:       "Random Characters (ignore code field)",
        opt_char_random:  "Specified + Random Characters",
    },
    badges: {
        percentage: "Percentage",
        fixed:      "Fixed",
        unlimited:  "Unlimited",
        never:      "Never",
        yes:        "Yes",
        no:         "No",
    },
};
