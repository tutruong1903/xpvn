window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.im = window.i18nLocales.admin.im || {};

window.i18nLocales.admin.im.en_US = {
    index: {
        title:    "IM Settings",
        subtitle: "Manage the IM integrations for your site.",
        save_btn: "Save",

        tab_notification: "Notification",
        tab_telegram:     "Telegram Bot",
        tab_discord:      "Discord Bot",
        tab_slack:        "Slack Bot",

        // Notification toggles
        notify_add_node:    "Node Addition",
        notify_update_node: "Node Update",
        notify_delete_node: "Node Deletion",
        notify_node_gfwed:    "Node GFWed",
        notify_node_ungfwed:  "Node UnGFWed",
        notify_node_online:   "Node Online",
        notify_node_offline:  "Node Offline",
        notify_daily_job:     "Daily Job",
        notify_diary:         "System Diary",
        notify_ann_create:    "Announcement Creation",
        notify_ann_update:    "Announcement Update",

        // Telegram
        tg_unbind_kick:     "Auto-kick on Telegram unbind",
        tg_group_bound:     "Only allow bound users to join group",
        tg_welcome_msg:     "Bot sends welcome message",
        tg_group_quiet:     "Bot stays quiet in group",
        tg_allow_new_group: "Allow bot to join other groups",
        tg_group_id_allow:  "Allowed group IDs",
        tg_help_any_cmd:    "Any unknown command triggers /help",
        tg_test_chat_id:    "Telegram Chat ID (Group/DM)",
        tg_send_test:       "Send Test Message",
        tg_set_webhook:     "Set Webhook",
        tg_reset_token:     "Reset Webhook Token",

        // Discord
        discord_test_label: "Discord User ID / Channel ID",
        discord_send_test:  "Send Test Message",

        // Slack
        slack_test_label:   "Slack User ID / Channel ID",
        slack_send_test:    "Send Test Message",

        enable:  "Enable",
        disable: "Disable",
    },
};
