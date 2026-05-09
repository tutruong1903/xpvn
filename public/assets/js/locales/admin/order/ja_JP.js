window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.order = window.i18nLocales.admin.order || {};

window.i18nLocales.admin.order.ja_JP = {
    // 注文一覧ページ
    index: {
        title:              "注文一覧",
        subtitle:           "すべての顧客注文を管理します。",
        search_btn:         "ゲートウェイIDで検索",
        search_placeholder: "IDまたはユーザーで検索...",
        delete_confirm:     "この注文を削除しますか？",
        cancel_confirm:     "この注文をキャンセルしますか？関連する請求書が支払済みの場合、ユーザーの残高に返金されます。",

        stat_total:    "総注文数",
        stat_pending:  "保留中",
        stat_active:   "有効化済み",
        stat_cancelled:"キャンセル済み",
    },

    // 列名
    fields: {
        op:           "操作",
        id:           "注文ID",
        user_id:      "ユーザーID",
        product_id:   "商品ID",
        product_type: "タイプ",
        product_name: "商品名",
        coupon:       "クーポン",
        price:        "金額",
        status:       "ステータス",
        create_time:  "作成日時",
        update_time:  "更新日時",
    },

    // 検索モーダル
    search_modal: {
        title:      "注文を検索",
        label:      "ゲートウェイ注文ID",
        cancel_btn: "キャンセル",
        submit_btn: "検索",
    },

    // バッジ
    badges: {
        pending_payment:    "支払待ち",
        pending_activation: "有効化待ち",
        activated:          "有効化済み",
        expired:            "期限切れ",
        cancelled:          "キャンセル済み",
        type_tabp:          "時間＋容量パック",
        type_time:          "時間パック",
        type_bandwidth:     "容量パック",
        type_topup:         "チャージ",
    },
};
