window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ticket = window.i18nLocales.admin.ticket || {};

window.i18nLocales.admin.ticket.en_US = {
    // Ticket list page
    index: {
        title:               "Ticket List",
        subtitle:            "View and reply to user support tickets",
        search_placeholder:  "Quick search ID, subject or user...",
        filter_btn:          "Filter",
        delete_confirm:      "Are you sure you want to delete this ticket?",
        close_confirm:       "Are you sure you want to close this ticket?",

        stat_total:          "Total Tickets",
        stat_open:           "Open",
        stat_closed:         "Closed",
        stat_wait_admin:     "Waiting for Admin"
    },

    // Column headers
    fields: {
        op:       "Actions",
        id:       "Ticket ID",
        title:    "Subject",
        status:   "Status",
        type:     "Type",
        userid:   "User",
        datetime: "Created At"
    },

    // Filter panel
    filter: {
        status_label:      "Status",
        type_label:        "Type",
        all:               "All",
        status_open:       "Open",
        status_closed:     "Closed",
        status_wait_user:  "Waiting for User",
        status_wait_admin: "Waiting for Admin"
    },

    // Badge labels (used by _translateBadges)
    badges: {
        status_open_wait_admin: "Waiting for Admin",
        status_open_wait_user:  "Waiting for User",
        status_closed:          "Closed",
        type_howto:             "Usage Guide",
        type_billing:           "Payment",
        type_account:           "Account",
        type_other:             "Other"
    }
};
