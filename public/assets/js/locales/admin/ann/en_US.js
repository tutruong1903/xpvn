window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ann = window.i18nLocales.admin.ann || {};

window.i18nLocales.admin.ann.en_US = {
    index: {
        title:              "Announcement Management",
        subtitle:           "View and manage site announcements",
        create_btn:         "Create",
        search_placeholder: "Quick search ID or content...",
        delete_confirm:     "Are you sure you want to delete this announcement?",

        stat_total:     "Total Announcements",
        stat_published: "Published",
        stat_pinned:    "Pinned",
        stat_draft:     "Draft"
    },

    fields: {
        op:      "Actions",
        id:      "ID",
        status:  "Status",
        sort:    "Sort",
        date:    "Date",
        content: "Content (Excerpt)"
    },

    filter: {
        status_label: "Status",
        all:          "All",
        published:    "Published",
        pinned:       "Pinned",
        draft:        "Draft"
    },

    badges: {
        status_published: "Published",
        status_pinned:    "Pinned",
        status_draft:     "Draft",
        status_unknown:   "Unknown"
    }
};
