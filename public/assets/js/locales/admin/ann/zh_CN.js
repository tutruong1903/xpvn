window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ann = window.i18nLocales.admin.ann || {};

window.i18nLocales.admin.ann.zh_CN = {
    index: {
        title:              "公告管理",
        subtitle:           "查看并管理站点中的公告",
        create_btn:         "创建",
        search_placeholder: "快速搜索 ID 或内容...",
        delete_confirm:     "确定删除此公告？",

        stat_total:     "总公告数",
        stat_published: "已发布",
        stat_pinned:    "置顶",
        stat_draft:     "未发布"
    },

    fields: {
        op:      "操作",
        id:      "ID",
        status:  "状态",
        sort:    "排序",
        date:    "日期",
        content: "内容（节选）"
    },

    filter: {
        status_label: "状态",
        all:          "全部",
        published:    "已发布",
        pinned:       "置顶",
        draft:        "未发布"
    },

    badges: {
        status_published: "已发布",
        status_pinned:    "置顶",
        status_draft:     "未发布",
        status_unknown:   "未知"
    }
};
