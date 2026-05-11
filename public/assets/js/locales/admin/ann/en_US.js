window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ann = window.i18nLocales.admin.ann || {};

window.i18nLocales.admin.ann.en_US = {
  index: {
    title: "Announcement Management",
    subtitle: "View and manage site announcements",
    create_btn: "Create",
    search_placeholder: "Quick search ID or content...",
    delete_confirm: "Are you sure you want to delete this announcement?",

    stat_total: "Total Announcements",
    stat_published: "Published",
    stat_pinned: "Pinned",
    stat_draft: "Draft",
  },

  fields: {
    op: "Actions",
    id: "ID",
    status: "Status",
    sort: "Sort",
    date: "Date",
    content: "Content (Excerpt)",
  },

  filter: {
    status_label: "Status",
    all: "All",
    published: "Published",
    pinned: "Pinned",
    draft: "Draft",
  },

  badges: {
    status_published: "Published",
    status_pinned: "Pinned",
    status_draft: "Draft",
    status_unknown: "Unknown",
  },

  create: {
    title: "Create Announcement",
    subtitle: "Publish important news and updates to your users.",
    settings_title: "Publish Settings",

    field_status: "Status",
    status_draft: "Draft",
    status_published: "Published",
    status_pinned: "Pinned",

    field_sort: "Display Order",
    field_email_class: "Notify Users at Level",
    class_all: "0 — Basic and above",
    class_standard: "1 — Standard and above",
    class_premium: "2 — Premium and above",
    class_vip: "3 — VIP only",
    hint_class: "0 = All members",

    field_email_notify: "Send Email",
    email_notify_desc: "Broadcast announcement via inbox",

    save_btn: "Save Announcement",
    cancel_btn: "Discard changes",
  },

  edit: {
    title:          "Edit Announcement",
    subtitle:       "Update the content and settings of this announcement.",
    settings_title: "Publish Settings",

    field_status:     "Status",
    status_draft:     "Draft",
    status_published: "Published",
    status_pinned:    "Pinned",

    field_sort: "Display Order",

    save_btn:   "Save Changes",
    cancel_btn: "Discard changes",
  },
};
