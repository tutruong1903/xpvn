/**
 * OS Detection
 * Detects user's operating system from user agent
 */

function detectOS() {
    const userAgent = navigator.userAgent;
    if (userAgent.indexOf("Win") !== -1) return "Windows";
    if (userAgent.indexOf("Mac") !== -1) return "macOS";
    if (userAgent.indexOf("Android") !== -1) return "Android";
    if (userAgent.match(/iPhone|iPad|iPod/i)) return "iOS";
    if (userAgent.indexOf("Linux") !== -1) return "Linux";
    return "Windows";
}
