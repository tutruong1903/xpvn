window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.node = window.i18nLocales.admin.node || {};

window.i18nLocales.admin.node.zh_CN = {
    // 节点列表页
    index: {
        title:               "节点列表",
        subtitle:            "管理系统中所有代理节点。",
        create_btn:          "创建",
        filter_btn:          "筛选",
        search_placeholder:  "快速搜索 ID、名称或地址...",
        delete_confirm:      "确定删除此节点？",
        copy_confirm:        "确定复制此节点？",

        stat_total:     "总节点数",
        stat_online:    "在线节点",
        stat_hidden:    "已隐藏",
        stat_bandwidth: "已用总流量 (GB)"
    },

    // 列标题
    fields: {
        op:                      "操作",
        id:                      "节点ID",
        name:                    "名称",
        server:                  "地址",
        type:                    "状态",
        sort:                    "类型",
        traffic_rate:            "倍率",
        is_dynamic_rate:         "动态倍率",
        dynamic_rate_type:       "动态倍率计算方式",
        node_class:              "等级",
        node_group:              "组别",
        node_bandwidth_limit:    "流量限制/GB",
        node_bandwidth:          "已用流量/GB",
        bandwidthlimit_resetday: "重置日"
    },

    // 创建 / 编辑节点页面
    create: {
        title:              "创建节点",
        subtitle:           "在您的基础设施中初始化新的网络节点。配置连接参数和流量限制以优化用户性能。",
        save_btn:           "保存配置",
        cancel_btn:         "取消",

        section_basic:      "基础信息",
        section_config:     "自定义配置",
        section_dynamic:    "动态倍率配置",
        section_other:      "其他信息",
        section_traffic:    "流量设置",

        field_name:         "节点名称",
        field_server:       "连接地址",
        field_traffic_rate: "流量倍率",
        field_sort:         "接入类型",

        config_badge:       "JSON 编辑器",
        config_docs_link:   "节点自定义配置文档",
        config_docs_text:   "请参考",
        config_docs_suffix: "修改节点自定义配置。",
        field_show_node:    "显示此节点",
        show_node_desc:     "允许该节点出现在节点列表中。",

        field_enable_dynamic: "启用动态流量倍率",
        field_dynamic_type:   "动态流量倍率计算方式",
        field_max_rate:       "最大倍率",
        field_max_rate_time:  "最大倍率时间（时）",
        field_min_rate:       "最小倍率",
        field_min_rate_time:  "最小倍率时间（时）",
        dynamic_hint:         "最大倍率时间必须大于最小倍率时间，否则将不会生效。",
        dynamic_type_linear:  "线性（Linear）",
        dynamic_type_logistic: "Logistic",

        field_node_class:   "等级",
        field_node_group:   "组别",

        level_basic:    "基础",
        level_standard: "标准",
        level_premium:  "高级",
        level_vip:      "VIP",

        group_default:  "默认",
        group_premium:  "高级 VIP",

        field_bandwidth_limit:    "可用流量 (GB)",
        field_bandwidth_resetday: "流量重置日",
        field_speedlimit:         "最大速率 (Mbps)",

        protocol_trojan:         "Trojan",
        protocol_vmess:          "Vmess",
        protocol_tuic:           "TUIC",
        protocol_ss2022:         "Shadowsocks2022",
        protocol_ss:             "Shadowsocks"
    },

    // 编辑节点页面
    edit: {
        title:               "编辑节点",
        subtitle:            "修改此代理节点的连接参数和配置信息。",
        section_advanced:    "高级选项",
        field_ipv4:          "IPv4 地址",
        field_ipv6:          "IPv6 地址",
        field_used_bandwidth: "已用流量",
        field_password_key:  "节点通讯密鑰",
        password_key_desc:   "用于 NodeAPI 鉴权，如需更改请点击重置。",
        reset_btn:           "重置",
        copy_btn:            "复制",
        save_btn:            "保存更改",
        cancel_btn:          "取消",
        clipboard_success:   "已复制到剪贴板"
    },

    // 筛选面板
    filter: {
        type_label: "状态",
        sort_label: "协议",
        all:        "全部",
        visible:    "显示",
        hidden:     "隐藏"
    }
};
