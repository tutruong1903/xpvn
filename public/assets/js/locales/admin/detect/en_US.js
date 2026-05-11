window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.detect = window.i18nLocales.admin.detect || {};

window.i18nLocales.admin.detect.en_US = {
    rule: {
        title:            "Audit Rules",
        subtitle:         "View and manage audit rules for the site.",
        add_btn:          "Add Rule",
        add_dialog_title: "Add Audit Rule",
        cancel_btn:       "Cancel",
        submit_btn:       "Submit",
        delete_confirm:   "Are you sure you want to delete this audit rule?"
    },
    log: {
        title:    "Audit Hit Logs",
        subtitle: "View audit rule hit records."
    },
    ban: {
        title:    "Audit Ban Logs",
        subtitle: "View audit ban records."
    },

    fields: {
        // DetectRuleController
        op:                 "Actions",
        id:                 "ID",
        name:               "Rule Name",
        text:               "Description",
        regex:              "Regex",
        type:               "Rule Type",
        // DetectLogController
        user_id:            "User ID",
        node_id:            "Node ID",
        node_name:          "Node Name",
        list_id:            "Rule ID",
        rule_name:          "Rule Name",
        datetime:           "Date & Time",
        // DetectBanLogController
        detect_number:      "Violations",
        ban_time:           "Ban Duration (min)",
        start_time:         "Stats Start Time",
        end_time:           "Stats End & Ban Start Time",
        ban_end_time:       "Ban End Time",
        all_detect_number:  "Total Violations"
    },

    add_dialog: {
        field_name:  "Rule Name",
        ph_name:     "Audit rule name",
        field_text:  "Description",
        ph_text:     "Brief description of the audit rule",
        field_regex: "Regex Pattern",
        ph_regex:    "Regex to match audit content",
        field_type:  "Rule Type",
        opt_1:       "Plaintext Match",
        opt_0:       "Hex Match"
    }
};
