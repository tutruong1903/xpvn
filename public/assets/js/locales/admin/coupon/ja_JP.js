window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.coupon = window.i18nLocales.admin.coupon || {};

window.i18nLocales.admin.coupon.ja_JP = {
    index: {
        title:           "クーポン一覧",
        subtitle:        "クーポンの確認・管理。",
        search_placeholder: "IDまたはコードで検索…",
        create_btn:      "作成",
        delete_confirm:  "このクーポンを削除しますか？",
        disable_confirm: "このクーポンを無効にしますか？",
        stat_total:      "クーポン総数",
        stat_active:     "有効",
        stat_disabled:   "無効",
    },
    fields: {
        op:             "操作",
        id:             "ID",
        code:           "コード",
        type:           "種類",
        value:          "値",
        product_id:     "対象商品ID",
        use_time:       "ユーザー毎使用回数",
        total_use_time: "累計使用回数",
        new_user:       "新規ユーザー限定",
        disabled:       "無効",
        use_count:      "使用回数",
        create_time:    "作成日時",
        expire_time:    "有効期限",
    },
    create_modal: {
        title:        "クーポン作成",
        expire_label: "有効期限（空白で無期限）",
        cancel_btn:   "キャンセル",
        submit_btn:   "作成",
        // Field labels
        field_code:             "クーポンコード",
        field_type:             "種類",
        field_value:            "値",
        field_product_id:       "対象商品ID（カンマ区切り）",
        field_use_time:         "ユーザー毎の使用回数制限（0未満で無制限）",
        field_total_use_time:   "累計使用回数制限（0未満で無制限）",
        field_new_user:         "新規ユーザー限定",
        field_generate_method:  "生成方式",
        // Select options
        opt_percentage:   "パーセント",
        opt_fixed:        "固定額",
        opt_1:            "はい",
        opt_0:            "いいえ",
        opt_char:         "指定文字",
        opt_random:       "ランダム文字（コードを無視）",
        opt_char_random:  "指定文字+ランダム文字",
    },
    badges: {
        percentage: "パーセント",
        fixed:      "固定額",
        unlimited:  "無制限",
        never:      "無期限",
        yes:        "はい",
        no:         "いいえ",
    },
};
