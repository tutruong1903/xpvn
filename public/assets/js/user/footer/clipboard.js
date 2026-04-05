/**
 * Clipboard Functionality
 * Initializes ClipboardJS with fallback mechanisms
 */
(function() {
    // Initialize clipboard functionality
    if (typeof ClipboardJS !== 'undefined' && document.querySelector('.copy')) {
        let clipboard = new ClipboardJS('.copy');
        
        clipboard.on('success', function(e) {
            showToast('已复制到剪切板');
            e.clearSelection();
        });
        
        clipboard.on('error', function(e) {
            console.error('复制失败:', e);
            const text = e.trigger.getAttribute('data-clipboard-text');
            if (text) {
                // Try native API first, fallback to prompt
                if (navigator.clipboard && navigator.clipboard.writeText) {
                    navigator.clipboard.writeText(text).then(function() {
                        showToast('已复制到剪切板');
                    }).catch(function(err) {
                        console.error('原生 API 也失败了:', err);
                        prompt('复制失败，请手动复制以下内容：', text);
                    });
                } else {
                    prompt('复制失败，请手动复制以下内容：', text);
                }
            } else {
                showToast('复制失败，请重试', 'danger');
            }
        });
    } else if (typeof ClipboardJS === 'undefined') {
        console.error('ClipboardJS library not loaded');
        document.querySelectorAll('.copy').forEach(function(btn) {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                const text = this.getAttribute('data-clipboard-text');
                if (text) {
                    prompt('请手动复制以下内容：', text);
                }
            });
        });
    }
})();
