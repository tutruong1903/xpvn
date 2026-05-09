window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.giftcard = window.i18nLocales.admin.giftcard || {};

window.i18nLocales.admin.giftcard.en_US = {
    index: {
        title:              "Gift Card List",
        subtitle:           "View and manage gift cards.",
        search_placeholder: "Search by ID or card number...",
        create_btn:         "Create",
        delete_confirm:     "Are you sure you want to delete this gift card?",
        stat_total:         "Total Cards",
        stat_unused:        "Unused",
        stat_used:          "Used",
    },
    fields: {
        op:          "Actions",
        id:          "Card ID",
        card:        "Card Number",
        balance:     "Face Value",
        create_time: "Created At",
        status:      "Status",
        use_time:    "Used At",
        use_user:    "Used By",
    },
    create_modal: {
        title:      "Create Gift Cards",
        cancel_btn: "Cancel",
        submit_btn: "Create",
        // Field labels
        field_card_number: "Quantity",
        field_card_value:  "Face Value",
        field_card_length: "Card Length",
        // Select options
        opt_12: "12 digits",
        opt_18: "18 digits",
        opt_24: "24 digits",
        opt_30: "30 digits",
        opt_36: "36 digits",
    },
    badges: {
        unused: "Unused",
        used:   "Used",
    },
};
