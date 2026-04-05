/**
 * Edit Page — IM OAuth Provider Binding
 * Only active when #imtype select is enabled (user hasn't linked an IM account yet).
 * Reads telegram bot name from data-telegram-bot attribute on #oauth-provider.
 */
(function () {
    var imTypeSelect = document.getElementById('imtype');
    if (!imTypeSelect || imTypeSelect.disabled) return;

    var oauthProvider = document.getElementById('oauth-provider');
    var telegramBot = oauthProvider ? (oauthProvider.getAttribute('data-telegram-bot') || '') : '';

    function getEditString(key) {
        try {
            var locale = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
            var editLocale = ((window.i18nLocales || {}).user || {}).edit || {};
            var dict = editLocale[locale] || editLocale['en_US'] || {};
            return dict[key] || key;
        } catch (e) {
            return key;
        }
    }

    function showSuccess(msg) {
        document.getElementById('success-message').innerText = msg;
        window.successDialog && window.successDialog.show();
    }

    function showFail(msg) {
        document.getElementById('fail-message').innerText = msg;
        window.failDialog && window.failDialog.show();
    }

    function handleOauthResult(data, type) {
        if (data.ret === 1) {
            if (type === 'telegram') {
                showSuccess(data.msg);
            } else {
                window.location.replace(data.redir);
            }
        } else {
            showFail(data.msg);
        }
    }

    $(imTypeSelect).on('change', function () {
        var val = $(this).val();
        $(oauthProvider).empty();
        if (val === '1') {
            $(oauthProvider).append(
                '<a id="bind-slack" class="btn btn-azure">' + getEditString('btn_link_slack') + '</a>'
            );
        } else if (val === '2') {
            $(oauthProvider).append(
                '<a id="bind-discord" class="btn btn-indigo">' + getEditString('btn_link_discord') + '</a>'
            );
        } else if (val === '4') {
            $(oauthProvider).append(
                '<script async src="https://telegram.org/js/telegram-widget.js?22"' +
                ' data-telegram-login="' + telegramBot + '"' +
                ' data-size="large" data-onauth="onTelegramAuth(user)"' +
                ' data-request-access="write"><\/script>'
            );
        }
    });

    $(oauthProvider).on('click', '#bind-slack', function () {
        $.ajax({
            type: 'POST', url: '/oauth/slack', dataType: 'json',
            success: function (data) { handleOauthResult(data, 'slack'); }
        });
    });

    $(oauthProvider).on('click', '#bind-discord', function () {
        $.ajax({
            type: 'POST', url: '/oauth/discord', dataType: 'json',
            success: function (data) { handleOauthResult(data, 'discord'); }
        });
    });

    /* Exposed globally for Telegram widget callback */
    window.onTelegramAuth = function (user) {
        $.ajax({
            type: 'POST', url: '/oauth/telegram', dataType: 'json',
            data: { user: JSON.stringify(user) },
            success: function (data) { handleOauthResult(data, 'telegram'); }
        });
    };
})();
