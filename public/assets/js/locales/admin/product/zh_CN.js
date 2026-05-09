window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.product = window.i18nLocales.admin.product || {};

window.i18nLocales.admin.product.zh_CN = {
    // 商品列表页
    index: {
        title:          "商品列表",
        subtitle:       "管理所有商品和订阅套餐。",
        create_btn:     "创建",
        search_placeholder: "按 ID 或名称搜索...",
        delete_confirm: "确定删除此商品？",
        copy_confirm:   "确定复制此商品？",

        stat_total:    "总商品数",
        stat_active:   "正常销售",
        stat_inactive: "已下架",
        stat_sales:    "累计销售",
    },

    // 列标题
    fields: {
        op:          "操作",
        id:          "商品ID",
        type:        "类型",
        name:        "名称",
        price:       "售价",
        status:      "销售状态",
        create_time: "创建时间",
        update_time: "更新时间",
        sale_count:  "累计销售",
        stock:       "库存",
    },

    // 创建页面
    create: {
        title:    "创建商品",
        subtitle: "配置新的订阅套餐或充值包。",
        save_btn: "保存",

        section_basic:       "基础信息",
        section_content:     "商品内容",
        section_restriction: "购买限制",

        field_name:   "名称",
        field_price:  "价格",
        field_stock:  "库存（-1为不限制）",
        field_status: "销售状态",
        field_type:   "类型",

        status_active:   "正常",
        status_inactive: "下架",

        type_tabp:      "时间流量包",
        type_bandwidth: "流量包",
        type_time:      "时间包",

        field_time:        "商品时长 (天)",
        field_class:       "授予等级",
        field_class_time:  "等级时长 (天)",
        field_bandwidth:   "可用流量 (GB)",
        field_node_group:  "授予节点分组",

        level_any:      "任意",
        level_basic:    "Basic",
        level_standard: "Standard",
        level_premium:  "Premium",
        level_vip:      "VIP",
        field_speed_limit: "速率限制 (Mbps)",
        field_ip_limit:    "同时连接IP限制",

        field_class_required:      "最低等级要求",
        field_node_group_required: "所需节点分组（限制）",
        field_new_user_required:   "仅限新用户购买",
        new_user_required_desc:    "仅允许新用户购买此商品。",

        hint_stock: "库存设为 -1 表示不限制。",
    },

    // 编辑页面
    edit: {
        title:      "编辑商品",
        subtitle:   "修改此商品的配置。",
        save_btn:   "保存修改",
        cancel_btn: "取消",
    },

    // 筛选
    filter: {
        status_label:   "状态",
        type_label:     "类型",
        filter_btn:     "筛选",
        all:            "全部",
        active:         "正常",
        inactive:       "下架",
        type_tabp:      "时间流量包",
        type_time:      "时间包",
        type_bandwidth: "流量包",
    },
};
