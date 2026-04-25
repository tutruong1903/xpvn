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
        delete_confirm: "このユーザーを削除しますか？",

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

    // ユーザー編集ページ
    edit: {
        // ヘッダー
        title: "管理コンソール",
        breadcrumb_dashboard: "ダッシュボード",
        breadcrumb_users: "ユーザー",
        breadcrumb_edit: "編集",
        save_btn: "変更を保存",
        cancel_btn: "キャンセル",

        // セクション見出し
        section_account: "アカウント情報",
        section_usage: "利用制限",
        section_other: "その他の設定",
        section_history: "活動履歴",

        // アカウントフィールド
        field_email: "メール",
        field_username: "ユーザー名",
        field_password: "パスワード（空欄なら変更しない）",
        field_balance: "残高",
        field_ref_by: "紹介者",
        field_port: "SSポート",
        field_method: "暗号化方式",

        // 活動履歴
        history_reg_ip: "登録IP",
        history_reg_date: "登録日時",
        history_last_use: "最終使用時刻",
        history_last_checkin: "最終チェックイン",
        history_last_login: "最終ログイン時刻",

        // 利用制限フィールド
        field_transfer_enable: "通信制限 (GB)",
        field_transfer_used: "当期使用量",
        field_transfer_total: "累計使用量",
        field_class: "レベル",
        field_node_group: "ノードグループ",
        field_class_expire: "レベル有効期限",
        field_auto_reset_day: "通信量リセット日",
        field_auto_reset_bandwidth: "リセット通信量 (GB)",
        field_speedlimit: "速度制限 (Mbps)",
        field_iplimit: "最大接続数",

        // その他の設定フィールド
        field_locale: "表示言語",
        field_is_admin: "管理者権限",
        field_ga_enable: "2段階認証",
        field_is_shadow_banned: "シャドウバン",
        field_is_banned: "ユーザーBAN",
        field_banned_reason: "BAN理由",
        field_remark: "管理者メモ",

        // レベルオプション
        level_basic: "ベーシック",
        level_standard: "スタンダード",
        level_premium: "プレミアム",
        level_vip: "VIP",

        // Badge
        badge_2fa_active: "有効",

        // プレースホルダー
        ph_password: "空欄の場合パスワードを変更しません",
        ph_banned_reason: "BAN理由を入力...",
        ph_remark: "管理者のみ閲覧可能..."
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
