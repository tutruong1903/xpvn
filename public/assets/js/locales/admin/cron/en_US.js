window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.cron = window.i18nLocales.admin.cron || {};

window.i18nLocales.admin.cron.en_US = {
    index: {
        title:    "Scheduled Tasks",
        subtitle: "Manage scheduled jobs for your site.",
        save_btn: "Save",

        tab_daily:    "Daily Job",
        tab_finance:  "Finance Report",
        tab_detect:   "Audit Tasks",
        tab_inactive: "Inactive User Detection",

        daily_hour:   "Daily job execution hour",
        daily_minute: "Daily job execution minute",

        finance_daily:   "Enable daily finance report",
        finance_weekly:  "Enable weekly finance report",
        finance_monthly: "Enable monthly finance report",

        detect_gfw: "Enable node GFW detection",
        detect_ban: "Enable audit ban",

        detect_inactive:       "Enable inactive user detection",
        inactive_checkin_days: "Days since last check-in",
        inactive_login_days:   "Days since last login",
        inactive_use_days:     "Days since last traffic use",
        remove_sub:            "Remove subscription link and invite code for inactive users",

        save_success:   "Settings saved successfully.",
        save_failed:    "Failed to save settings.",
        hour_invalid:   "Hour must be between 0 and 23.",
        minute_invalid: "Minute must be between 0 and 59.",

        enable:  "Enable",
        disable: "Disable",
    },
};
