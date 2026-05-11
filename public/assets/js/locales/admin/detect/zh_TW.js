window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.detect = window.i18nLocales.admin.detect || {};

window.i18nLocales.admin.detect.zh_TW = {
    rule: {
        title:            "審計規則",
        subtitle:         "查看站點中的審計規則。",
        add_btn:          "新增審計規則",
        add_dialog_title: "新增審計規則",
        cancel_btn:       "取消",
        submit_btn:       "提交",
        delete_confirm:   "確定刪除此審計規則？"
    },
    log: {
        title:    "審計碰撞記錄",
        subtitle: "查看審計碰撞記錄的內容。"
    },
    ban: {
        title:    "審計封禁記錄",
        subtitle: "查看審計封禁記錄的內容。"
    },

    fields: {
        op:                 "操作",
        id:                 "規則ID",
        name:               "規則名稱",
        text:               "規則介紹",
        regex:              "正規表示式",
        type:               "規則類型",
        user_id:            "使用者ID",
        node_id:            "節點ID",
        node_name:          "節點名稱",
        list_id:            "規則ID",
        rule_name:          "規則名稱",
        datetime:           "時間",
        detect_number:      "違規次數",
        ban_time:           "封禁時長(分鐘)",
        start_time:         "統計開始時間",
        end_time:           "統計結束&封禁開始時間",
        ban_end_time:       "封禁結束時間",
        all_detect_number:  "累計違規次數"
    },

    add_dialog: {
        field_name:  "規則名稱",
        ph_name:     "審計規則名稱",
        field_text:  "規則介紹",
        ph_text:     "簡潔明瞭地描述審計規則",
        field_regex: "正規表示式",
        ph_regex:    "用於匹配審計內容的正規表示式",
        field_type:  "規則類型",
        opt_1:       "數據包明文匹配",
        opt_0:       "數據包十六進位匹配"
    }
};
