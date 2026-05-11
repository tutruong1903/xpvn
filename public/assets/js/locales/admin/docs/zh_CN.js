window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.docs = window.i18nLocales.admin.docs || {};

window.i18nLocales.admin.docs.zh_CN = {
    index: {
        title:              "文档管理",
        subtitle:           "查看并管理站点中的文档",
        create_btn:         "创建",
        search_placeholder: "快速搜索 ID 或标题...",
        delete_confirm:     "确定删除此文档？",

        stat_total:     "总文档数",
        stat_published: "已发布",
        stat_draft:     "未发布"
    },

    fields: {
        op:     "操作",
        id:     "ID",
        status: "状态",
        sort:   "排序",
        date:   "日期",
        title:  "标题"
    },

    filter: {
        status_label: "状态",
        all:          "全部",
        published:    "已发布",
        draft:        "未发布"
    },

    badges: {
        status_published: "已发布",
        status_draft:     "未发布",
        status_unknown:   "未知"
    }
};
