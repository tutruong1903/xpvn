/**
 * SSPanel-UIM Client-side i18n for guest pages (landing, login, register)
 * Stores language preference in localStorage and swaps text via data-i18n attributes.
 */
(function () {
    const translations = {
        en_US: {
            // Navbar & common
            login: "Login",
            register: "Register",
            // Landing - Hero
            hero_title_1: "Secure & Fast",
            hero_title_2: "VPN Service",
            hero_desc: "Access the internet freely, securely, and without limits. Powered by next-generation protocols for the best experience.",
            get_started: "Get Started",
            sign_in: "Sign In",
            // Landing - Features
            why_choose: "Why Choose Us?",
            why_choose_desc: "Everything you need for secure internet access",
            feat_fast: "Lightning Fast",
            feat_fast_desc: "High-performance servers with optimized routing for the best speeds.",
            feat_encrypt: "Fully Encrypted",
            feat_encrypt_desc: "Military-grade encryption protects your data and privacy at all times.",
            feat_global: "Global Network",
            feat_global_desc: "Servers worldwide give you unrestricted access to any content.",
            feat_multi: "Multi-Platform",
            feat_multi_desc: "Works on Windows, macOS, iOS, Android, and Linux with easy setup.",
            // Landing - Protocols
            protocols_title: "Supported Protocols",
            protocols_desc: "Latest protocols for the best performance and security",
            // Landing - CTA
            cta_title: "Ready to Get Started?",
            cta_desc: "Join now and experience the internet without boundaries.",
            cta_btn: "Create Free Account",
            // Landing - Footer
            footer_rights: "All rights reserved.",
            footer_tos: "Terms of Service",
            footer_staff: "Staff",
            // Login page
            login_title: "Sign in to your account",
            login_email: "Email",
            login_password: "Password",
            login_forgot: "Forgot password",
            login_remember: "Remember this device",
            login_btn: "Login",
            login_webauthn: "Login with WebAuthn",
            login_no_account: "Don't have an account?",
            login_register_link: "Register here",
            // Register page
            register_title: "Create an account",
            register_name: "Nickname",
            register_email: "Email address",
            register_email_code: "Email verification code",
            register_email_get: "Send",
            register_password: "Password",
            register_confirm: "Confirm password",
            register_invite: "Invite code",
            register_invite_optional: "(optional)",
            register_invite_required: "(required)",
            register_tos: "I have read and agree to the",
            register_tos_link: "Terms of Service & Privacy Policy",
            register_btn: "Register",
            register_closed: "Registration is currently closed. Please check back later.",
            register_has_account: "Already have an account?",
            register_login_link: "Sign in",
        },
        zh_CN: {
            login: "登录",
            register: "注册",
            hero_title_1: "安全 & 快速",
            hero_title_2: "VPN 服务",
            hero_desc: "自由、安全、无限制地访问互联网。采用下一代协议，提供最佳体验。",
            get_started: "立即开始",
            sign_in: "登录",
            why_choose: "为什么选择我们？",
            why_choose_desc: "安全访问互联网所需的一切",
            feat_fast: "极速连接",
            feat_fast_desc: "高性能服务器与优化路由，为您提供最佳速度。",
            feat_encrypt: "全程加密",
            feat_encrypt_desc: "军事级加密技术，随时保护您的数据和隐私。",
            feat_global: "全球网络",
            feat_global_desc: "遍布全球的服务器，让您无限制地访问任何内容。",
            feat_multi: "多平台支持",
            feat_multi_desc: "支持 Windows、macOS、iOS、Android 和 Linux，轻松配置。",
            protocols_title: "支持的协议",
            protocols_desc: "最新协议，提供最佳性能和安全性",
            cta_title: "准备好开始了吗？",
            cta_desc: "立即加入，体验无边界的互联网。",
            cta_btn: "免费创建账户",
            footer_rights: "保留所有权利。",
            footer_tos: "服务条款",
            footer_staff: "工作团队",
            login_title: "登录到用户中心",
            login_email: "邮箱",
            login_password: "登录密码",
            login_forgot: "忘记密码",
            login_remember: "记住此设备",
            login_btn: "登录",
            login_webauthn: "使用WebAuthn登录",
            login_no_account: "还没有账户？",
            login_register_link: "点击注册",
            register_title: "注册账户",
            register_name: "昵称",
            register_email: "电子邮箱",
            register_email_code: "邮箱验证码",
            register_email_get: "获取",
            register_password: "登录密码",
            register_confirm: "重复登录密码",
            register_invite: "注册邀请码",
            register_invite_optional: "（可选）",
            register_invite_required: "（必填）",
            register_tos: "我已阅读并同意",
            register_tos_link: "服务条款与隐私政策",
            register_btn: "注册新账户",
            register_closed: "还没有开放注册，过两天再来看看吧",
            register_has_account: "已有账户？",
            register_login_link: "点击登录",
        },
        zh_TW: {
            login: "登入",
            register: "註冊",
            hero_title_1: "安全 & 快速",
            hero_title_2: "VPN 服務",
            hero_desc: "自由、安全、無限制地存取網際網路。採用新一代協定，提供最佳體驗。",
            get_started: "立即開始",
            sign_in: "登入",
            why_choose: "為什麼選擇我們？",
            why_choose_desc: "安全存取網際網路所需的一切",
            feat_fast: "極速連線",
            feat_fast_desc: "高效能伺服器與最佳化路由，為您提供最佳速度。",
            feat_encrypt: "全程加密",
            feat_encrypt_desc: "軍事級加密技術，隨時保護您的資料和隱私。",
            feat_global: "全球網路",
            feat_global_desc: "遍佈全球的伺服器，讓您無限制地存取任何內容。",
            feat_multi: "多平台支援",
            feat_multi_desc: "支援 Windows、macOS、iOS、Android 和 Linux，輕鬆設定。",
            protocols_title: "支援的協定",
            protocols_desc: "最新協定，提供最佳效能和安全性",
            cta_title: "準備好開始了嗎？",
            cta_desc: "立即加入，體驗無邊界的網際網路。",
            cta_btn: "免費建立帳號",
            footer_rights: "保留所有權利。",
            footer_tos: "服務條款",
            footer_staff: "工作團隊",
            login_title: "登入到使用者中心",
            login_email: "電子信箱",
            login_password: "登入密碼",
            login_forgot: "忘記密碼",
            login_remember: "記住此裝置",
            login_btn: "登入",
            login_webauthn: "使用WebAuthn登入",
            login_no_account: "還沒有帳號？",
            login_register_link: "點擊註冊",
            register_title: "註冊帳號",
            register_name: "暱稱",
            register_email: "電子信箱",
            register_email_code: "信箱驗證碼",
            register_email_get: "取得",
            register_password: "登入密碼",
            register_confirm: "重複登入密碼",
            register_invite: "註冊邀請碼",
            register_invite_optional: "（選填）",
            register_invite_required: "（必填）",
            register_tos: "我已閱讀並同意",
            register_tos_link: "服務條款與隱私政策",
            register_btn: "註冊新帳號",
            register_closed: "還沒有開放註冊，過兩天再來看看吧",
            register_has_account: "已有帳號？",
            register_login_link: "點擊登入",
        },
        ja_JP: {
            login: "ログイン",
            register: "登録",
            hero_title_1: "安全 & 高速",
            hero_title_2: "VPNサービス",
            hero_desc: "自由に、安全に、制限なくインターネットにアクセス。次世代プロトコルで最高の体験を。",
            get_started: "今すぐ始める",
            sign_in: "ログイン",
            why_choose: "なぜ私たちを選ぶのか？",
            why_choose_desc: "安全なインターネットアクセスに必要なすべて",
            feat_fast: "超高速",
            feat_fast_desc: "高性能サーバーと最適化されたルーティングで最高速度を提供。",
            feat_encrypt: "完全暗号化",
            feat_encrypt_desc: "軍事レベルの暗号化がデータとプライバシーを常に保護。",
            feat_global: "グローバルネットワーク",
            feat_global_desc: "世界中のサーバーで制限なくコンテンツにアクセス。",
            feat_multi: "マルチプラットフォーム",
            feat_multi_desc: "Windows、macOS、iOS、Android、Linuxに対応。簡単セットアップ。",
            protocols_title: "対応プロトコル",
            protocols_desc: "最新プロトコルで最高のパフォーマンスとセキュリティ",
            cta_title: "始める準備はできましたか？",
            cta_desc: "今すぐ参加して、ボーダレスなインターネットを体験しましょう。",
            cta_btn: "無料アカウント作成",
            footer_rights: "All rights reserved.",
            footer_tos: "利用規約",
            footer_staff: "スタッフ",
            login_title: "アカウントにログイン",
            login_email: "メールアドレス",
            login_password: "パスワード",
            login_forgot: "パスワードを忘れた",
            login_remember: "このデバイスを記憶",
            login_btn: "ログイン",
            login_webauthn: "WebAuthnでログイン",
            login_no_account: "アカウントをお持ちでないですか？",
            login_register_link: "新規登録",
            register_title: "アカウント登録",
            register_name: "ニックネーム",
            register_email: "メールアドレス",
            register_email_code: "メール認証コード",
            register_email_get: "送信",
            register_password: "パスワード",
            register_confirm: "パスワード確認",
            register_invite: "招待コード",
            register_invite_optional: "（任意）",
            register_invite_required: "（必須）",
            register_tos: "以下に同意します",
            register_tos_link: "利用規約とプライバシーポリシー",
            register_btn: "新規登録",
            register_closed: "現在登録は受け付けておりません。後日お越しください。",
            register_has_account: "既にアカウントをお持ちですか？",
            register_login_link: "ログイン",
        },
    };

    const supportedLocales = ["en_US", "zh_CN", "zh_TW", "ja_JP"];
    const localeLabels = { en_US: "English", zh_CN: "中文", zh_TW: "正體中文", ja_JP: "日本語" };
    const localeFlags = { en_US: "🇺🇸", zh_CN: "🇨🇳", zh_TW: "🇹🇼", ja_JP: "🇯🇵" };

    function getLocale() {
        return localStorage.getItem("sspanel_locale") || "en_US";
    }

    function setLocale(locale) {
        localStorage.setItem("sspanel_locale", locale);
        applyTranslations(locale);
        updateSwitcherLabel(locale);
    }

    function applyTranslations(locale) {
        const dict = translations[locale] || translations["en_US"];
        document.querySelectorAll("[data-i18n]").forEach(function (el) {
            const key = el.getAttribute("data-i18n");
            if (dict[key]) {
                el.textContent = dict[key];
            }
        });
        document.querySelectorAll("[data-i18n-placeholder]").forEach(function (el) {
            const key = el.getAttribute("data-i18n-placeholder");
            if (dict[key]) {
                el.setAttribute("placeholder", dict[key]);
            }
        });
        document.querySelectorAll("[data-i18n-html]").forEach(function (el) {
            const key = el.getAttribute("data-i18n-html");
            if (dict[key]) {
                el.innerHTML = dict[key];
            }
        });
    }

    function updateSwitcherLabel(locale) {
        const btn = document.getElementById("locale-switcher-btn");
        if (btn) {
            btn.innerHTML = '<i class="ti ti-language icon"></i> ' + localeFlags[locale] + " " + localeLabels[locale];
        }
    }

    function createSwitcher() {
        const locale = getLocale();
        const container = document.createElement("div");
        container.className = "dropdown position-fixed";
        container.style.cssText = "bottom:20px;right:20px;z-index:1050;";

        let menuItems = "";
        supportedLocales.forEach(function (loc) {
            const active = loc === locale ? " active" : "";
            menuItems += '<a class="dropdown-item' + active + '" href="#" data-locale="' + loc + '">'
                + localeFlags[loc] + " " + localeLabels[loc] + "</a>";
        });

        container.innerHTML =
            '<button id="locale-switcher-btn" class="btn btn-outline-secondary shadow" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
            '<i class="ti ti-language icon"></i> ' + localeFlags[locale] + " " + localeLabels[locale] +
            '</button>' +
            '<div class="dropdown-menu dropdown-menu-end">' + menuItems + "</div>";

        document.body.appendChild(container);

        container.querySelectorAll("[data-locale]").forEach(function (item) {
            item.addEventListener("click", function (e) {
                e.preventDefault();
                setLocale(this.getAttribute("data-locale"));
                // Update active state
                container.querySelectorAll("[data-locale]").forEach(function (a) { a.classList.remove("active"); });
                this.classList.add("active");
            });
        });
    }

    // Initialize
    document.addEventListener("DOMContentLoaded", function () {
        createSwitcher();
        applyTranslations(getLocale());
    });

    // Expose for external use
    window.sspanelI18n = { setLocale: setLocale, getLocale: getLocale, translations: translations };
})();
