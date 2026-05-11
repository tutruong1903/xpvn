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
    },

    create: {
        title:            "创建公告",
        subtitle:         "向用户发布重要新闻和公告。",
        settings_title:   "发布设置",

        field_status:     "状态",
        status_draft:     "未发布",
        status_published: "已发布",
        status_pinned:    "置顶",

        field_sort:       "显示排序",
        field_email_class:"邮件通知等级",
        class_all:        "0 — 所有成员",
        class_standard:   "1 — 标准及以上",
        class_premium:    "2 — 高级及以上",
        class_vip:        "3 — 仅 VIP",
        hint_class:       "0 = 所有成员",

        field_email_notify:  "发送邮件通知",
        email_notify_desc:   "公告将通过邮箱发送",

        save_btn:   "保存公告",
        cancel_btn: "取消更改"
    },

    edit: {
        title:          "编辑公告",
        subtitle:       "更新该公告的内容与发布设置。",
        settings_title: "发布设置",

        field_status:     "状态",
        status_draft:     "未发布",
        status_published: "已发布",
        status_pinned:    "置顶",

        field_sort: "显示排序",

        save_btn:   "保存更改",
        cancel_btn: "取消更改"
    }
};
