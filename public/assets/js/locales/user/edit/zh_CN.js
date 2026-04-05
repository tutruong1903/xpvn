window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.edit = window.i18nLocales.user.edit || {};

window.i18nLocales.user.edit.zh_CN = {
    // Page header
    page_title: "资料修改",
    page_subtitle: "更新和管理您在系统上的个人账户设置。",

    // Tabs
    tab_info: "资料",
    tab_login: "登录",
    tab_usage: "使用",
    tab_other: "其他",

    // Card: Login Email
    card_email_title: "登录邮箱",
    label_current_email: "当前邮箱",
    label_new_email: "新邮箱",
    label_email_code: "验证码",
    btn_get_code: "获取验证码",
    btn_update_email: "修改",
    btn_email_disabled: "不允许修改",

    // Card: Username
    card_username_title: "用户名",
    label_current_username: "当前用户名",
    label_new_username: "新用户名",
    btn_update_username: "修改",

    // Card: IM Link
    card_im_link_title: "IM 账号绑定",
    label_im_type: "IM 类型",
    option_im_none: "未绑定",
    label_im_id: "ID / 用户名",
    btn_link_slack: "绑定 Slack",
    btn_link_discord: "绑定 Discord",

    // Card: IM Unlink
    card_im_unlink_title: "解绑 IM 账户",
    im_not_linked_text: "您的账户当前没有绑定任何 IM 服务。",
    im_status_not_linked: "状态：未绑定",
    btn_unlink_im: "解绑",

    // Card: Change Password
    card_password_title: "修改登录密码",
    label_current_password: "当前登录密码",
    label_new_password: "新密码",
    label_confirm_password: "确认新密码",
    btn_change_password: "修改密码",

    // Card: TOTP
    card_totp_title: "TOTP",
    badge_enabled: "已启用",
    badge_disabled: "未启用",
    totp_description: "TOTP 是一种基于时间的一次性密码算法，可以使用 Google Authenticator 或 Authy 等客户端进行验证。",
    btn_disable_totp: "禁用 TOTP",
    btn_enable_totp: "启用 TOTP",
    confirm_disable_totp: "确认禁用 TOTP？",

    // Card: Passkey
    card_passkey_title: "Passkey",
    passkey_description: "Passkey 是一种新的身份验证标准，使用生物识别或安全密钥进行身份验证以取代传统密码。",
    passkey_added_at: "添加时间：",
    passkey_last_used: "上次使用：",
    passkey_never_used: "从未使用",
    passkey_unnamed: "未命名",
    btn_delete_device: "删除",
    confirm_delete_device: "确认删除此设备？",
    btn_register_passkey: "注册 Passkey 设备",
    passkey_device_name_prompt: "请输入设备名称：",

    // Card: FIDO2
    card_fido_title: "FIDO2",
    fido_description: "FIDO2 是一种基于公钥加密的身份验证标准，支持 Yubikey 等硬件安全密钥。",
    btn_register_fido: "注册 FIDO2 设备",

    // Card: Encryption Method
    card_method_title: "更换加密方式",
    method_description: "不同的客户端支持的加密方式可能有所不同，请参考客户端支持列表进行设置。",
    label_current_method: "当前加密方式",
    btn_update_method: "修改",

    // Card: Reset Subscription URL
    card_url_reset_title: "重置订阅地址",
    url_reset_description: "重置订阅地址后，旧的订阅地址将无法获取配置，但节点配置仍能使用。如希望作废旧节点配置请配合重置连接密码操作。",
    btn_reset_url: "重置",

    // Card: Reset Connection Password
    card_passwd_reset_title: "重置连接密码",
    passwd_reset_description: "重置连接密码与 UUID，重置后需更新订阅才能继续使用。",
    label_current_passwd: "当前连接密码",
    label_current_uuid: "当前 UUID",
    btn_reset_passwd: "重置",

    // Card: Daily Mail
    card_daily_mail_title: "每日流量报告",
    label_receive_method: "接收方式",
    option_no_receive: "不接收",
    option_email_receive: "邮件接收",
    option_im_receive: "IM 接收",
    btn_update_daily_mail: "修改",

    // Card: Contact Method
    card_contact_method_title: "偏好的联系方式",
    contact_method_description: "当 IM 未绑定时站点依然会向账户邮箱发送通知信息。",
    label_contact_method: "联系方式",
    option_email: "邮件",
    option_im: "IM",
    btn_update_contact: "修改",

    // Card: Delete Account
    card_delete_account_title: "删除账户数据",
    delete_account_description: "此操作无法撤销，您的所有账户数据将会被从服务器上彻底删除。",
    btn_delete_account: "删除账户",

    // Modal: TOTP Setup
    totp_modal_title: "设置 TOTP",
    totp_scan_instruction: "请使用 Google Authenticator 或 Authy 扫描下面的二维码",
    totp_manual_key: "若无法扫描二维码，可以手动输入以下密钥：",
    btn_confirm_totp: "提交",

    // Modal: Delete Account Confirm
    delete_confirm_title: "删除确认",
    delete_confirm_text: "请确认是否真的要删除您的账户，此操作无法撤销，您的所有账户数据将会被从服务器上彻底删除。",
    btn_cancel: "取消",
    btn_confirm_delete: "确认删除",

    // Footer note
    footer_note: "所有更改都需要验证当前登录会话以确保安全。",
};
