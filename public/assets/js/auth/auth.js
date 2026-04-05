/**
 * Auth Page Common JavaScript
 * Handles modals, HTMX events, and WebAuthn for login/register pages
 */

// Modal helpers
const authModals = {
    success: {
        show: (message) => {
            document.getElementById('success-message').innerHTML = message;
            document.getElementById('success-dialog').style.display = 'block';
        },
        hide: () => {
            document.getElementById('success-dialog').style.display = 'none';
        }
    },
    fail: {
        show: (message) => {
            document.getElementById('fail-message').innerHTML = message;
            document.getElementById('fail-dialog').style.display = 'block';
        },
        hide: () => {
            document.getElementById('fail-dialog').style.display = 'none';
        }
    },
    tos: {
        show: () => {
            const modal = document.getElementById('tos-modal');
            if (modal) {
                modal.style.display = 'block';
                document.body.style.overflow = 'hidden';
            }
        },
        hide: () => {
            const modal = document.getElementById('tos-modal');
            if (modal) {
                modal.style.display = 'none';
                document.body.style.overflow = '';
            }
        }
    }
};

// HTMX event handlers
htmx.on("htmx:afterRequest", function(evt) {
    // Skip if HX-Redirect header is present
    if (evt.detail.xhr.getResponseHeader('HX-Redirect')) {
        return;
    }
    
    let res = JSON.parse(evt.detail.xhr.response);
    
    if (res.ret === 1) {
        authModals.success.show(res.msg);
        if (res.redir) {
            setTimeout(() => window.location.href = res.redir, 1000);
        }
    } else {
        authModals.fail.show(res.msg);
    }
});

// WebAuthn Login (if available)
function initWebAuthnLogin() {
    const webauthnBtn = document.getElementById('webauthnLogin');
    if (!webauthnBtn || typeof SimpleWebAuthnBrowser === 'undefined') {
        return;
    }

    const { startAuthentication } = SimpleWebAuthnBrowser;
    
    webauthnBtn.addEventListener('click', async () => {
        try {
            const resp = await fetch('/auth/webauthn');
            const options = await resp.json();
            
            let asseResp;
            try {
                asseResp = await startAuthentication({ optionsJSON: options });
            } catch (error) {
                authModals.fail.show(error.toString());
                return;
            }
            
            const verificationResp = await fetch('/auth/webauthn', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(asseResp),
            });
            
            const verificationJSON = await verificationResp.json();
            if (verificationJSON.ret === 1) {
                authModals.success.show(verificationJSON.msg);
                if (verificationJSON.redir) {
                    setTimeout(() => window.location.href = verificationJSON.redir, 1000);
                }
            } else {
                authModals.fail.show(verificationJSON.msg);
            }
        } catch (error) {
            authModals.fail.show('Authentication error: ' + error.toString());
        }
    });
}

// Initialize ToS modal link handlers
function initTosModal() {
    const tosLink = document.getElementById('tos-link');
    const tosModal = document.getElementById('tos-modal');
    const tosClose = document.getElementById('tos-close');
    const tosBackdrop = document.getElementById('tos-backdrop');
    
    if (!tosLink || !tosModal) return;
    
    tosLink.addEventListener('click', (e) => {
        e.preventDefault();
        authModals.tos.show();
    });
    
    if (tosClose) {
        tosClose.addEventListener('click', () => {
            authModals.tos.hide();
        });
    }
    
    if (tosBackdrop) {
        tosBackdrop.addEventListener('click', () => {
            authModals.tos.hide();
        });
    }
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
    initWebAuthnLogin();
    initTosModal();
});

// Export for use in other scripts
window.authModals = authModals;
