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
