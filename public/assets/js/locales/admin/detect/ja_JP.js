window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.detect = window.i18nLocales.admin.detect || {};

window.i18nLocales.admin.detect.ja_JP = {
    rule: {
        title:            "監査ルール",
        subtitle:         "サイトの監査ルールを表示・管理します。",
        add_btn:          "ルール追加",
        add_dialog_title: "監査ルール追加",
        cancel_btn:       "キャンセル",
        submit_btn:       "送信",
        delete_confirm:   "この監査ルールを削除してもよろしいですか？"
    },
    log: {
        title:    "監査ヒット履歴",
        subtitle: "監査ルールのヒット履歴を表示します。"
    },
    ban: {
        title:    "監査BAN履歴",
        subtitle: "監査によるBAN履歴を表示します。"
    },

    fields: {
        op:                 "操作",
        id:                 "ルールID",
        name:               "ルール名",
        text:               "ルール説明",
        regex:              "正規表現",
        type:               "ルールタイプ",
        user_id:            "ユーザーID",
        node_id:            "ノードID",
        node_name:          "ノード名",
        list_id:            "ルールID",
        rule_name:          "ルール名",
        datetime:           "日時",
        detect_number:      "違反回数",
        ban_time:           "BAN時間(分)",
        start_time:         "統計開始時間",
        end_time:           "統計終了&BAN開始時間",
        ban_end_time:       "BAN終了時間",
        all_detect_number:  "累計違反回数"
    },

    add_dialog: {
        field_name:  "ルール名",
        ph_name:     "監査ルール名",
        field_text:  "ルール説明",
        ph_text:     "監査ルールの簡潔な説明",
        field_regex: "正規表現",
        ph_regex:    "監査内容をマッチする正規表現",
        field_type:  "ルールタイプ",
        opt_1:       "パケット平文マッチ",
        opt_0:       "パケット16進数マッチ"
    }
};
