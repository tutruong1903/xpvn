window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.node = window.i18nLocales.admin.node || {};

window.i18nLocales.admin.node.en_US = {
    // Node list page
    index: {
        title:               "Node List",
        subtitle:            "Manage all proxy nodes in the system.",
        create_btn:          "Create",
        filter_btn:          "Filter",
        search_placeholder:  "Quick search ID, name or address...",
        delete_confirm:      "Are you sure you want to delete this node?",
        copy_confirm:        "Are you sure you want to copy this node?",

        stat_total:     "Total Nodes",
        stat_online:    "Online",
        stat_hidden:    "Hidden",
        stat_bandwidth: "Total Bandwidth Used (GB)"
    },

    // Column headers
    fields: {
        op:                      "Actions",
        id:                      "Node ID",
        name:                    "Name",
        server:                  "Address",
        type:                    "Visibility",
        sort:                    "Protocol",
        traffic_rate:            "Rate",
        is_dynamic_rate:         "Dynamic Rate",
        dynamic_rate_type:       "Dynamic Rate Type",
        node_class:              "Level",
        node_group:              "Group",
        node_bandwidth_limit:    "Bandwidth Limit/GB",
        node_bandwidth:          "Used Bandwidth/GB",
        bandwidthlimit_resetday: "Reset Day"
    },

    // Create / Edit node page
    create: {
        title:              "Create Node",
        subtitle:           "Initialize a new network node in your infrastructure. Configure connection parameters and traffic limits to optimize user performance.",
        save_btn:           "Save Configuration",
        cancel_btn:         "Cancel",

        // Section headings
        section_basic:      "Basic Information",
        section_config:     "Custom Configuration",
        section_dynamic:    "Dynamic Rate Configuration",
        section_other:      "Other Information",
        section_traffic:    "Traffic Settings",

        // Basic fields
        field_name:         "Server Name",
        field_server:       "Connection Address",
        field_traffic_rate: "Traffic Rate",
        field_sort:         "Protocol Type",

        // Custom config
        config_badge:       "JSON Editor",
        config_docs_link:   "custom configuration docs",
        config_docs_text:   "Please refer to the",
        config_docs_suffix: "to modify the node custom config.",
        field_show_node:    "Show this node",
        show_node_desc:     "Allow the node to appear in the node list.",

        // Dynamic rate
        field_enable_dynamic: "Enable dynamic traffic rate",
        field_dynamic_type:   "Dynamic rate calculation method",
        field_max_rate:       "Maximum rate",
        field_max_rate_time:  "Max rate time (hour)",
        field_min_rate:       "Minimum rate",
        field_min_rate_time:  "Min rate time (hour)",
        dynamic_hint:         "Max rate must be greater than min rate, otherwise it will have no effect.",
        dynamic_type_linear:  "Linear",
        dynamic_type_logistic: "Logistic",

        // Other info
        field_node_class:   "Level",
        field_node_group:   "Group",

        // Level names
        level_basic:    "Basic",
        level_standard: "Standard",
        level_premium:  "Premium",
        level_vip:      "VIP",

        // Group names
        group_default:  "Default",
        group_premium:  "Premium",

        // Traffic
        field_bandwidth_limit:    "Available Bandwidth (GB)",
        field_bandwidth_resetday: "Bandwidth Reset Day",
        field_speedlimit:         "Max Speed (Mbps)",

        // Protocol options
        protocol_trojan:         "Trojan",
        protocol_vmess:          "Vmess",
        protocol_tuic:           "TUIC",
        protocol_ss2022:         "Shadowsocks2022",
        protocol_ss:             "Shadowsocks"
    },

    // Edit node page
    edit: {
        title:               "Edit Node",
        subtitle:            "Update the connection parameters and configuration for this proxy node.",
        section_advanced:    "Advanced Options",
        field_ipv4:          "IPv4 Address",
        field_ipv6:          "IPv6 Address",
        field_used_bandwidth: "Used Bandwidth",
        field_password_key:  "Communication Key",
        password_key_desc:   "Used for NodeAPI authentication. Click Reset to regenerate.",
        reset_btn:           "Reset",
        copy_btn:            "Copy",
        save_btn:            "Save Changes",
        cancel_btn:          "Cancel",
        clipboard_success:   "Copied to clipboard"
    },

    // Filter panel
    filter: {
        type_label: "Visibility",
        sort_label: "Protocol",
        all:        "All",
        visible:    "Visible",
        hidden:     "Hidden"
    }
};
