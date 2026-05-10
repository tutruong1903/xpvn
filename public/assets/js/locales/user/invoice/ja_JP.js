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
