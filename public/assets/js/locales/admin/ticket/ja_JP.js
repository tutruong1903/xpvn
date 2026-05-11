window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ticket = window.i18nLocales.admin.ticket || {};

window.i18nLocales.admin.ticket.ja_JP = {
    // チケット一覧ページ
    index: {
        title:               "チケット一覧",
        subtitle:            "ユーザーのサポートチケットを確認・返信",
        search_placeholder:  "ID、件名、ユーザーで検索...",
        filter_btn:          "フィルター",
        delete_confirm:      "このチケットを削除しますか？",
        close_confirm:       "このチケットを閉じますか？",

        stat_total:          "チケット総数",
        stat_open:           "対応中",
        stat_closed:         "クローズ済み",
        stat_wait_admin:     "管理者対応待ち"
    },

    // カラムヘッダー
    fields: {
        op:       "操作",
        id:       "チケットID",
        title:    "件名",
        status:   "ステータス",
        type:     "種別",
        userid:   "ユーザー",
        datetime: "作成日時"
    },

    // フィルターパネル
    filter: {
        status_label:      "ステータス",
        type_label:        "種別",
        all:               "すべて",
        status_open:       "対応中",
        status_closed:     "クローズ済み",
        status_wait_user:  "ユーザー返信待ち",
        status_wait_admin: "管理者対応待ち"
    },

    // バッジラベル
    badges: {
        status_open_wait_admin: "対応中",
        status_open_wait_user:  "ユーザー返信待ち",
        status_closed:          "クローズ済み",
        type_howto:             "使い方",
        type_billing:           "お支払い",
        type_account:           "アカウント",
        type_other:             "その他"
    }
};
