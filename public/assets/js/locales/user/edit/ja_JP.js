window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.edit = window.i18nLocales.user.edit || {};

window.i18nLocales.user.edit.ja_JP = {
    // Page header
    page_title: "アカウント編集",
    page_subtitle: "システム上の個人アカウント設定を更新・管理します。",

    // Tabs
    tab_info: "プロフィール",
    tab_login: "セキュリティ",
    tab_usage: "使用状況",
    tab_other: "その他",

    // Card: Login Email
    card_email_title: "ログインメール",
    label_current_email: "現在のメール",
    label_new_email: "新しいメール",
    label_email_code: "確認コード",
    btn_get_code: "コードを取得",
    btn_update_email: "更新",
    btn_email_disabled: "変更不可",

    // Card: Username
    card_username_title: "ユーザー名",
    label_current_username: "現在のユーザー名",
    label_new_username: "新しいユーザー名",
    btn_update_username: "更新",

    // Card: IM Link
    card_im_link_title: "IMアカウント連携",
    label_im_type: "IMの種類",
    option_im_none: "未連携",
    label_im_id: "ID / ユーザー名",
    btn_link_slack: "Slackを連携",
    btn_link_discord: "Discordを連携",

    // Card: IM Unlink
    card_im_unlink_title: "IMアカウント連携解除",
    im_not_linked_text: "現在、IMサービスは何も連携されていません。",
    im_status_not_linked: "ステータス：未連携",
    btn_unlink_im: "連携解除",

    // Card: Change Password
    card_password_title: "ログインパスワード変更",
    label_current_password: "現在のパスワード",
    label_new_password: "新しいパスワード",
    label_confirm_password: "新しいパスワード（確認）",
    btn_change_password: "パスワードを変更",

    // Card: TOTP
    card_totp_title: "TOTP",
    badge_enabled: "有効",
    badge_disabled: "無効",
    totp_description: "TOTPは時間ベースのワンタイムパスワードアルゴリズムです。Google AuthenticatorまたはAuthyを使用して認証できます。",
    btn_disable_totp: "TOTPを無効化",
    btn_enable_totp: "TOTPを有効化",
    confirm_disable_totp: "TOTPを無効化しますか？",

    // Card: Passkey
    card_passkey_title: "パスキー",
    passkey_description: "パスキーは生体認証やセキュリティキーを使用して従来のパスワードを置き換える新しい認証標準です。",
    passkey_added_at: "追加日時：",
    passkey_last_used: "最終使用：",
    passkey_never_used: "未使用",
    passkey_unnamed: "名前なし",
    btn_delete_device: "削除",
    confirm_delete_device: "このデバイスを削除しますか？",
    btn_register_passkey: "パスキーを登録",
    passkey_device_name_prompt: "デバイス名を入力してください：",

    // Card: FIDO2
    card_fido_title: "FIDO2",
    fido_description: "FIDO2は公開鍵暗号を使用した認証標準で、Yubikeyなどのハードウェアセキュリティキーをサポートしています。",
    btn_register_fido: "FIDO2デバイスを登録",

    // Card: Encryption Method
    card_method_title: "暗号化方式の変更",
    method_description: "クライアントによってサポートされる暗号化方式が異なります。クライアントのサポートリストをご確認ください。",
    label_current_method: "現在の暗号化方式",
    btn_update_method: "変更",

    // Card: Reset Subscription URL
    card_url_reset_title: "サブスクリプションURLのリセット",
    url_reset_description: "リセット後、古いサブスクリプションURLは使用できなくなります。既存のノード設定は接続パスワードをリセットするまで引き続き使用できます。",
    btn_reset_url: "リセット",

    // Card: Reset Connection Password
    card_passwd_reset_title: "接続パスワードのリセット",
    passwd_reset_description: "接続パスワードとUUIDをリセットします。リセット後、サブスクリプションを更新する必要があります。",
    label_current_passwd: "現在の接続パスワード",
    label_current_uuid: "現在のUUID",
    btn_reset_passwd: "リセット",

    // Card: Daily Mail
    card_daily_mail_title: "毎日のトラフィックレポート",
    label_receive_method: "受信方法",
    option_no_receive: "受信しない",
    option_email_receive: "メールで受信",
    option_im_receive: "IMで受信",
    btn_update_daily_mail: "更新",

    // Card: Contact Method
    card_contact_method_title: "優先連絡方法",
    contact_method_description: "IMが連携されていない場合、システムは常にアカウントのメールアドレスに通知を送信します。",
    label_contact_method: "連絡方法",
    option_email: "メール",
    option_im: "IM",
    btn_update_contact: "更新",

    // Card: Delete Account
    card_delete_account_title: "アカウントデータの削除",
    delete_account_description: "この操作は取り消せません。すべてのアカウントデータがシステムから永久に削除されます。",
    btn_delete_account: "アカウントを削除",

    // Modal: TOTP Setup
    totp_modal_title: "TOTPの設定",
    totp_scan_instruction: "Google AuthenticatorまたはAuthyを使用して以下のQRコードをスキャンしてください",
    totp_manual_key: "QRコードをスキャンできない場合は、以下のシークレットキーを手動で入力してください：",
    btn_confirm_totp: "確認",

    // Modal: Delete Account Confirm
    delete_confirm_title: "削除の確認",
    delete_confirm_text: "本当にアカウントを削除しますか？この操作は取り消せません。すべてのアカウントデータが永久に削除されます。",
    btn_cancel: "キャンセル",
    btn_confirm_delete: "削除を確認",

    // Footer note
    footer_note: "すべての変更は安全性を確保するために現在のログインセッションの認証が必要です。",
};
