window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ann = window.i18nLocales.admin.ann || {};

window.i18nLocales.admin.ann.zh_TW = {
    index: {
        title:              "公告管理",
        subtitle:           "查看並管理站點中的公告",
        create_btn:         "建立",
        search_placeholder: "快速搜尋 ID 或內容...",
        delete_confirm:     "確定刪除此公告？",

        stat_total:     "總公告數",
        stat_published: "已發布",
        stat_pinned:    "置頂",
        stat_draft:     "未發布"
    },

    fields: {
        op:      "操作",
        id:      "ID",
        status:  "狀態",
        sort:    "排序",
        date:    "日期",
        content: "內容（節選）"
    },

    filter: {
        status_label: "狀態",
        all:          "全部",
        published:    "已發布",
        pinned:       "置頂",
        draft:        "未發布"
    },

    badges: {
        status_published: "已發布",
        status_pinned:    "置頂",
        status_draft:     "未發布",
        status_unknown:   "未知"
    }
};
