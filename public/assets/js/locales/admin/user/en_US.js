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
        delete_confirm: "Are you sure you want to delete this user?",

        // Stats
        stat_total: "Total Users",
        stat_active: "Active Users",
        stat_banned: "Banned",
        stat_admins: "Administrators",
        search_placeholder: "Quick search ID, name or email..."
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

    // User edit page
    edit: {
        // Header
        title: "Admin Control Panel",
        breadcrumb_dashboard: "Dashboard",
        breadcrumb_users: "Users",
        breadcrumb_edit: "Edit",
        save_btn: "Save Changes",
        cancel_btn: "Cancel",

        // Section headings
        section_account: "Account Information",
        section_usage: "Usage Limits",
        section_other: "Other Settings",
        section_history: "Activity History",

        // Account fields
        field_email: "Email",
        field_username: "Username",
        field_password: "Password (Leave blank to keep)",
        field_balance: "Balance",
        field_ref_by: "Referred By",
        field_port: "SS Port",
        field_method: "Encryption",

        // Activity history
        history_reg_ip: "Registered IP",
        history_reg_date: "Registration Date",
        history_last_use: "Last Active",
        history_last_checkin: "Last Check-in",
        history_last_login: "Last Login Time",

        // Usage limit fields
        field_transfer_enable: "Traffic Limit (GB)",
        field_transfer_used: "Used This Period",
        field_transfer_total: "Total Usage",
        field_class: "Level",
        field_node_group: "Node Group",
        field_class_expire: "Level Expiry Date",
        field_auto_reset_day: "Traffic Reset Day",
        field_auto_reset_bandwidth: "Reset Traffic (GB)",
        field_speedlimit: "Speed Limit (Mbps)",
        field_iplimit: "Max Connections",

        // Other settings fields
        field_locale: "Display Language",
        field_is_admin: "Administrator",
        field_ga_enable: "Two-Factor Auth",
        field_is_shadow_banned: "Shadow Ban Status",
        field_is_banned: "Ban User",
        field_banned_reason: "Ban Reason",
        field_remark: "Admin Notes",

        // Level options
        level_basic: "Basic",
        level_standard: "Standard",
        level_premium: "Premium",
        level_vip: "VIP",

        // Badge
        badge_2fa_active: "Active",

        // Placeholders
        ph_password: "Leave blank to keep unchanged",
        ph_banned_reason: "Enter ban reason...",
        ph_remark: "Only visible to administrators..."
    }
};
