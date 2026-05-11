window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.docs = window.i18nLocales.admin.docs || {};

window.i18nLocales.admin.docs.en_US = {
    index: {
        title:              "Document Management",
        subtitle:           "View and manage documents on the site",
        create_btn:         "Create",
        search_placeholder: "Quick search ID or title...",
        delete_confirm:     "Are you sure you want to delete this document?",

        stat_total:     "Total Documents",
        stat_published: "Published",
        stat_draft:     "Draft"
    },

    fields: {
        op:     "Actions",
        id:     "ID",
        status: "Status",
        sort:   "Sort",
        date:   "Date",
        title:  "Title"
    },

    filter: {
        status_label: "Status",
        all:          "All",
        published:    "Published",
        draft:        "Draft"
    },

    badges: {
        status_published: "Published",
        status_draft:     "Draft",
        status_unknown:   "Unknown"
    },

    create: {
        title:            "Create Document",
        subtitle:         "Write and publish new documentation for your users.",
        settings_title:   "Publish Settings",

        field_title:      "Document Title",
        ph_title:         "Enter an impressive title here...",

        field_status:     "Status",
        status_draft:     "Draft",
        status_published: "Published",

        field_sort:       "Display Order",

        llm_btn:          "AI Generate",
        llm_modal_title:  "Generate with LLM",
        llm_ph:           "Enter a prompt for document generation...",
        llm_cancel:       "Cancel",
        llm_generate:     "Generate",

        save_btn:         "Save Document",
        cancel_btn:       "Discard changes"
    },

    edit: {
        title:            "Edit Document",
        subtitle:         "Update the content and settings of this document.",
        settings_title:   "Publish Settings",

        field_title:      "Document Title",

        field_status:     "Status",
        status_draft:     "Draft",
        status_published: "Published",

        field_sort:       "Display Order",

        save_btn:         "Save Changes",
        cancel_btn:       "Discard changes"
    }
};
