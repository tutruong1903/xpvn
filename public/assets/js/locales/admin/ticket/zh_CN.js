window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ticket = window.i18nLocales.admin.ticket || {};

window.i18nLocales.admin.ticket.zh_CN = {
    // 工单列表页
    index: {
        title:               "工单列表",
        subtitle:            "查看并回复用户工单",
        search_placeholder:  "快速搜索 ID、主题或用户...",
        filter_btn:          "筛选",
        delete_confirm:      "确定删除此工单？",
        close_confirm:       "确定关闭此工单？",

        stat_total:          "总工单数",
        stat_open:           "进行中",
        stat_closed:         "已结单",
        stat_wait_admin:     "等待管理员"
    },

    // 列标题
    fields: {
        op:       "操作",
        id:       "工单ID",
        title:    "主题",
        status:   "工单状态",
        type:     "工单类型",
        userid:   "提交用户",
        datetime: "创建时间"
    },

    // 筛选面板
    filter: {
        status_label:      "状态",
        type_label:        "类型",
        all:               "全部",
        status_open:       "进行中",
        status_closed:     "已结单",
        status_wait_user:  "等待用户回复",
        status_wait_admin: "等待管理员"
    },

    // 徽标标签
    badges: {
        status_open_wait_admin: "进行中",
        status_open_wait_user:  "等待用户回复",
        status_closed:          "已结单",
        type_howto:             "使用说明",
        type_billing:           "支付",
        type_account:           "账户",
        type_other:             "其他"
    }
};
