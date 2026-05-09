window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.invoice = window.i18nLocales.admin.invoice || {};

window.i18nLocales.admin.invoice.ja_JP = {
    index: {
        title:              "請求書一覧",
        subtitle:           "すべての顧客請求書を管理します。",
        search_placeholder: "IDまたはユーザーで検索…",
        mark_paid_confirm:  "この請求書を支払済み（管理者）としてマークしますか？",
        stat_total:         "請求書総数",
        stat_paid:          "支払済み",
        stat_unpaid:        "未払い",
        stat_cancelled:     "キャンセル済み",
    },
    fields: {
        op:          "操作",
        id:          "請求書ID",
        user_id:     "ユーザーID",
        order_id:    "注文ID",
        price:       "金額",
        status:      "ステータス",
        create_time: "作成日時",
        update_time: "更新日時",
        pay_time:    "支払日時",
    },
    badges: {
        unpaid:           "未払い",
        paid_gateway:     "支払済み（ゲートウェイ）",
        paid_balance:     "支払済み（残高）",
        paid_admin:       "支払済み（管理者）",
        cancelled:        "キャンセル済み",
        refunded_balance: "返金済み（残高）",
        partially_paid:   "一部支払済み",
    },
};
