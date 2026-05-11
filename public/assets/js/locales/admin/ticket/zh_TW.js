window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ticket = window.i18nLocales.admin.ticket || {};

window.i18nLocales.admin.ticket.zh_TW = {
    // 工單列表頁
    index: {
        title:               "工單列表",
        subtitle:            "查看並回覆用戶工單",
        search_placeholder:  "快速搜尋 ID、主題或用戶...",
        filter_btn:          "篩選",
        delete_confirm:      "確定刪除此工單？",
        close_confirm:       "確定關閉此工單？",

        stat_total:          "總工單數",
        stat_open:           "進行中",
        stat_closed:         "已結單",
        stat_wait_admin:     "等待管理員"
    },

    // 欄標題
    fields: {
        op:       "操作",
        id:       "工單ID",
        title:    "主題",
        status:   "工單狀態",
        type:     "工單類型",
        userid:   "提交用戶",
        datetime: "建立時間"
    },

    // 篩選面板
    filter: {
        status_label:      "狀態",
        type_label:        "類型",
        all:               "全部",
        status_open:       "進行中",
        status_closed:     "已結單",
        status_wait_user:  "等待用戶回覆",
        status_wait_admin: "等待管理員"
    },

    // 徽標標籤
    badges: {
        status_open_wait_admin: "進行中",
        status_open_wait_user:  "等待用戶回覆",
        status_closed:          "已結單",
        type_howto:             "使用說明",
        type_billing:           "付款",
        type_account:           "帳戶",
        type_other:             "其他"
    }
};
