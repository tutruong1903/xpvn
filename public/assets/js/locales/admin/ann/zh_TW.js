window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ann = window.i18nLocales.admin.ann || {};

window.i18nLocales.admin.ann.zh_TW = {
  index: {
    title: "公告管理",
    subtitle: "查看並管理站點中的公告",
    create_btn: "建立",
    search_placeholder: "快速搜尋 ID 或內容...",
    delete_confirm: "確定刪除此公告？",

    stat_total: "總公告數",
    stat_published: "已發布",
    stat_pinned: "置頂",
    stat_draft: "未發布",
  },

  fields: {
    op: "操作",
    id: "ID",
    status: "狀態",
    sort: "排序",
    date: "日期",
    content: "內容（節選）",
  },

  filter: {
    status_label: "狀態",
    all: "全部",
    published: "已發布",
    pinned: "置頂",
    draft: "未發布",
  },

  badges: {
    status_published: "已發布",
    status_pinned: "置頂",
    status_draft: "未發布",
    status_unknown: "未知",
  },

  create: {
    title: "建立公告",
    subtitle: "向用戶發布重要新聞和公告。",
    settings_title: "發布設定",

    field_status: "狀態",
    status_draft: "未發布",
    status_published: "已發布",
    status_pinned: "置頂",

    field_sort: "顯示排序",
    field_email_class: "郵件通知等級",
    class_all: "0 — 所有成員",
    class_standard: "1 — 標準及以上",
    class_premium: "2 — 進階及以上",
    class_vip: "3 — 僅 VIP",
    hint_class: "0 = 所有成員",

    field_email_notify: "發送郵件通知",
    email_notify_desc: "公告將透過郵箱發送",

    save_btn: "儲存公告",
    cancel_btn: "取消變更",
  },

  edit: {
    title:          "編輯公告",
    subtitle:       "更新該公告的內容與發布設定。",
    settings_title: "發布設定",

    field_status:     "狀態",
    status_draft:     "未發布",
    status_published: "已發布",
    status_pinned:    "置頂",

    field_sort: "顯示排序",

    save_btn:   "儲存變更",
    cancel_btn: "取消變更",
  },
};
