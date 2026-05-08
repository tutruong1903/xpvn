window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.node = window.i18nLocales.admin.node || {};

window.i18nLocales.admin.node.zh_TW = {
    // 節點列表頁
    index: {
        title:               "節點列表",
        subtitle:            "管理系統中所有代理節點。",
        create_btn:          "建立",
        filter_btn:          "篩選",
        search_placeholder:  "快速搜尋 ID、名稱或地址...",
        delete_confirm:      "確定刪除此節點？",
        copy_confirm:        "確定複製此節點？",

        stat_total:     "總節點數",
        stat_online:    "在線節點",
        stat_hidden:    "已隱藏",
        stat_bandwidth: "已用總流量 (GB)"
    },

    // 欄位標題
    fields: {
        op:                      "操作",
        id:                      "節點ID",
        name:                    "名稱",
        server:                  "地址",
        type:                    "狀態",
        sort:                    "類型",
        traffic_rate:            "倍率",
        is_dynamic_rate:         "動態倍率",
        dynamic_rate_type:       "動態倍率計算方式",
        node_class:              "等級",
        node_group:              "組別",
        node_bandwidth_limit:    "流量限制/GB",
        node_bandwidth:          "已用流量/GB",
        bandwidthlimit_resetday: "重置日"
    },

    // 建立 / 編輯節點頁面
    create: {
        title:              "建立節點",
        subtitle:           "在您的基礎設施中初始化新的網路節點。設定連接參數和流量限制以最佳化使用者效能。",
        save_btn:           "儲存設定",
        cancel_btn:         "取消",

        section_basic:      "基本資訊",
        section_config:     "自訂設定",
        section_dynamic:    "動態倍率設定",
        section_other:      "其他資訊",
        section_traffic:    "流量設定",

        field_name:         "節點名稱",
        field_server:       "連接地址",
        field_traffic_rate: "流量倍率",
        field_sort:         "接入類型",

        config_badge:       "JSON 編輯器",
        config_docs_link:   "節點自訂設定文件",
        config_docs_text:   "請參考",
        config_docs_suffix: "修改節點自訂設定。",
        field_show_node:    "顯示此節點",
        show_node_desc:     "允許該節點出現在節點清單中。",

        field_enable_dynamic: "啟用動態流量倍率",
        field_dynamic_type:   "動態流量倍率計算方式",
        field_max_rate:       "最大倍率",
        field_max_rate_time:  "最大倍率時間（時）",
        field_min_rate:       "最小倍率",
        field_min_rate_time:  "最小倍率時間（時）",
        dynamic_hint:         "最大倍率時間必須大於最小倍率時間，否則將不會生效。",
        dynamic_type_linear:  "線性（Linear）",
        dynamic_type_logistic: "Logistic",

        field_node_class:   "等級",
        field_node_group:   "組別",

        level_basic:    "基礎",
        level_standard: "標準",
        level_premium:  "高級",
        level_vip:      "VIP",

        group_default:  "預設",
        group_premium:  "高級 VIP",

        field_bandwidth_limit:    "可用流量 (GB)",
        field_bandwidth_resetday: "流量重置日",
        field_speedlimit:         "最大速率 (Mbps)",

        protocol_trojan:         "Trojan",
        protocol_vmess:          "Vmess",
        protocol_tuic:           "TUIC",
        protocol_ss2022:         "Shadowsocks2022",
        protocol_ss:             "Shadowsocks"
    },

    // 編輯節點頁面
    edit: {
        title:               "編輯節點",
        subtitle:            "修改此代理節點的連接參數和配置資訊。",
        section_advanced:    "進階選項",
        field_ipv4:          "IPv4 位址",
        field_ipv6:          "IPv6 位址",
        field_used_bandwidth: "已用流量",
        field_password_key:  "節點通訊密鑰",
        password_key_desc:   "用於 NodeAPI 鑑權，如需更改請點擊重置。",
        reset_btn:           "重置",
        copy_btn:            "複製",
        save_btn:            "儲存變更",
        cancel_btn:          "取消",
        clipboard_success:   "已複製到剪貼簿"
    },

    // 篩選面板
    filter: {
        type_label: "狀態",
        sort_label: "協議",
        all:        "全部",
        visible:    "顯示",
        hidden:     "隱藏"
    }
};
