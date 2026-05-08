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
        delete_confirm: "确定删除此用户？",

        // 统计
        stat_total: "总用户数",
        stat_active: "活跃用户",
        stat_banned: "已封禁",
        stat_admins: "管理员",
        search_placeholder: "快速搜索 ID、昵称或邮箱..."
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

    // 用户编辑页
    edit: {
        // 页头
        title: "管理控制台",
        breadcrumb_dashboard: "仪表板",
        breadcrumb_users: "用户",
        breadcrumb_edit: "编辑",
        save_btn: "保存更改",
        cancel_btn: "取消",

        // 区块标题
        section_account: "账户信息",
        section_usage: "使用限制",
        section_other: "其他设置",
        section_history: "活动历史",

        // 账户字段
        field_email: "邮箱",
        field_username: "用户名",
        field_password: "密码（留空则不修改）",
        field_balance: "余额",
        field_ref_by: "邀请人",
        field_port: "SS端口",
        field_method: "加密方式",

        // 活动历史
        history_reg_ip: "注册IP",
        history_reg_date: "注册日期",
        history_last_use: "最后使用时间",
        history_last_checkin: "最后签到时间",
        history_last_login: "最后登录时间",

        // 使用限制字段
        field_transfer_enable: "流量限制 (GB)",
        field_transfer_used: "当期用量",
        field_transfer_total: "累计用量",
        field_class: "等级",
        field_node_group: "节点群组",
        field_class_expire: "等级过期时间",
        field_auto_reset_day: "流量重置日",
        field_auto_reset_bandwidth: "重置流量 (GB)",
        field_speedlimit: "速度限制 (Mbps)",
        field_iplimit: "同时连接限制",

        // 其他设置字段
        field_locale: "显示语言",
        field_is_admin: "管理员权限",
        field_ga_enable: "两步认证",
        field_is_shadow_banned: "账户异常状态",
        field_is_banned: "封禁用户",
        field_banned_reason: "封禁理由",
        field_remark: "账户备注",

        // 等级选项
        level_basic: "基础",
        level_standard: "标准",
        level_premium: "高级",
        level_vip: "VIP",

        // Badge
        badge_2fa_active: "已激活",

        // 占位符
        ph_password: "留空不修改密码",
        ph_banned_reason: "输入封禁理由...",
        ph_remark: "仅管理员可见..."
    }
};
