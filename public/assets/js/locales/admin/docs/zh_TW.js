window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.docs = window.i18nLocales.admin.docs || {};

window.i18nLocales.admin.docs.zh_TW = {
    index: {
        title:              "文檔管理",
        subtitle:           "查看並管理站點中的文檔",
        create_btn:         "建立",
        search_placeholder: "快速搜尋 ID 或標題...",
        delete_confirm:     "確定刪除此文檔？",

        stat_total:     "總文檔數",
        stat_published: "已發布",
        stat_draft:     "未發布"
    },

    fields: {
        op:     "操作",
        id:     "ID",
        status: "狀態",
        sort:   "排序",
        date:   "日期",
        title:  "標題"
    },

    filter: {
        status_label: "狀態",
        all:          "全部",
        published:    "已發布",
        draft:        "未發布"
    },

    badges: {
        status_published: "已發布",
        status_draft:     "未發布",
        status_unknown:   "未知"
    },

    create: {
        title:            "建立文檔",
        subtitle:         "為用戶撰寫並發布新文檔。",
        settings_title:   "發布設定",

        field_title:      "文檔標題",
        ph_title:         "在此輸入精彩標題...",

        field_status:     "狀態",
        status_draft:     "未發布",
        status_published: "已發布",

        field_sort:       "顯示排序",

        llm_btn:          "AI 生成",
        llm_modal_title:  "使用 LLM 自動生成文檔",
        llm_ph:           "請輸入文檔生成提示",
        llm_cancel:       "取消",
        llm_generate:     "生成",

        save_btn:         "儲存文檔",
        cancel_btn:       "取消變更"
    },

    edit: {
        title:            "編輯文檔",
        subtitle:         "更新該文檔的內容與發布設定。",
        settings_title:   "發布設定",

        field_title:      "文檔標題",

        field_status:     "狀態",
        status_draft:     "未發布",
        status_published: "已發布",

        field_sort:       "顯示排序",

        save_btn:         "儲存變更",
        cancel_btn:       "取消變更"
    }
};
