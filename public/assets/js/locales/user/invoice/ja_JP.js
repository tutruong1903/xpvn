window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.invoice = window.i18nLocales.user.invoice || {};

window.i18nLocales.user.invoice.ja_JP = {
    // 請求書一覧ページ
    index_title:              "請求書一覧",
    index_subtitle:           "アカウント内の請求書を確認・管理します。",
    index_search_placeholder: "ID、金額またはステータスで検索...",
    index_stat_total:         "総請求書数",
    index_stat_unpaid:        "未払い",
    index_stat_paid:          "支払い済み",
    index_stat_total_paid:    "累計支払額 ($)",

    // 請求書詳細ページ
    view_title:              "請求書詳細",
    view_btn_order:          "注文を見る",
    section_basic_info:      "基本情報",
    section_invoice_details: "請求明細",
    section_payment:         "支払い",
    tab_balance_pay:         "残高払い",
    tab_gateway_pay:         "ゲートウェイ払い",
    label_order_id:          "注文ID",
    label_invoice_amount:    "請求金額",
    label_invoice_status:    "請求ステータス",
    label_create_time:       "作成日時",
    label_update_time:       "更新日時",
    label_pay_time:          "支払日時",
    label_gateway_tradeno:   "ゲートウェイ取引番号",
    label_item_name:         "名称",
    label_item_price:        "価格",
    label_balance_available: "利用可能残高",
    btn_pay:                 "今すぐ支払う",
    no_payment_method:       "利用可能な支払い方法がありません",

    // 列ヘッダー
    fields: {
        op:          "操作",
        id:          "請求書ID",
        order_id:    "注文ID",
        price:       "請求金額",
        status:      "ステータス",
        create_time: "作成日時",
        update_time: "更新日時",
        pay_time:    "支払日時",
    },
};
