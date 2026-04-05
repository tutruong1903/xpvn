/**
 * Edit Page — TOTP Setup
 * Only active when #enableTotp button is present (TOTP not yet configured).
 */
(function () {
    var enableBtn = document.getElementById('enableTotp');
    if (!enableBtn) return;

    enableBtn.addEventListener('click', async function () {
        var resp = await fetch('/user/totp');
        var data = await resp.json();
        var modal = new tabler.bootstrap.Modal(document.getElementById('totpModal'), {
            backdrop: 'static',
            keyboard: false
        });
        if (data.ret === 1) {
            var qrcodeElement = document.getElementById('qrcode');
            qrcodeElement.innerHTML = '';
            document.getElementById('totpSecret').innerHTML = data.token;
            new QRCode(qrcodeElement, {
                text: data.url,
                width: 256,
                height: 256,
                colorDark: '#000000',
                colorLight: '#ffffff',
                correctLevel: QRCode.CorrectLevel.H
            });
            modal.show();
        } else {
            document.getElementById('fail-message').innerText = data.msg;
            window.failDialog && window.failDialog.show();
        }
    });

    document.getElementById('submitTotp').addEventListener('click', function () {
        var totpCode = document.getElementById('totpCode').value;
        fetch('/user/totp', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ code: totpCode }),
        })
            .then(function (r) { return r.json(); })
            .then(function (data) {
                var totpModal = new tabler.bootstrap.Modal(document.getElementById('totpModal'));
                if (data.ret === 1) {
                    totpModal.hide();
                    document.getElementById('success-message').innerHTML = data.msg;
                    window.successDialog && window.successDialog.show();
                    setTimeout(function () { location.reload(); }, 1000);
                } else {
                    document.getElementById('fail-message').innerHTML = data.msg;
                    window.failDialog && window.failDialog.show();
                }
            });
    });
})();
