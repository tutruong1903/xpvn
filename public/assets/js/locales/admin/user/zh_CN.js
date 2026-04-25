window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.user = window.i18nLocales.admin.user || {};

window.i18nLocales.admin.user.zh_CN = {
    // 用户列表页
    index: {
        title: "用户列表",
        subtitle: "管理和监控系统中的所有账户。",
        create_btn: "创建",
        create_dialog_title: "添加用户",
        create_dialog_submit: "添加",
        filter_btn: "筛选",

        // 统计
        stat_total: "总用户数",
        stat_active: "活跃用户",
        stat_banned: "已封禁",
        stat_admins: "管理员"
    },

    // 列标题
    fields: {
        op:              "操作",
        id:              "用户ID",
        user_name:       "昵称",
        email:           "邮筱",
        money:           "余额",
        ref_by:          "邀请人",
        transfer_enable: "流量限制",
        transfer_used:   "已用流量",
        class:           "等级",
        is_admin:        "是否管理员",
        is_banned:       "是否封禁",
        is_inactive:     "是否闲置",
        reg_date:        "注册时间",
        class_expire:    "等级过期"
    },

    // Badge 值
    badges: {
        active:        "正常",
        banned:        "已封禁",
        inactive:      "闲置",
        class_basic:   "基础",
        class_std:     "标准",
        class_premium: "高级",
        class_vip:     "VIP"
    },

    // DataTable
    datatable: {
        search_placeholder: "快速搜索 ID、昵称或邮箱...",
        processing: "处理中...",
        length_menu: "显示 _MENU_ 条",
        zero_records: "没有匹配结果",
        info: "第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
        info_empty: "第 0 至 0 项结果，共 0 项",
        info_filtered: "(在 _MAX_ 项中查找)",
        empty_table: "表中数据为空",
        loading: "载入中...",
        page_first: "首页",
        page_last: "末页",
        sort_asc: ": 以升序排列此列",
        sort_desc: ": 以降序排列此列",
        filter_all: "全部"
    }
};
