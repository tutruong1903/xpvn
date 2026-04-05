window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.edit = window.i18nLocales.user.edit || {};

window.i18nLocales.user.edit.zh_TW = {
    // Page header
    page_title: "資料修改",
    page_subtitle: "更新和管理您在系統上的個人帳戶設定。",

    // Tabs
    tab_info: "資料",
    tab_login: "登入",
    tab_usage: "使用",
    tab_other: "其他",

    // Card: Login Email
    card_email_title: "登入信箱",
    label_current_email: "目前信箱",
    label_new_email: "新信箱",
    label_email_code: "驗證碼",
    btn_get_code: "取得驗證碼",
    btn_update_email: "修改",
    btn_email_disabled: "不允許修改",

    // Card: Username
    card_username_title: "使用者名稱",
    label_current_username: "目前使用者名稱",
    label_new_username: "新使用者名稱",
    btn_update_username: "修改",

    // Card: IM Link
    card_im_link_title: "IM 帳號綁定",
    label_im_type: "IM 類型",
    option_im_none: "未綁定",
    label_im_id: "ID / 使用者名稱",
    btn_link_slack: "綁定 Slack",
    btn_link_discord: "綁定 Discord",

    // Card: IM Unlink
    card_im_unlink_title: "解除綁定 IM 帳戶",
    im_not_linked_text: "您的帳戶目前沒有綁定任何 IM 服務。",
    im_status_not_linked: "狀態：未綁定",
    btn_unlink_im: "解除綁定",

    // Card: Change Password
    card_password_title: "修改登入密碼",
    label_current_password: "目前登入密碼",
    label_new_password: "新密碼",
    label_confirm_password: "確認新密碼",
    btn_change_password: "修改密碼",

    // Card: TOTP
    card_totp_title: "TOTP",
    badge_enabled: "已啟用",
    badge_disabled: "未啟用",
    totp_description: "TOTP 是一種基於時間的一次性密碼演算法，可以使用 Google Authenticator 或 Authy 等客戶端進行驗證。",
    btn_disable_totp: "停用 TOTP",
    btn_enable_totp: "啟用 TOTP",
    confirm_disable_totp: "確認停用 TOTP？",

    // Card: Passkey
    card_passkey_title: "Passkey",
    passkey_description: "Passkey 是一種新的身份驗證標準，使用生物識別或安全金鑰進行身份驗證以取代傳統密碼。",
    passkey_added_at: "新增時間：",
    passkey_last_used: "上次使用：",
    passkey_never_used: "從未使用",
    passkey_unnamed: "未命名",
    btn_delete_device: "刪除",
    confirm_delete_device: "確認刪除此裝置？",
    btn_register_passkey: "註冊 Passkey 裝置",
    passkey_device_name_prompt: "請輸入裝置名稱：",

    // Card: FIDO2
    card_fido_title: "FIDO2",
    fido_description: "FIDO2 是一種基於公鑰加密的身份驗證標準，支援 Yubikey 等硬體安全金鑰。",
    btn_register_fido: "註冊 FIDO2 裝置",

    // Card: Encryption Method
    card_method_title: "變更加密方式",
    method_description: "不同的客戶端支援的加密方式可能有所不同，請參考客戶端支援清單進行設定。",
    label_current_method: "目前加密方式",
    btn_update_method: "修改",

    // Card: Reset Subscription URL
    card_url_reset_title: "重置訂閱位址",
    url_reset_description: "重置訂閱位址後，舊的訂閱位址將無法取得設定，但節點設定仍可使用。如要作廢舊節點設定請配合重置連線密碼操作。",
    btn_reset_url: "重置",

    // Card: Reset Connection Password
    card_passwd_reset_title: "重置連線密碼",
    passwd_reset_description: "重置連線密碼與 UUID，重置後需更新訂閱才能繼續使用。",
    label_current_passwd: "目前連線密碼",
    label_current_uuid: "目前 UUID",
    btn_reset_passwd: "重置",

    // Card: Daily Mail
    card_daily_mail_title: "每日流量報告",
    label_receive_method: "接收方式",
    option_no_receive: "不接收",
    option_email_receive: "郵件接收",
    option_im_receive: "IM 接收",
    btn_update_daily_mail: "修改",

    // Card: Contact Method
    card_contact_method_title: "偏好的聯絡方式",
    contact_method_description: "當 IM 未綁定時，站台仍會向帳戶信箱發送通知。",
    label_contact_method: "聯絡方式",
    option_email: "郵件",
    option_im: "IM",
    btn_update_contact: "修改",

    // Card: Delete Account
    card_delete_account_title: "刪除帳戶資料",
    delete_account_description: "此操作無法復原，您的所有帳戶資料將從伺服器上永久刪除。",
    btn_delete_account: "刪除帳戶",

    // Modal: TOTP Setup
    totp_modal_title: "設定 TOTP",
    totp_scan_instruction: "請使用 Google Authenticator 或 Authy 掃描下面的 QR 碼",
    totp_manual_key: "若無法掃描 QR 碼，可以手動輸入以下密鑰：",
    btn_confirm_totp: "提交",

    // Modal: Delete Account Confirm
    delete_confirm_title: "刪除確認",
    delete_confirm_text: "請確認是否真的要刪除您的帳戶，此操作無法復原，所有帳戶資料將永久刪除。",
    btn_cancel: "取消",
    btn_confirm_delete: "確認刪除",

    // Footer note
    footer_note: "所有變更都需要驗證目前的登入工作階段以確保安全。",
};
