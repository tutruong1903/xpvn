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
    },

    create: {
        title:            "创建文档",
        subtitle:         "为用户撰写并发布新文档。",
        settings_title:   "发布设置",

        field_title:      "文档标题",
        ph_title:         "在此输入精彩标题...",

        field_status:     "状态",
        status_draft:     "未发布",
        status_published: "已发布",

        field_sort:       "显示排序",

        llm_btn:          "AI 生成",
        llm_modal_title:  "使用 LLM 自动生成文档",
        llm_ph:           "请输入文档生成提示",
        llm_cancel:       "取消",
        llm_generate:     "生成",

        save_btn:         "保存文档",
        cancel_btn:       "取消更改"
    },

    edit: {
        title:            "编辑文档",
        subtitle:         "更新该文档的内容与发布设置。",
        settings_title:   "发布设置",

        field_title:      "文档标题",

        field_status:     "状态",
        status_draft:     "未发布",
        status_published: "已发布",

        field_sort:       "显示排序",

        save_btn:         "保存更改",
        cancel_btn:       "取消更改"
    }
};
