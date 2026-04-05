/**
 * Toast Notification
 * Shows temporary toast messages for success/error feedback
 */
function showToast(message, type = 'success') {
    const toast = document.createElement('div');
    const bgColor = type === 'danger' ? 'bg-danger' : 'bg-success';
    toast.className = 'position-fixed top-0 start-50 translate-middle-x mt-3 ' + bgColor + ' text-white px-4 py-2 rounded';
    toast.style.zIndex = '9999';
    toast.textContent = message;
    document.body.appendChild(toast);
    setTimeout(function() {
        toast.remove();
    }, 2000);
}
