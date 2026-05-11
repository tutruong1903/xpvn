window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.docs = window.i18nLocales.admin.docs || {};

window.i18nLocales.admin.docs.ja_JP = {
    index: {
        title:              "ドキュメント管理",
        subtitle:           "サイトのドキュメントを閲覧・管理",
        create_btn:         "作成",
        search_placeholder: "IDまたはタイトルで検索...",
        delete_confirm:     "このドキュメントを削除しますか？",

        stat_total:     "ドキュメント総数",
        stat_published: "公開中",
        stat_draft:     "下書き"
    },

    fields: {
        op:     "操作",
        id:     "ID",
        status: "ステータス",
        sort:   "並び順",
        date:   "日付",
        title:  "タイトル"
    },

    filter: {
        status_label: "ステータス",
        all:          "すべて",
        published:    "公開中",
        draft:        "下書き"
    },

    badges: {
        status_published: "公開中",
        status_draft:     "下書き",
        status_unknown:   "不明"
    },

    create: {
        title:            "ドキュメント作成",
        subtitle:         "ユーザー向けの新しいドキュメントを作成・公開する。",
        settings_title:   "公開設定",

        field_title:      "ドキュメントタイトル",
        ph_title:         "タイトルを入力してください...",

        field_status:     "ステータス",
        status_draft:     "下書き",
        status_published: "公開中",

        field_sort:       "表示順",

        llm_btn:          "AI 生成",
        llm_modal_title:  "LLM でドキュメントを自動生成",
        llm_ph:           "ドキュメント生成プロンプトを入力してください",
        llm_cancel:       "キャンセル",
        llm_generate:     "生成",

        save_btn:         "ドキュメントを保存",
        cancel_btn:       "変更を破棄"
    },

    edit: {
        title:            "ドキュメント編集",
        subtitle:         "このドキュメントの内容と設定を更新する。",
        settings_title:   "公開設定",

        field_title:      "ドキュメントタイトル",

        field_status:     "ステータス",
        status_draft:     "下書き",
        status_published: "公開中",

        field_sort:       "表示順",

        save_btn:         "変更を保存",
        cancel_btn:       "変更を破棄"
    }
};
