window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.log = window.i18nLocales.admin.log || {};

window.i18nLocales.admin.log.en_US = {
    login: {
        title:    "Login Logs",
        subtitle: "View user account login records."
    },
    subscribe: {
        title:    "Subscription Logs",
        subtitle: "View user subscription records."
    },
    payback: {
        title:    "Rebate Logs",
        subtitle: "View user rebate records."
    },
    money: {
        title:    "Balance Logs",
        subtitle: "View user balance change records."
    },
    gateway: {
        title:    "Gateway Logs",
        subtitle: "View site payment gateway records."
    },
    online: {
        title:    "Online IPs",
        subtitle: "View currently online user IPs."
    },

    fields: {
        // LoginLogController
        id:              "ID",
        userid:          "User ID",
        ip:              "IP Address",
        location:        "Location",
        datetime:        "Date & Time",
        type:            "Type",
        // SubLogController
        user_id:         "User ID",
        request_ip:      "Request IP",
        request_time:    "Request Time",
        request_user_agent: "User Agent",
        // PaybackController
        total:           "Original Amount",
        user_name:       "User Name",
        ref_by:          "Referrer User ID",
        ref_user_name:   "Referrer User Name",
        ref_get:         "Referral Earning",
        invoice_id:      "Invoice ID",
        // MoneyLogController
        before:          "Balance Before",
        after:           "Balance After",
        amount:          "Amount",
        remark:          "Remark",
        create_time:     "Time",
        // PaylistController (gateway)
        status:          "Status",
        gateway:         "Payment Gateway",
        tradeno:         "Trade No",
        // OnlineLogController
        node_id:         "Node ID",
        node_name:       "Node Name",
        first_time:      "First Connected",
        last_time:       "Last Connected"
    }
};
