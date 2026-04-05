/**
 * Configuration & Data
 * Global configuration and data that will be populated by template
 * This file should be loaded first before other modules
 */

// App configuration - will be populated by template
window.APP_CONFIG = window.APP_CONFIG || {
    enableR2Download: false,
    universalSubUrl: "",
    appName: "",
    enableSsSub: false,
    enableV2Sub: false,
    enableTrojanSub: false
};

// Platform icons mapping - will be populated by template
window.platformIcons = window.platformIcons || {};

// Client recommendations - will be populated by template
window.clientRecommendations = window.clientRecommendations || {};

// Traffic log data - will be populated by template (if traffic_log is enabled)
window.trafficLogData = window.trafficLogData || [];
