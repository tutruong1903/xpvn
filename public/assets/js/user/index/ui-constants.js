/**
 * UI Constants
 * Constants for UI configuration (animations, classes, buttons)
 */

const CONFIG = {
    ANIMATION_DURATION: 350,
    FEEDBACK_TIMEOUT: 2000,
    CLASSES: {
        BTN_GROUP_MOBILE: 'btn-group-vertical',
        BTN_GROUP_DESKTOP: 'btn-group btn-group-sm', 
        MOBILE_ONLY: 'd-md-none w-100',
        DESKTOP_ONLY: 'd-none d-md-flex',
        MOBILE_SM: 'd-sm-none w-100',
        DESKTOP_SM: 'd-none d-sm-flex'
    },
    BUTTONS: {
        download: { icon: 'ti-download', text: () => getI18n('buttons.download', '下载'), class: 'btn-primary' },
        downloadAppStore: { icon: 'ti-brand-appstore', text: 'App Store', class: 'btn-primary' },
        copy: { icon: 'ti-copy', text: () => getI18n('buttons.copy_subscription', '复制订阅'), class: 'btn-info copy' },
        import: { icon: 'ti-link', text: () => getI18n('buttons.import', '一键导入'), class: 'btn-success' },
        importRecommended: { icon: 'ti-rocket', text: () => getI18n('buttons.import', '一键导入'), class: 'btn-success' }
    }
};
