window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.edit = window.i18nLocales.user.edit || {};

window.i18nLocales.user.edit.en_US = {
    // Page header
    page_title: "Edit Account",
    page_subtitle: "Update and manage your personal account settings.",

    // Tabs
    tab_info: "Profile",
    tab_login: "Security",
    tab_usage: "Usage",
    tab_other: "Other",

    // Card: Login Email
    card_email_title: "Login Email",
    label_current_email: "Current Email",
    label_new_email: "New Email",
    label_email_code: "Verification Code",
    btn_get_code: "Get Code",
    btn_update_email: "Update",
    btn_email_disabled: "Change Not Allowed",

    // Card: Username
    card_username_title: "Username",
    label_current_username: "Current Username",
    label_new_username: "New Username",
    btn_update_username: "Update",

    // Card: IM Link
    card_im_link_title: "Link IM Account",
    label_im_type: "IM Type",
    option_im_none: "Not Linked",
    label_im_id: "ID / Username",
    btn_link_slack: "Link Slack",
    btn_link_discord: "Link Discord",

    // Card: IM Unlink
    card_im_unlink_title: "Unlink IM Account",
    im_not_linked_text: "You have no instant messaging (IM) account linked to the system.",
    im_status_not_linked: "Status: Not linked",
    btn_unlink_im: "Unlink",

    // Card: Change Password
    card_password_title: "Change Login Password",
    label_current_password: "Current Password",
    label_new_password: "New Password",
    label_confirm_password: "Confirm New Password",
    btn_change_password: "Change Password",

    // Card: TOTP
    card_totp_title: "TOTP",
    badge_enabled: "Enabled",
    badge_disabled: "Disabled",
    totp_description: "TOTP is a time-based one-time password algorithm. Use Google Authenticator or Authy to authenticate.",
    btn_disable_totp: "Disable TOTP",
    btn_enable_totp: "Enable TOTP",
    confirm_disable_totp: "Confirm disable TOTP?",

    // Card: Passkey
    card_passkey_title: "Passkey",
    passkey_description: "Passkey is a new authentication standard using biometrics or security keys to replace traditional passwords.",
    passkey_added_at: "Added:",
    passkey_last_used: "Last used:",
    passkey_never_used: "Never used",
    passkey_unnamed: "Unnamed",
    btn_delete_device: "Delete",
    confirm_delete_device: "Confirm delete this device?",
    btn_register_passkey: "Register Passkey",
    passkey_device_name_prompt: "Enter device name:",

    // Card: FIDO2
    card_fido_title: "FIDO2",
    fido_description: "FIDO2 is a public key cryptography authentication standard supporting Yubikey and hardware security keys.",
    btn_register_fido: "Register FIDO2",

    // Card: Encryption Method
    card_method_title: "Encryption Method",
    method_description: "Different clients support different encryption methods. Please check your client's supported list.",
    label_current_method: "Current Method",
    btn_update_method: "Update",

    // Card: Reset Subscription URL
    card_url_reset_title: "Reset Subscription URL",
    url_reset_description: "After resetting, the old subscription URL will no longer work. Existing node configurations remain usable until the connection password is also reset.",
    btn_reset_url: "Reset",

    // Card: Reset Connection Password
    card_passwd_reset_title: "Reset Connection Password",
    passwd_reset_description: "Reset connection password and UUID. You need to update your subscription to continue using.",
    label_current_passwd: "Current Connection Password",
    label_current_uuid: "Current UUID",
    btn_reset_passwd: "Reset",

    // Card: Daily Mail
    card_daily_mail_title: "Daily Traffic Report",
    label_receive_method: "Receive Method",
    option_no_receive: "Do not receive",
    option_email_receive: "Receive via Email",
    option_im_receive: "Receive via IM",
    btn_update_daily_mail: "Update",

    // Card: Contact Method
    card_contact_method_title: "Preferred Contact Method",
    contact_method_description: "When IM is not linked, the system will always send notifications via account email.",
    label_contact_method: "Method",
    option_email: "Email",
    option_im: "IM",
    btn_update_contact: "Update",

    // Card: Delete Account
    card_delete_account_title: "Delete Account Data",
    delete_account_description: "This action cannot be undone. All account data will be permanently deleted from the system.",
    btn_delete_account: "Delete Account",

    // Modal: TOTP Setup
    totp_modal_title: "Setup TOTP",
    totp_scan_instruction: "Use Google Authenticator or Authy to scan the QR code below",
    totp_manual_key: "If you cannot scan the QR code, manually enter the secret key below:",
    btn_confirm_totp: "Confirm",

    // Modal: Delete Account Confirm
    delete_confirm_title: "Confirm Delete",
    delete_confirm_text: "Are you sure you want to delete your account? This action cannot be undone. All account data will be permanently deleted.",
    btn_cancel: "Cancel",
    btn_confirm_delete: "Confirm Delete",

    // Footer note
    footer_note: "All changes require authentication of the current login session to ensure security.",
};
