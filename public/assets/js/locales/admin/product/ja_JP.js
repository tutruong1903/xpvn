window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.product = window.i18nLocales.admin.product || {};

window.i18nLocales.admin.product.ja_JP = {
    // 商品リストページ
    index: {
        title:          "商品リスト",
        subtitle:       "すべての商品とサブスクリプションプランを管理します。",
        create_btn:     "作成",
        search_placeholder: "ID または名前で検索...",
        delete_confirm: "この商品を削除してもよろしいですか？",
        copy_confirm:   "この商品をコピーしてもよろしいですか？",

        stat_total:    "総商品数",
        stat_active:   "販売中",
        stat_inactive: "販売停止",
        stat_sales:    "累計販売数",
    },

    // 列ヘッダー
    fields: {
        op:          "操作",
        id:          "商品ID",
        type:        "タイプ",
        name:        "名前",
        price:       "価格",
        status:      "販売状態",
        create_time: "作成日時",
        update_time: "更新日時",
        sale_count:  "累計販売数",
        stock:       "在庫",
    },

    // 作成ページ
    create: {
        title:    "商品作成",
        subtitle: "新しいサブスクリプションプランまたはチャージパッケージを設定します。",
        save_btn: "保存",

        section_basic:       "基本情報",
        section_content:     "商品内容",
        section_restriction: "購入制限",

        field_name:   "名前",
        field_price:  "価格",
        field_stock:  "在庫（-1は無制限）",
        field_status: "販売状態",
        field_type:   "タイプ",

        status_active:   "販売中",
        status_inactive: "販売停止",

        type_tabp:      "時間＋データパック",
        type_bandwidth: "データパック",
        type_time:      "時間パック",

        field_time:        "期間 (日)",
        field_class:       "付与レベル",
        field_class_time:  "レベル期間 (日)",
        field_bandwidth:   "データ容量 (GB)",
        field_node_group:  "付与ノードグループ",

        level_any:      "制限なし",
        level_basic:    "Basic",
        level_standard: "Standard",
        level_premium:  "Premium",
        level_vip:      "VIP",
        field_speed_limit: "速度制限 (Mbps)",
        field_ip_limit:    "同時接続IP制限",

        field_class_required:      "最低レベル要件",
        field_node_group_required: "必要ノードグループ（条件）",
        field_new_user_required:   "新規ユーザー限定",
        new_user_required_desc:    "新規ユーザーのみこの商品を購入できます。",

        hint_stock: "-1 に設定すると在庫無制限になります。",
    },

    // 編集ページ
    edit: {
        title:      "商品編集",
        subtitle:   "この商品の設定を変更します。",
        save_btn:   "変更を保存",
        cancel_btn: "キャンセル",
    },

    // フィルター
    filter: {
        status_label:   "ステータス",
        type_label:     "タイプ",
        filter_btn:     "絞り込み",
        all:            "すべて",
        active:         "販売中",
        inactive:       "非公開",
        type_tabp:      "時間＋容量パック",
        type_time:      "時間パック",
        type_bandwidth: "容量パック",
    },
};
