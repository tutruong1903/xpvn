window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.reg = window.i18nLocales.admin.reg || {};

window.i18nLocales.admin.reg.en_US = {
    index: {
        title:    "Registration Settings",
        subtitle: "Manage the registration settings for your site.",
        save_btn: "Save",

        tab_reg:     "Registration Settings",
        tab_default: "Default Values",

        reg_mode:          "Registration Mode",
        reg_mode_close:    "Closed",
        reg_mode_open:     "Public",
        reg_mode_invite:   "Invite Only",
        reg_email_verify:  "Email Verification",
        reg_daily_report:  "Daily Usage Email (default on)",

        random_group:              "Random group assigned at registration (comma-separated)",
        min_port:                  "User port pool minimum (0 = no port assigned)",
        max_port:                  "User port pool maximum (0 = no port assigned)",
        reg_traffic:               "Traffic gift at registration (GB)",
        free_user_reset_day:       "Free user traffic reset day (0 = no reset)",
        free_user_reset_bandwidth: "Free bandwidth to reset (0 = no reset)",
        reg_class:                 "Default user class",
        reg_class_time:            "Default class expiry (days)",
        reg_method:                "Default encryption method",
        reg_ip_limit:              "Connection IP limit",
        reg_speed_limit:           "Speed limit (Mbps)",

        enable:  "Enable",
        disable: "Disable",
    },
};
