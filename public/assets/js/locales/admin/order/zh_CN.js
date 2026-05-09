window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.order = window.i18nLocales.admin.order || {};

window.i18nLocales.admin.order.zh_CN = {
    // 订单列表页
    index: {
        title:              "订单列表",
        subtitle:           "管理所有客户订单。",
        search_btn:         "按网关单号查找",
        search_placeholder: "按ID或用户搜索...",
        delete_confirm:     "确定删除此订单？",
        cancel_confirm:     "确定取消此订单？如果关联账单已支付，将会退款至用户余额。",

        stat_total:    "总订单数",
        stat_pending:  "待处理",
        stat_active:   "已激活",
        stat_cancelled:"已取消",
    },

    // 列名
    fields: {
        op:           "操作",
        id:           "订单ID",
        user_id:      "用户ID",
        product_id:   "商品ID",
        product_type: "类型",
        product_name: "商品名称",
        coupon:       "优惠码",
        price:        "金额",
        status:       "状态",
        create_time:  "创建时间",
        update_time:  "更新时间",
    },

    // 查找弹窗
    search_modal: {
        title:      "查找订单",
        label:      "网关订单号",
        cancel_btn: "取消",
        submit_btn: "查找",
    },

    // 状态/类型徽章
    badges: {
        pending_payment:    "等待支付",
        pending_activation: "待激活",
        activated:          "已激活",
        expired:            "已过期",
        cancelled:          "已取消",
        type_tabp:          "时间流量包",
        type_time:          "时间包",
        type_bandwidth:     "流量包",
        type_topup:         "充值",
    },
};
