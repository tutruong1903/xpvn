window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.product = window.i18nLocales.admin.product || {};

window.i18nLocales.admin.product.en_US = {
    // Product list page
    index: {
        title:              "Product List",
        subtitle:           "Manage all products and subscription plans.",
        create_btn:         "Create",
        search_placeholder: "Search by ID or name...",
        delete_confirm:     "Are you sure you want to delete this product?",
        copy_confirm:       "Are you sure you want to copy this product?",

        stat_total:    "Total Products",
        stat_active:   "Active",
        stat_inactive: "Inactive",
        stat_sales:    "Total Sales",
    },

    // Column headers
    fields: {
        op:          "Actions",
        id:          "Product ID",
        type:        "Type",
        name:        "Name",
        price:       "Price",
        status:      "Status",
        create_time: "Created At",
        update_time: "Updated At",
        sale_count:  "Total Sales",
        stock:       "Stock",
    },

    // Create page
    create: {
        title:    "Create Product",
        subtitle: "Configure a new subscription plan or top-up package.",
        save_btn: "Save",

        // Sections
        section_basic:       "Basic Information",
        section_content:     "Product Content",
        section_restriction: "Purchase Restrictions",

        // Basic fields
        field_name:   "Name",
        field_price:  "Price",
        field_stock:  "Stock (-1 for unlimited)",
        field_status: "Sale Status",
        field_type:   "Type",

        // Status options
        status_active:   "Active",
        status_inactive: "Inactive",

        // Type options
        type_tabp:      "Time + Traffic",
        type_bandwidth: "Traffic Only",
        type_time:      "Time Only",

        // Content fields
        field_time:        "Duration (days)",
        field_class:       "Granted Level",
        field_class_time:  "Level Duration (days)",
        field_bandwidth:   "Bandwidth (GB)",
        field_node_group:  "Granted Node Group",

        level_any:      "Any",
        level_basic:    "Basic",
        level_standard: "Standard",
        level_premium:  "Premium",
        level_vip:      "VIP",
        field_speed_limit: "Speed Limit (Mbps)",
        field_ip_limit:    "IP Limit",

        // Restriction fields
        field_class_required:      "Minimum Level Required",
        field_node_group_required: "Required Node Group (Restriction)",
        field_new_user_required:   "New Users Only",
        new_user_required_desc:    "Only allow new users to purchase this product.",

        // Hint
        hint_stock: "Set to -1 for unlimited stock.",
    },

    // Edit page
    edit: {
        title:    "Edit Product",
        subtitle: "Modify the configuration of this product.",
        save_btn: "Save Changes",
        cancel_btn: "Cancel",
    },

    // Filter panel
    filter: {
        status_label:  "Status",
        type_label:    "Type",
        filter_btn:    "Filter",
        all:           "All",
        active:        "Active",
        inactive:      "Inactive",
        type_tabp:     "Time+Traffic",
        type_time:     "Time",
        type_bandwidth:"Bandwidth",
    },
};
