window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.product = window.i18nLocales.admin.product || {};

window.i18nLocales.admin.product.zh_TW = {
    // 商品列表頁
    index: {
        title:          "商品列表",
        subtitle:       "管理所有商品與訂閱套餐。",
        create_btn:     "建立",
        search_placeholder: "按 ID 或名稱搜尋...",
        delete_confirm: "確定刪除此商品？",
        copy_confirm:   "確定複製此商品？",

        stat_total:    "總商品數",
        stat_active:   "正常销售",
        stat_inactive: "已下架",
        stat_sales:    "累計館售",
    },

    // 欄位標題
    fields: {
        op:          "操作",
        id:          "商品ID",
        type:        "類型",
        name:        "名稱",
        price:       "售價",
        status:      "銷售狀態",
        create_time: "建立時間",
        update_time: "更新時間",
        sale_count:  "累計銷售",
        stock:       "庫存",
    },

    // 建立頁面
    create: {
        title:    "建立商品",
        subtitle: "設定新的訂閱套餐或儲值包。",
        save_btn: "儲存",

        section_basic:       "基本資訊",
        section_content:     "商品內容",
        section_restriction: "購買限制",

        field_name:   "名稱",
        field_price:  "價格",
        field_stock:  "庫存（-1為不限制）",
        field_status: "銷售狀態",
        field_type:   "類型",

        status_active:   "正常",
        status_inactive: "下架",

        type_tabp:      "時間流量包",
        type_bandwidth: "流量包",
        type_time:      "時間包",

        field_time:        "商品時長 (天)",
        field_class:       "授予等級",
        field_class_time:  "等級時長 (天)",
        field_bandwidth:   "可用流量 (GB)",
        field_node_group:  "授予節點分組",

        level_any:      "任意",
        level_basic:    "Basic",
        level_standard: "Standard",
        level_premium:  "Premium",
        level_vip:      "VIP",
        field_speed_limit: "速率限制 (Mbps)",
        field_ip_limit:    "同時連線IP限制",

        field_class_required:      "最低等級要求",
        field_node_group_required: "所需節點分組（限制）",
        field_new_user_required:   "僅限新使用者購買",
        new_user_required_desc:    "僅允許新使用者購買此商品。",

        hint_stock: "庫存設為 -1 表示不限制。",
    },

    // 編輯頁面
    edit: {
        title:      "編輯商品",
        subtitle:   "修改此商品的設定。",
        save_btn:   "儲存修改",
        cancel_btn: "取消",
    },

    // 篩選
    filter: {
        status_label:   "狀態",
        type_label:     "類型",
        filter_btn:     "篩選",
        all:            "全部",
        active:         "正常",
        inactive:       "下架",
        type_tabp:      "時間流量包",
        type_time:      "時間包",
        type_bandwidth: "流量包",
    },
};
