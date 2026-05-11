window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.money = window.i18nLocales.user.money || {};

window.i18nLocales.user.money.zh_CN = {
    // 页面标题
    page_title:    "余额记录",
    page_subtitle: "详细追踪账户余额的每一笔变动。",

    // 操作按钮
    btn_redeem:    "兑换礼品卡",
    btn_topup:     "充值",

    // 汇总卡片
    stat_balance:  "当前余额",
    stat_guardian: "账户受 Luminous Guardian 保护",
    stat_credit:   "累计充值",
    stat_debit:    "累计消费",

    // 表格
    table_title:   "交易明细",

    // 表头
    fields: {
        id:          "事件ID",
        before:      "变动前余额",
        after:       "变动后余额",
        amount:      "变动金额",
        remark:      "备注",
        create_time: "变动时间",
    },

    // 空状态
    empty_title: "暂无交易记录",
    empty_desc:  "您尚未进行任何充值或消费操作。",

    // 分页
    pagination_info: "显示第 {from}–{to} 条，共 {total} 条",

    // 弹窗
    modal_giftcard_title:       "兑换礼品卡",
    modal_giftcard_placeholder: "输入礼品卡卡号并点击兑换",
    modal_giftcard_cancel:      "取消",
    modal_giftcard_submit:      "兑换",

    modal_topup_title:       "余额充值",
    modal_topup_placeholder: "请输入要充值的金额",
    modal_topup_cancel:      "取消",
    modal_topup_submit:      "充值",
};
