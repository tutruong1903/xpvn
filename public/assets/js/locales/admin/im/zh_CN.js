window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.im = window.i18nLocales.admin.im || {};

window.i18nLocales.admin.im.zh_CN = {
    index: {
        title:    "即时消息设置",
        subtitle: "管理站点的即时消息集成。",
        save_btn: "保存",

        tab_notification: "通知",
        tab_telegram:     "Telegram Bot",
        tab_discord:      "Discord Bot",
        tab_slack:        "Slack Bot",

        notify_add_node:    "节点新增",
        notify_update_node: "节点更新",
        notify_delete_node: "节点删除",
        notify_node_gfwed:    "节点被墙",
        notify_node_ungfwed:  "节点解封",
        notify_node_online:   "节点上线",
        notify_node_offline:  "节点下线",
        notify_daily_job:     "每日任务",
        notify_diary:         "系统日志",
        notify_ann_create:    "公告创建",
        notify_ann_update:    "公告更新",

        tg_unbind_kick:     "Telegram 解绑时自动踢出群组",
        tg_group_bound:     "仅允许已绑定用户加入群组",
        tg_welcome_msg:     "Bot 发送欢迎消息",
        tg_group_quiet:     "Bot 在群组中保持静默",
        tg_allow_new_group: "允许 Bot 加入其他群组",
        tg_group_id_allow:  "允许加入的群组 ID",
        tg_help_any_cmd:    "未知命令触发 /help",
        tg_test_chat_id:    "Telegram Chat ID（群组/私信）",
        tg_send_test:       "发送测试消息",
        tg_set_webhook:     "设置 Webhook",
        tg_reset_token:     "重置 Webhook Token",

        discord_test_label: "Discord 用户 ID / 频道 ID",
        discord_send_test:  "发送测试消息",

        slack_test_label:   "Slack 用户 ID / 频道 ID",
        slack_send_test:    "发送测试消息",

        enable:  "开启",
        disable: "关闭",
    },
};
