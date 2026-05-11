window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ann = window.i18nLocales.admin.ann || {};

window.i18nLocales.admin.ann.ja_JP = {
  index: {
    title: "お知らせ管理",
    subtitle: "サイトのお知らせを閲覧・管理",
    create_btn: "作成",
    search_placeholder: "IDまたは内容で検索...",
    delete_confirm: "このお知らせを削除しますか？",

    stat_total: "お知らせ総数",
    stat_published: "公開中",
    stat_pinned: "固定",
    stat_draft: "下書き",
  },

  fields: {
    op: "操作",
    id: "ID",
    status: "ステータス",
    sort: "並び順",
    date: "日付",
    content: "内容（抜粋）",
  },

  filter: {
    status_label: "ステータス",
    all: "すべて",
    published: "公開中",
    pinned: "固定",
    draft: "下書き",
  },

  badges: {
    status_published: "公開中",
    status_pinned: "固定",
    status_draft: "下書き",
    status_unknown: "不明",
  },

  create: {
    title: "お知らせ作成",
    subtitle: "ユーザーに重要なニュースやお知らせを発信する。",
    settings_title: "公開設定",

    field_status: "ステータス",
    status_draft: "下書き",
    status_published: "公開中",
    status_pinned: "固定",

    field_sort: "表示順",
    field_email_class: "メール通知の等級",
    class_all: "0 — ベーシック以上",
    class_standard: "1 — スタンダード以上",
    class_premium: "2 — プレミアム以上",
    class_vip: "3 — VIPのみ",
    hint_class: "0 = 全メンバー",

    field_email_notify: "メール通知を送る",
    email_notify_desc: "メールでお知らせを配信",

    save_btn: "お知らせを保存",
    cancel_btn: "変更を破棄",
  },

  edit: {
    title:          "お知らせ編集",
    subtitle:       "このお知らせの内容と設定を更新する。",
    settings_title: "公開設定",

    field_status:     "ステータス",
    status_draft:     "下書き",
    status_published: "公開中",
    status_pinned:    "固定",

    field_sort: "表示順",

    save_btn:   "変更を保存",
    cancel_btn: "変更を破棄",
  },
};
