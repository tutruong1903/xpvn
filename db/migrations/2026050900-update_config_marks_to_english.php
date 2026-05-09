<?php

declare(strict_types=1);

use App\Interfaces\MigrationInterface;
use App\Services\DB;

return new class() implements MigrationInterface {
    public function up(): int
    {
        DB::getPdo()->exec("
            UPDATE `config` SET `mark` = CASE `item`
                -- billing
                WHEN 'payment_gateway'            THEN 'Payment Gateway'
                WHEN 'f2f_pay_app_id'             THEN 'F2F Pay App ID'
                WHEN 'f2f_pay_pid'                THEN 'F2F Pay PID'
                WHEN 'f2f_pay_public_key'         THEN 'F2F Pay Public Key'
                WHEN 'f2f_pay_private_key'        THEN 'F2F Pay Private Key'
                WHEN 'f2f_pay_notify_url'         THEN 'F2F Pay Custom Notify URL'
                WHEN 'epay_url'                   THEN 'EPay URL'
                WHEN 'epay_pid'                   THEN 'EPay Merchant ID'
                WHEN 'epay_key'                   THEN 'EPay Merchant Key'
                WHEN 'epay_sign_type'             THEN 'EPay Sign Type'
                WHEN 'epay_alipay'                THEN 'Enable Alipay'
                WHEN 'epay_wechat'                THEN 'Enable WeChat Pay'
                WHEN 'epay_qq'                    THEN 'Enable QQ Wallet'
                WHEN 'epay_usdt'                  THEN 'Enable USDT'
                WHEN 'paypal_mode'                THEN 'PayPal Mode'
                WHEN 'paypal_client_id'           THEN 'PayPal Client ID'
                WHEN 'paypal_client_secret'       THEN 'PayPal Client Secret'
                WHEN 'paypal_currency'            THEN 'PayPal Currency'
                WHEN 'paypal_locale'              THEN 'PayPal Locale'
                WHEN 'cryptomus_api_key'          THEN 'Cryptomus API Key'
                WHEN 'cryptomus_uuid'             THEN 'Cryptomus UUID'
                WHEN 'cryptomus_subtract'         THEN 'Cryptomus Subtract'
                WHEN 'cryptomus_lifetime'         THEN 'Cryptomus Lifetime (seconds)'
                WHEN 'cryptomus_currency'         THEN 'Cryptomus Currency'
                -- email
                WHEN 'email_driver'               THEN 'Email Driver'
                WHEN 'smtp_host'                  THEN 'SMTP Host'
                WHEN 'smtp_username'              THEN 'SMTP Username'
                WHEN 'smtp_password'              THEN 'SMTP Password'
                WHEN 'smtp_port'                  THEN 'SMTP Port'
                WHEN 'smtp_name'                  THEN 'SMTP Sender Name'
                WHEN 'smtp_sender'                THEN 'SMTP Sender Address'
                WHEN 'smtp_ssl'                   THEN 'Enable TLS/SSL'
                WHEN 'smtp_bbc'                   THEN 'BCC Backup Email Address'
                WHEN 'mailgun_key'                THEN 'Mailgun API Key'
                WHEN 'mailgun_domain'             THEN 'Mailgun Domain'
                WHEN 'mailgun_sender'             THEN 'Mailgun Sender'
                WHEN 'mailgun_sender_name'        THEN 'Mailgun Sender Name'
                WHEN 'sendgrid_key'               THEN 'SendGrid API Key'
                WHEN 'sendgrid_sender'            THEN 'SendGrid Sender'
                WHEN 'sendgrid_name'              THEN 'SendGrid Sender Name'
                WHEN 'postmark_key'               THEN 'Postmark API Key'
                WHEN 'postmark_sender'            THEN 'Postmark Sender'
                WHEN 'postmark_stream'            THEN 'Postmark Email Stream'
                WHEN 'postal_host'                THEN 'Postal API Host'
                WHEN 'postal_key'                 THEN 'Postal API Key'
                WHEN 'postal_sender'              THEN 'Postal Sender'
                WHEN 'postal_name'                THEN 'Postal Sender Name'
                WHEN 'aws_ses_access_key_id'      THEN 'AWS SES Access Key ID'
                WHEN 'aws_ses_access_key_secret'  THEN 'AWS SES Access Key Secret'
                WHEN 'aws_ses_region'             THEN 'AWS SES Region'
                WHEN 'email_verify_code_ttl'      THEN 'Email Verify Code TTL (seconds)'
                WHEN 'email_password_reset_ttl'   THEN 'Email Password Reset TTL (seconds)'
                WHEN 'email_request_ip_limit'     THEN 'Email Request Limit Per IP Per Hour'
                WHEN 'email_request_address_limit' THEN 'Email Request Limit Per Address Per Hour'
                -- captcha
                WHEN 'captcha_provider'               THEN 'Captcha Provider'
                WHEN 'enable_reg_captcha'             THEN 'Enable Register Captcha'
                WHEN 'enable_login_captcha'           THEN 'Enable Login Captcha'
                WHEN 'enable_checkin_captcha'         THEN 'Enable Checkin Captcha'
                WHEN 'enable_reset_password_captcha'  THEN 'Enable Reset Password Captcha'
                WHEN 'turnstile_sitekey'              THEN 'Turnstile Site Key'
                WHEN 'turnstile_secret'               THEN 'Turnstile Secret Key'
                WHEN 'geetest_id'                     THEN 'Geetest ID'
                WHEN 'geetest_key'                    THEN 'Geetest Key'
                -- im
                WHEN 'telegram_unbind_kick_member'    THEN 'Auto Kick Member When Telegram Account Unbound'
                WHEN 'telegram_group_bound_user'      THEN 'Allow Only Telegram Bound Users to Join Group'
                WHEN 'telegram_group_quiet'           THEN 'Telegram Bot Quiet in Group'
                WHEN 'allow_to_join_new_groups'       THEN 'Allow Bot to Join New Groups'
                WHEN 'group_id_allowed_to_join'       THEN 'Allowed Group IDs'
                WHEN 'help_any_command'               THEN 'Help on Any Unknown Command'
                WHEN 'enable_welcome_message'         THEN 'Enable Telegram Welcome Message'
                -- support
                WHEN 'crisp_id'                       THEN 'Crisp ID'
                WHEN 'livechat_license'               THEN 'LiveChat License'
                WHEN 'live_chat'                      THEN 'Live Chat Provider'
                WHEN 'enable_ticket'                  THEN 'Enable Ticket System'
                WHEN 'mail_ticket'                    THEN 'Enable Ticket Email Notification'
                WHEN 'ticket_limit'                   THEN 'Ticket Limit Per Month'
                -- reg
                WHEN 'reg_mode'                       THEN 'Registration Mode'
                WHEN 'reg_email_verify'               THEN 'Email Verification'
                WHEN 'random_group'                   THEN 'Random Group on Register'
                WHEN 'min_port'                       THEN 'Min Port'
                WHEN 'max_port'                       THEN 'Max Port'
                WHEN 'free_user_reset_day'            THEN 'Free User Traffic Reset Day'
                WHEN 'free_user_reset_bandwidth'      THEN 'Free User Reset Traffic'
                WHEN 'reg_traffic'                    THEN 'Register Traffic (GB)'
                WHEN 'reg_ip_limit'                   THEN 'Register IP Limit'
                WHEN 'reg_speed_limit'                THEN 'Register Speed Limit (Mbps)'
                WHEN 'reg_class'                      THEN 'Register Class'
                WHEN 'reg_class_time'                 THEN 'Register Class Expiry Days'
                WHEN 'reg_method'                     THEN 'Default Encryption Method'
                WHEN 'reg_daily_report'               THEN 'Enable Daily Report by Default'
                -- ref
                WHEN 'invite_reg_money_reward'        THEN 'Invite Register Money Reward'
                WHEN 'invite_reg_traffic_reward'      THEN 'Invite Register Traffic Reward (GB)'
                WHEN 'invite_mode'                    THEN 'Invite Mode'
                WHEN 'invite_reward_mode'             THEN 'Invite Reward Mode'
                WHEN 'invite_reward_rate'             THEN 'Invite Reward Rate'
                WHEN 'invite_reward_count_limit'      THEN 'Invite Reward Count Limit'
                WHEN 'invite_reward_total_limit'      THEN 'Invite Reward Total Limit'
                -- feature
                WHEN 'display_detect_log'             THEN 'Display Detect Log'
                WHEN 'display_docs'                   THEN 'Display Docs'
                WHEN 'display_docs_only_for_paid_user' THEN 'Docs for Paid Users Only'
                WHEN 'traffic_log'                    THEN 'Enable Hourly Traffic Log'
                WHEN 'traffic_log_retention_days'     THEN 'Traffic Log Retention Days'
                WHEN 'subscribe_log'                  THEN 'Enable Subscribe Log'
                WHEN 'subscribe_log_retention_days'   THEN 'Subscribe Log Retention Days'
                WHEN 'notify_new_subscribe'           THEN 'Notify New Subscribe IP'
                WHEN 'login_log'                      THEN 'Enable Login Log'
                WHEN 'notify_new_login'               THEN 'Notify New Login IP'
                WHEN 'enable_checkin'                 THEN 'Enable Checkin'
                WHEN 'checkin_min'                    THEN 'Min Checkin Traffic (MB)'
                WHEN 'checkin_max'                    THEN 'Max Checkin Traffic (MB)'
                -- subscribe
                WHEN 'enable_forced_replacement'      THEN 'Force Replace Subscribe URL on Password Change'
                -- cron
                WHEN 'enable_daily_finance_mail'      THEN 'Enable Daily Finance Mail'
                WHEN 'enable_weekly_finance_mail'     THEN 'Enable Weekly Finance Mail'
                WHEN 'enable_monthly_finance_mail'    THEN 'Enable Monthly Finance Mail'
                WHEN 'enable_detect_gfw'              THEN 'Enable GFW Detection'
                WHEN 'enable_detect_ban'              THEN 'Enable Detect Ban'
                WHEN 'enable_detect_inactive_user'    THEN 'Enable Inactive User Detection'
                WHEN 'detect_inactive_user_checkin_days' THEN 'Inactive User Checkin Days'
                WHEN 'detect_inactive_user_login_days'   THEN 'Inactive User Login Days'
                WHEN 'detect_inactive_user_use_days'     THEN 'Inactive User Use Days'
                WHEN 'daily_job_hour'                 THEN 'Daily Job Hour'
                WHEN 'daily_job_minute'               THEN 'Daily Job Minute'
                WHEN 'last_daily_job_time'            THEN 'Last Daily Job Time'
                -- db
                WHEN 'db_version'                     THEN 'Current Database Version'
                ELSE `mark`
            END;
        ");

        return 2026050900;
    }

    public function down(): int
    {
        // mark is display-only; no rollback needed
        return 2025073100;
    }
};
