window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.user = window.i18nLocales.admin.user || {};

window.i18nLocales.admin.user.zh_TW = {
    // 用戶列表頁
    index: {
        title: "用戶列表",
        subtitle: "管理和監控系統中的所有帳戶。",
        create_btn: "建立",
        create_dialog_title: "新增用戶",
        create_dialog_submit: "新增",
        filter_btn: "篩選",
        delete_confirm: "確定刪除此用戶？",

        // 統計
        stat_total: "總用戶數",
        stat_active: "活躍用戶",
        stat_banned: "已封禁",
        stat_admins: "管理員"
    },

    // 欄位標題
    fields: {
        op:              "操作",
        id:              "用戶ID",
        user_name:       "昵稱",
        email:           "信筱",
        money:           "餘額",
        ref_by:          "推薦人",
        transfer_enable: "流量限制",
        transfer_used:   "已用流量",
        class:           "等級",
        is_admin:        "是否管理員",
        is_banned:       "是否封禁",
        is_inactive:     "是否閄置",
        reg_date:        "註冊時間",
        class_expire:    "等級到期"
    },

    // Badge 值
    badges: {
        active:        "正常",
        banned:        "已封禁",
        inactive:      "閄置",
        class_basic:   "基礎",
        class_std:     "標準",
        class_premium: "高級",
        class_vip:     "VIP"
    },

    // 用戶編輯頁
    edit: {
        // 頁頭
        title: "管理控制台",
        breadcrumb_dashboard: "儀表板",
        breadcrumb_users: "用戶",
        breadcrumb_edit: "編輯",
        save_btn: "儲存變更",
        cancel_btn: "取消",

        // 區塊標題
        section_account: "帳戶資訊",
        section_usage: "使用限制",
        section_other: "其他設定",
        section_history: "活動紀錄",

        // 帳戶欄位
        field_email: "信箱",
        field_username: "用戶名",
        field_password: "密碼（留空則不修改）",
        field_balance: "餘額",
        field_ref_by: "推薦人",
        field_port: "SS連接埠",
        field_method: "加密方式",

        // 活動紀錄
        history_reg_ip: "註冊IP",
        history_reg_date: "註冊日期",
        history_last_use: "最後使用時間",
        history_last_checkin: "最後簽到時間",
        history_last_login: "最後登入時間",

        // 使用限制欄位
        field_transfer_enable: "流量限制 (GB)",
        field_transfer_used: "本期用量",
        field_transfer_total: "累計用量",
        field_class: "等級",
        field_node_group: "節點群組",
        field_class_expire: "等級到期時間",
        field_auto_reset_day: "流量重置日",
        field_auto_reset_bandwidth: "重置流量 (GB)",
        field_speedlimit: "速度限制 (Mbps)",
        field_iplimit: "同時連線限制",

        // 其他設定欄位
        field_locale: "顯示語言",
        field_is_admin: "管理員權限",
        field_ga_enable: "兩步驗證",
        field_is_shadow_banned: "帳戶異常狀態",
        field_is_banned: "封禁用戶",
        field_banned_reason: "封禁理由",
        field_remark: "帳戶備註",

        // 等級選項
        level_basic: "基礎",
        level_standard: "標準",
        level_premium: "高級",
        level_vip: "VIP",

        // Badge
        badge_2fa_active: "已啟用",

        // 佔位符
        ph_password: "留空不修改密碼",
        ph_banned_reason: "輸入封禁理由...",
        ph_remark: "僅管理員可見..."
    },

    // DataTable
    datatable: {
        search_placeholder: "快速搜尋 ID、暱稱或信箱...",
        processing: "處理中...",
        length_menu: "顯示 _MENU_ 筆",
        zero_records: "沒有符合的結果",
        info: "第 _START_ 至 _END_ 筆，共 _TOTAL_ 筆",
        info_empty: "第 0 至 0 筆，共 0 筆",
        info_filtered: "（從 _MAX_ 筆中過濾）",
        empty_table: "表格無資料",
        loading: "載入中...",
        page_first: "第一頁",
        page_last: "最後一頁",
        sort_asc: ": 啟用以升序排列",
        sort_desc: ": 啟用以降序排列",
        filter_all: "全部"
    }
};
