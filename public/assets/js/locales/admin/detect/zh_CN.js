window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.detect = window.i18nLocales.admin.detect || {};

window.i18nLocales.admin.detect.zh_CN = {
    rule: {
        title:            "审计规则",
        subtitle:         "查看站点中的审计规则。",
        add_btn:          "添加审计规则",
        add_dialog_title: "添加审计规则",
        cancel_btn:       "取消",
        submit_btn:       "提交",
        delete_confirm:   "确定删除此审计规则？"
    },
    log: {
        title:    "审计碰撞记录",
        subtitle: "查看审计碰撞记录的内容。"
    },
    ban: {
        title:    "审计封禁记录",
        subtitle: "查看审计封禁记录的内容。"
    },

    fields: {
        op:                 "操作",
        id:                 "规则ID",
        name:               "规则名称",
        text:               "规则介绍",
        regex:              "正则表达式",
        type:               "规则类型",
        user_id:            "用户ID",
        node_id:            "节点ID",
        node_name:          "节点名",
        list_id:            "规则ID",
        rule_name:          "规则名",
        datetime:           "时间",
        detect_number:      "违规次数",
        ban_time:           "封禁时长(分钟)",
        start_time:         "统计开始时间",
        end_time:           "统计结束&封禁开始时间",
        ban_end_time:       "封禁结束时间",
        all_detect_number:  "累计违规次数"
    },

    add_dialog: {
        field_name:  "规则名称",
        ph_name:     "审计规则名称",
        field_text:  "规则介绍",
        ph_text:     "简洁明了地描述审计规则",
        field_regex: "正则表达式",
        ph_regex:    "用以匹配审计内容的正则表达式",
        field_type:  "规则类型",
        opt_1:       "数据包明文匹配",
        opt_0:       "数据包十六进制匹配"
    }
};
