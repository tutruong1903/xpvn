window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.money = window.i18nLocales.user.money || {};

window.i18nLocales.user.money.en_US = {
    // Page header
    page_title:    "Balance History",
    page_subtitle: "Track all balance changes in your account in detail.",

    // Action buttons
    btn_redeem:    "Redeem Gift Card",
    btn_topup:     "Top Up",

    // Summary cards
    stat_balance:  "Current Balance",
    stat_guardian: "Account protected by Luminous Guardian",
    stat_credit:   "Total Credited",
    stat_debit:    "Total Debited",

    // Table
    table_title:   "Transaction Details",

    // Table column headers
    fields: {
        id:          "Transaction ID",
        before:      "Balance Before",
        after:       "Balance After",
        amount:      "Amount",
        remark:      "Note",
        create_time: "Time",
    },

    // Empty state
    empty_title: "No transactions yet",
    empty_desc:  "You have not made any top-up or spending transactions.",

    // Pagination
    pagination_info: "Showing {from}–{to} of {total} records",

    // Modals
    modal_giftcard_title:       "Redeem Gift Card",
    modal_giftcard_placeholder: "Enter gift card code and click Redeem",
    modal_giftcard_cancel:      "Cancel",
    modal_giftcard_submit:      "Redeem",

    modal_topup_title:       "Top Up Balance",
    modal_topup_placeholder: "Enter the amount to top up",
    modal_topup_cancel:      "Cancel",
    modal_topup_submit:      "Top Up",
};
