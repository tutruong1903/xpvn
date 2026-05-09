window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.giftcard = window.i18nLocales.admin.giftcard || {};

window.i18nLocales.admin.giftcard.ja_JP = {
    index: {
        title:              "ギフトカード一覧",
        subtitle:           "ギフトカードの確認・管理。",
        search_placeholder: "IDまたはカード番号で検索…",
        create_btn:         "作成",
        delete_confirm:     "このギフトカードを削除しますか？",
        stat_total:         "カード総数",
        stat_unused:        "未使用",
        stat_used:          "使用済み",
    },
    fields: {
        op:          "操作",
        id:          "カードID",
        card:        "カード番号",
        balance:     "額面",
        create_time: "作成日時",
        status:      "使用状況",
        use_time:    "使用日時",
        use_user:    "使用ユーザー",
    },
    create_modal: {
        title:      "ギフトカード作成",
        cancel_btn: "キャンセル",
        submit_btn: "作成",
        // Field labels
        field_card_number: "作成枚数",
        field_card_value:  "額面",
        field_card_length: "カードの長さ",
        // Select options
        opt_12: "12桁",
        opt_18: "18桁",
        opt_24: "24桁",
        opt_30: "30桁",
        opt_36: "36桁",
    },
    badges: {
        unused: "未使用",
        used:   "使用済み",
    },
};
