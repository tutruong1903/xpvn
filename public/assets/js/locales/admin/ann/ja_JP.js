window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ann = window.i18nLocales.admin.ann || {};

window.i18nLocales.admin.ann.ja_JP = {
    index: {
        title:              "お知らせ管理",
        subtitle:           "サイトのお知らせを閲覧・管理",
        create_btn:         "作成",
        search_placeholder: "IDまたは内容で検索...",
        delete_confirm:     "このお知らせを削除しますか？",

        stat_total:     "お知らせ総数",
        stat_published: "公開中",
        stat_pinned:    "固定",
        stat_draft:     "下書き"
    },

    fields: {
        op:      "操作",
        id:      "ID",
        status:  "ステータス",
        sort:    "並び順",
        date:    "日付",
        content: "内容（抜粋）"
    },

    filter: {
        status_label: "ステータス",
        all:          "すべて",
        published:    "公開中",
        pinned:       "固定",
        draft:        "下書き"
    },

    badges: {
        status_published: "公開中",
        status_pinned:    "固定",
        status_draft:     "下書き",
        status_unknown:   "不明"
    }
};
