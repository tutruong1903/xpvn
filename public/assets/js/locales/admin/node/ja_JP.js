window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.node = window.i18nLocales.admin.node || {};

window.i18nLocales.admin.node.ja_JP = {
    // ノード一覧ページ
    index: {
        title:               "ノード一覧",
        subtitle:            "システム内のすべてのプロキシノードを管理します。",
        create_btn:          "作成",
        filter_btn:          "絞り込み",
        search_placeholder:  "ID・名前・アドレスで検索...",
        delete_confirm:      "このノードを削除しますか？",
        copy_confirm:        "このノードをコピーしますか？",

        stat_total:     "総ノード数",
        stat_online:    "オンライン",
        stat_hidden:    "非表示",
        stat_bandwidth: "総使用帯域幅 (GB)"
    },

    // 列ヘッダー
    fields: {
        op:                      "操作",
        id:                      "ノードID",
        name:                    "名前",
        server:                  "アドレス",
        type:                    "表示状態",
        sort:                    "プロトコル",
        traffic_rate:            "レート",
        is_dynamic_rate:         "動的レート",
        dynamic_rate_type:       "動的レート計算方法",
        node_class:              "レベル",
        node_group:              "グループ",
        node_bandwidth_limit:    "帯域幅制限/GB",
        node_bandwidth:          "使用帯域幅/GB",
        bandwidthlimit_resetday: "リセット日"
    },

    // ノード作成 / 編集ページ
    create: {
        title:              "ノード作成",
        subtitle:           "インフラに新しいネットワークノードを初期化します。接続パラメータとトラフィック制限を設定してパフォーマンスを最適化します。",
        save_btn:           "設定を保存",
        cancel_btn:         "キャンセル",

        section_basic:      "基本情報",
        section_config:     "カスタム設定",
        section_dynamic:    "動的レート設定",
        section_other:      "その他の情報",
        section_traffic:    "トラフィック設定",

        field_name:         "ノード名",
        field_server:       "接続アドレス",
        field_traffic_rate: "トラフィックレート",
        field_sort:         "プロトコル種別",

        config_badge:       "JSON エディタ",
        config_docs_link:   "カスタム設定ドキュメント",
        config_docs_text:   "ノードカスタム設定を変更するには",
        config_docs_suffix: "を参照してください。",
        field_show_node:    "このノードを表示",
        show_node_desc:     "ノードリストにこのノードを表示します。",

        field_enable_dynamic: "動的トラフィックレートを有効化",
        field_dynamic_type:   "動的レート計算方法",
        field_max_rate:       "最大レート",
        field_max_rate_time:  "最大レート時間（時）",
        field_min_rate:       "最小レート",
        field_min_rate_time:  "最小レート時間（時）",
        dynamic_hint:         "最大レート時間は最小レート時間より大きくなければなりません。",
        dynamic_type_linear:  "線形（Linear）",
        dynamic_type_logistic: "Logistic",

        field_node_class:   "レベル",
        field_node_group:   "グループ",

        level_basic:    "ベーシック",
        level_standard: "スタンダード",
        level_premium:  "プレミアム",
        level_vip:      "VIP",

        group_default:  "デフォルト",
        group_premium:  "プレミアム VIP",

        field_bandwidth_limit:    "利用可能帯域幅 (GB)",
        field_bandwidth_resetday: "帯域幅リセット日",
        field_speedlimit:         "最大速度 (Mbps)",

        protocol_trojan:         "Trojan",
        protocol_vmess:          "Vmess",
        protocol_tuic:           "TUIC",
        protocol_ss2022:         "Shadowsocks2022",
        protocol_ss:             "Shadowsocks"
    },

    // ノード編集ページ
    edit: {
        title:               "ノードを編集",
        subtitle:            "このプロキシノードの接続パラメータと設定を更新します。",
        section_advanced:    "詳細オプション",
        field_ipv4:          "IPv4 アドレス",
        field_ipv6:          "IPv6 アドレス",
        field_used_bandwidth: "使用済み帯域幅",
        field_password_key:  "通信キー",
        password_key_desc:   "NodeAPI 認証に使用します。変更するにはリセットをクリックしてください。",
        reset_btn:           "リセット",
        copy_btn:            "コピー",
        save_btn:            "変更を保存",
        cancel_btn:          "キャンセル",
        clipboard_success:   "クリップボードにコピーしました"
    },

    // フィルターパネル
    filter: {
        type_label: "表示状態",
        sort_label: "プロトコル",
        all:        "すべて",
        visible:    "表示",
        hidden:     "非表示"
    }
};
