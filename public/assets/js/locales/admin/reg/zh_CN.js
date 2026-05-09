window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.reg = window.i18nLocales.admin.reg || {};

window.i18nLocales.admin.reg.zh_CN = {
    index: {
        title:    "注册设置",
        subtitle: "管理站点的注册设置。",
        save_btn: "保存",

        tab_reg:     "注册设置",
        tab_default: "默认值",

        reg_mode:          "注册模式",
        reg_mode_close:    "关闭注册",
        reg_mode_open:     "公开注册",
        reg_mode_invite:   "仅限用户邀请注册",
        reg_email_verify:  "邮箱验证",
        reg_daily_report:  "默认接收每日用量邮件推送",

        random_group:              "注册时随机分配到的分组，多个分组请用英文半角逗号分隔",
        min_port:                  "用户端口池最小值，设为 0 时用户不会被分配端口",
        max_port:                  "用户端口池最大值，设为 0 时用户不会被分配端口",
        reg_traffic:               "注册时赠送的流量（GB）",
        free_user_reset_day:       "免费用户的流量重置日，设为 0 时不重置",
        free_user_reset_bandwidth: "需要重置的免费流量，设为 0 时不重置",
        reg_class:                 "注册等级",
        reg_class_time:            "注册等级过期时间（天）",
        reg_method:                "默认加密",
        reg_ip_limit:              "连接 IP 限制",
        reg_speed_limit:           "使用速率限制",

        enable:  "开启",
        disable: "关闭",
    },
};
