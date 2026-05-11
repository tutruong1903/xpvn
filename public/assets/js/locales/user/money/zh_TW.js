window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.money = window.i18nLocales.user.money || {};

window.i18nLocales.user.money.zh_TW = {
    // 頁面標題
    page_title:    "餘額記錄",
    page_subtitle: "詳細追蹤帳戶餘額的每一筆變動。",

    // 操作按鈕
    btn_redeem:    "兌換禮品卡",
    btn_topup:     "儲值",

    // 彙總卡片
    stat_balance:  "目前餘額",
    stat_guardian: "帳戶受 Luminous Guardian 保護",
    stat_credit:   "累計儲值",
    stat_debit:    "累計消費",

    // 表格
    table_title:   "交易明細",

    // 表頭
    fields: {
        id:          "事件ID",
        before:      "變動前餘額",
        after:       "變動後餘額",
        amount:      "變動金額",
        remark:      "備註",
        create_time: "變動時間",
    },

    // 空狀態
    empty_title: "尚無交易記錄",
    empty_desc:  "您尚未進行任何儲值或消費操作。",

    // 分頁
    pagination_info: "顯示第 {from}–{to} 筆，共 {total} 筆",

    // 彈窗
    modal_giftcard_title:       "兌換禮品卡",
    modal_giftcard_placeholder: "輸入禮品卡卡號並點擊兌換",
    modal_giftcard_cancel:      "取消",
    modal_giftcard_submit:      "兌換",

    modal_topup_title:       "餘額儲值",
    modal_topup_placeholder: "請輸入要儲值的金額",
    modal_topup_cancel:      "取消",
    modal_topup_submit:      "儲值",
};
