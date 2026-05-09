window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.cron = window.i18nLocales.admin.cron || {};

window.i18nLocales.admin.cron.zh_TW = {
    index: {
        title:    "定時任務設定",
        subtitle: "管理站點的定時任務。",
        save_btn: "儲存",

        tab_daily:    "每日任務",
        tab_finance:  "財務報告",
        tab_detect:   "審計任務",
        tab_inactive: "閒置帳號檢測",

        daily_hour:   "每日任務執行時間（小時）",
        daily_minute: "每日任務執行時間（分鐘）",

        finance_daily:   "是否啟用每日財務報告",
        finance_weekly:  "是否啟用每週財務報告",
        finance_monthly: "是否啟用每月財務報告",

        detect_gfw: "是否啟用節點被封鎖檢測",
        detect_ban: "是否啟用審計封禁",

        detect_inactive:       "是否啟用閒置帳號檢測",
        inactive_checkin_days: "未簽到時長（天）",
        inactive_login_days:   "未登入時長（天）",
        inactive_use_days:     "未使用時長（天）",
        remove_sub:            "是否啟用移除閒置帳號訂閱連結與邀請碼",

        save_success:   "儲存成功。",
        save_failed:    "儲存失敗。",
        hour_invalid:   "每日任務執行時間的小時數必須在 0-23 之間。",
        minute_invalid: "每日任務執行時間的分鐘數必須在 0-59 之間。",

        enable:  "開啟",
        disable: "關閉",
    },
};
