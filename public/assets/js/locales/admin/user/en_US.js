window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.user = window.i18nLocales.admin.user || {};

window.i18nLocales.admin.user.en_US = {
    // User list page
    index: {
        title: "User List",
        subtitle: "Manage and monitor all accounts in the system.",
        create_btn: "Create",
        create_dialog_title: "Add User",
        create_dialog_submit: "Add",
        filter_btn: "Filter",

        // Stats
        stat_total: "Total Users",
        stat_active: "Active Users",
        stat_banned: "Banned",
        stat_admins: "Administrators"
    },

    // Column headers
    fields: {
        op:              "Actions",
        id:              "ID",
        user_name:       "Username",
        email:           "Email",
        money:           "Balance",
        ref_by:          "Referred By",
        transfer_enable: "Traffic Limit",
        transfer_used:   "Used Traffic",
        class:           "Level",
        is_admin:        "Admin?",
        is_banned:       "Status",
        is_inactive:     "Inactive?",
        reg_date:        "Created At",
        class_expire:    "Expires"
    },

    // Badge values (status, level)
    badges: {
        active:        "Active",
        banned:        "Banned",
        inactive:      "Inactive",
        class_basic:   "Basic",
        class_std:     "Standard",
        class_premium: "Premium",
        class_vip:     "VIP"
    },

    // DataTable strings
    datatable: {
        search_placeholder: "Quick search ID, name or email...",
        processing: "Processing...",
        length_menu: "Show _MENU_",
        zero_records: "No matching records found",
        info: "Showing _START_ to _END_ of _TOTAL_ entries",
        info_empty: "Showing 0 to 0 of 0 entries",
        info_filtered: "(filtered from _MAX_ total entries)",
        empty_table: "No data available",
        loading: "Loading...",
        page_first: "First",
        page_last: "Last",
        sort_asc: ": activate to sort ascending",
        sort_desc: ": activate to sort descending",
        filter_all: "All"
    }
};
