/**
 * Edit Page — Passkey (WebAuthn) & FIDO2 Registration
 * Reads device-name prompt label from i18n locale.
 */
(function () {
    if (typeof SimpleWebAuthnBrowser === 'undefined') return;

    var startRegistration = SimpleWebAuthnBrowser.startRegistration;

    function getPromptLabel() {
        try {
            var locale = window.sspanelI18n ? window.sspanelI18n.getLocale() : 'en_US';
            var editLocale = ((window.i18nLocales || {}).user || {}).edit || {};
            var dict = editLocale[locale] || editLocale['en_US'] || {};
            return dict.passkey_device_name_prompt || 'Enter device name:';
        } catch (e) {
            return 'Enter device name:';
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

    /* ---- FIDO2 ---- */
    var fidoBtn = document.getElementById('fidoReg');
    if (fidoBtn) {
        fidoBtn.addEventListener('click', async function () {
            var resp = await fetch('/user/fido');
            var options = await resp.json();
            var attResp;
            try {
                attResp = await startRegistration({ optionsJSON: options });
            } catch (error) {
                showFail(error.message);
                return;
            }
            attResp.name = prompt(getPromptLabel());
            var verificationResp = await fetch('/user/fido', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(attResp),
            });
            var verificationJSON = await verificationResp.json();
            if (verificationJSON.ret === 1) {
                showSuccess(verificationJSON.msg);
                setTimeout(function () { location.reload(); }, 1000);
            } else {
                showFail(verificationJSON.msg);
            }
        });
    }

    /* ---- Passkey / WebAuthn ---- */
    var webauthnBtn = document.getElementById('webauthnReg');
    if (webauthnBtn) {
        webauthnBtn.addEventListener('click', async function () {
            var resp = await fetch('/user/webauthn');
            var options = await resp.json();
            var attResp;
            try {
                attResp = await startRegistration({ optionsJSON: options });
            } catch (error) {
                showFail(error.message);
                return;
            }
            attResp.name = prompt(getPromptLabel());
            var verificationResp = await fetch('/user/webauthn', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(attResp),
            });
            var verificationJSON = await verificationResp.json();
            if (verificationJSON.ret === 1) {
                showSuccess(verificationJSON.msg);
                setTimeout(function () { location.reload(); }, 1000);
            } else {
                showFail(verificationJSON.msg);
            }
        });
    }
})();
