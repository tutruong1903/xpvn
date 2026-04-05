/**
 * HTMX After Request Handler
 * Handles HTMX responses and updates UI with response data
 */
htmx.on("htmx:afterRequest", function(evt) {
    if (evt.detail.xhr.getResponseHeader('HX-Refresh') === 'true' ||
        evt.detail.xhr.getResponseHeader('HX-Trigger'))
    {
        return;
    }

    try {
        let res = JSON.parse(evt.detail.xhr.response);

        if (typeof res.data !== 'undefined') {
            // Update DOM elements with response data
            for (let key in res.data) {
                if (res.data.hasOwnProperty(key)) {
                    if (key === "ga-url" && typeof qrcode !== 'undefined') {
                        qrcode.clear();
                        qrcode.makeCode(res.data[key]);
                        continue;
                    }

                    if (key === "last-checkin-time") {
                        const checkInBtn = document.getElementById("check-in");
                        checkInBtn.textContent = "已签到";
                        checkInBtn.disabled = true;
                        continue;
                    }

                    const element = document.getElementById(key);
                    if (element) {
                        if (element.tagName === "INPUT" || element.tagName === "TEXTAREA") {
                            element.value = res.data[key];
                        } else {
                            element.textContent = res.data[key];
                        }
                    }
                }
            }
        }

        // Show success or error message
        const isSuccess = res.ret === 1;
        const messageId = isSuccess ? "success-message" : "fail-message";
        const dialog = isSuccess ? window.successDialog : window.failDialog;
        
        document.getElementById(messageId).textContent = res.msg;
        if (dialog) {
            dialog.show();
        } else {
            showToast(res.msg, isSuccess ? 'success' : 'danger');
        }
    } catch (e) {
        console.error("Failed to parse HTMX response:", e);
        showToast('发生了意外错误', 'danger');
    }
});
