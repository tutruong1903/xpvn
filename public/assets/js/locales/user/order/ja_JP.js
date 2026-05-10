window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.order = window.i18nLocales.user.order || {};

window.i18nLocales.user.order.ja_JP = {
    // 注文一覧ページ
    index_title:              "注文一覧",
    index_subtitle:           "アカウント内の注文を確認・管理します。",
    index_search_placeholder: "ID、商品またはステータスで検索...",

    // 列ヘッダー
    fields: {
        op:           "操作",
        id:           "注文ID",
        product_id:   "商品ID",
        product_type: "商品タイプ",
        product_name: "商品名",
        coupon:       "クーポン",
        price:        "金額",
        status:       "ステータス",
        create_time:  "作成日時",
        update_time:  "更新日時",
    },

    // Order index
    index_title: "注文一覧",
    index_subtitle: "アカウントの注文を確認・管理する",
    index_search_placeholder: "ID、商品、ステータスで検索...",
    index_stat_total: "総注文数",
    index_stat_pending: "支払い待ち",
    index_stat_activated: "有効化済み",
    index_stat_spent: "累計支出 ($)",

    // Page header
    page_title: "注文を作成",
    breadcrumb_orders: "注文",
    breadcrumb_new: "新規",

    // Card sections
    section_details: "注文内容",
    section_payment: "お支払い",

    // Field labels
    label_product_name: "商品名",
    label_product_type: "商品タイプ",
    label_duration: "有効期間",
    label_class_time: "レベル期間",
    label_class: "付与レベル",

    // Level names
    level_basic: "Basic",
    level_standard: "Standard",
    level_premium: "Premium",
    level_vip: "VIP",

    // Product types
    type_tabp: "時間 + トラフィック",
    type_time: "時間",
    type_bandwidth: "トラフィック",
    type_other: "その他",
    label_bandwidth: "データ容量",
    label_speed: "速度制限",
    label_ip_limit: "IP 制限",
    label_no_limit: "無制限",

    // Payment labels
    label_product_price: "商品価格",
    label_coupon_code: "クーポン",
    label_discount: "割引額",
    label_coupon: "クーポンコード",
    placeholder_coupon: "コードを入力…",
    btn_apply_coupon: "適用",
    label_total: "合計",

    // Units
    unit_days: "日",
    unit_gb: "GB",
    unit_mbps: "Mbps",

    // CTA
    btn_create_order: "注文を作成",

    // Trust badge
    trust_title: "セキュアな取引",
    trust_desc: "Ether Velocity は軍事レベルの AES-256 暗号化でお客様の支払い情報を保護します。",

    // Eligibility card
    eligibility_title_ok: "購入条件を満たしています",
    eligibility_title_fail: "購入条件を満たしていません",
    eligibility_subtitle_ok: "お客様のアカウントはこの商品のすべての要件を満たしています。",
    eligibility_subtitle_fail: "お客様のアカウントは以下の要件の一部を満たしていません。",
    eligibility_no_limit: "購入制限なし — すべてのアカウントがこの商品を購入できます。",
    eligibility_label_class: "アカウントレベル",
    eligibility_label_node_group: "ノードグループ",
    eligibility_label_new_user: "新規ユーザー限定",
    eligibility_yours: "あなた",
    eligibility_minimum: "最低条件",
    eligibility_required_label: "条件",
    eligibility_match: "一致",
    eligibility_no_match: "不一致",
    eligibility_pass: "合格",
    eligibility_fail_val: "不合格",
    eligibility_new_user_yes: "新規ユーザー",
    eligibility_new_user_no: "注文あり",
};
