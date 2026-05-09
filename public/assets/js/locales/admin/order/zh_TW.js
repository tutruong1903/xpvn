window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.order = window.i18nLocales.admin.order || {};

window.i18nLocales.admin.order.zh_TW = {
    // 訂單列表頁
    index: {
        title:              "訂單列表",
        subtitle:           "管理所有客戶訂單。",
        search_btn:         "按網關單號查找",
        search_placeholder: "按ID或用戶搜尋...",
        delete_confirm:     "確定刪除此訂單？",
        cancel_confirm:     "確定取消此訂單？如果關聯帳單已付款，將退款至用戶餘額。",

        stat_total:    "總訂單數",
        stat_pending:  "待處理",
        stat_active:   "已啟用",
        stat_cancelled:"已取消",
    },

    // 欄位名稱
    fields: {
        op:           "操作",
        id:           "訂單ID",
        user_id:      "用戶ID",
        product_id:   "商品ID",
        product_type: "類型",
        product_name: "商品名稱",
        coupon:       "優惠碼",
        price:        "金額",
        status:       "狀態",
        create_time:  "建立時間",
        update_time:  "更新時間",
    },

    // 查找彈窗
    search_modal: {
        title:      "查找訂單",
        label:      "網關訂單號",
        cancel_btn: "取消",
        submit_btn: "查找",
    },

    // 徽章
    badges: {
        pending_payment:    "等待付款",
        pending_activation: "待啟用",
        activated:          "已啟用",
        expired:            "已過期",
        cancelled:          "已取消",
        type_tabp:          "時間流量包",
        type_time:          "時間包",
        type_bandwidth:     "流量包",
        type_topup:         "儲值",
    },
};
