window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.cron = window.i18nLocales.admin.cron || {};

window.i18nLocales.admin.cron.zh_CN = {
    index: {
        title:    "定时任务设置",
        subtitle: "管理站点的定时任务。",
        save_btn: "保存",

        tab_daily:    "每日任务",
        tab_finance:  "财务报告",
        tab_detect:   "审计任务",
        tab_inactive: "闲置账号检测",

        daily_hour:   "每日任务执行时间（小时）",
        daily_minute: "每日任务执行时间（分钟）",

        finance_daily:   "是否启用每日财务报告",
        finance_weekly:  "是否启用每周财务报告",
        finance_monthly: "是否启用每月财务报告",

        detect_gfw: "是否启用节点被墙检测",
        detect_ban: "是否启用审计封禁",

        detect_inactive:       "是否启用闲置账号检测",
        inactive_checkin_days: "未签到时长（天）",
        inactive_login_days:   "未登录时长（天）",
        inactive_use_days:     "未使用时长（天）",
        remove_sub:            "是否启用移除闲置账号订阅链接与邀请码",

        save_success:   "保存成功。",
        save_failed:    "保存失败。",
        hour_invalid:   "每日任务执行时间的小时数必须在 0-23 之间。",
        minute_invalid: "每日任务执行时间的分钟数必须在 0-59 之间。",

        enable:  "开启",
        disable: "关闭",
    },
};
