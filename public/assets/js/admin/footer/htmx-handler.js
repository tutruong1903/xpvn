/**
 * Admin HTMX After Request Handler
 * Handles HTMX responses and updates UI with response data for admin panel
 */
htmx.on("htmx:afterRequest", function(evt) {
    if (evt.detail.xhr.getResponseHeader('HX-Refresh') === 'true' ||
        evt.detail.xhr.getResponseHeader('HX-Redirect') ||
        evt.detail.xhr.getResponseHeader('HX-Trigger'))
    {
        return;
    }

    try {
        let res = JSON.parse(evt.detail.xhr.response);

        if (typeof res.data !== 'undefined') {
            for (let key in res.data) {
                if (res.data.hasOwnProperty(key)) {
                    let element = document.getElementById(key);

                    if (element) {
                        if (element.tagName === "INPUT" || element.tagName === "TEXTAREA") {
                            element.value = res.data[key];
                        } else {
                            element.innerHTML = res.data[key];
                        }
                    }
                }
            }
        }
        
        if (res.ret === 1) {
            document.getElementById("success-message").innerHTML = res.msg;
            if (window.successDialog) {
                window.successDialog.show();
            } else {
                showToast(res.msg, 'success');
            }
        } else {
            document.getElementById("fail-message").innerHTML = res.msg;
            if (window.failDialog) {
                window.failDialog.show();
            } else {
                showToast(res.msg, 'danger');
            }
        }
    } catch (e) {
        console.error("Failed to parse HTMX response:", e);
        showToast('发生了意外错误', 'danger');
    }
});
