window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.user = window.i18nLocales.admin.user || {};

window.i18nLocales.admin.user.ja_JP = {
    // ユーザー一覧ページ
    index: {
        title: "ユーザー一覧",
        subtitle: "システム内のすべてのアカウントを管理・監視します。",
        create_btn: "作成",
        create_dialog_title: "ユーザー追加",
        create_dialog_submit: "追加",
        filter_btn: "絞り込み",

        // 統計
        stat_total: "総ユーザー数",
        stat_active: "アクティブ",
        stat_banned: "BAN済み",
        stat_admins: "管理者"
    },

    // 列ヘッダー
    fields: {
        op:              "操作",
        id:              "ID",
        user_name:       "ユーザー名",
        email:           "メール",
        money:           "残高",
        ref_by:          "紹介者",
        transfer_enable: "通信制限",
        transfer_used:   "使用通信量",
        class:           "レベル",
        is_admin:        "管理者?",
        is_banned:       "ステータス",
        is_inactive:     "非アクティブ?",
        reg_date:        "登録日時",
        class_expire:    "有効期限"
    },

    // Badge 値
    badges: {
        active:        "アクティブ",
        banned:        "BAN済み",
        inactive:      "非アクティブ",
        class_basic:   "ベーシック",
        class_std:     "スタンダード",
        class_premium: "プレミアム",
        class_vip:     "VIP"
    },

    // DataTable
    datatable: {
        search_placeholder: "ID・名前・メールで検索...",
        processing: "処理中...",
        length_menu: "_MENU_ 件表示",
        zero_records: "一致する結果が見つかりません",
        info: "_TOTAL_ 件中 _START_ ～ _END_ 件を表示",
        info_empty: "0 件中 0 ～ 0 件を表示",
        info_filtered: "（_MAX_ 件からフィルタリング）",
        empty_table: "データがありません",
        loading: "読み込み中...",
        page_first: "先頭",
        page_last: "最後",
        sort_asc: ": 昇順で並べ替え",
        sort_desc: ": 降順で並べ替え",
        filter_all: "すべて"
    }
};
