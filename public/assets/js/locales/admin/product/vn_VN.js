window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.product = window.i18nLocales.admin.product || {};

window.i18nLocales.admin.product.vn_VN = {
    // Trang danh sách sản phẩm
    index: {
        title:          "Danh sách sản phẩm",
        subtitle:       "Quản lý tất cả sản phẩm và gói đăng ký.",
        create_btn:     "Tạo mới",
        search_placeholder: "Tìm theo ID hoặc tên...",
        delete_confirm: "Bạn có chắc muốn xóa sản phẩm này?",
        copy_confirm:   "Bạn có chắc muốn sao chép sản phẩm này?",

        stat_total:    "Tổng sản phẩm",
        stat_active:   "Đang bán",
        stat_inactive: "Tạm dừng",
        stat_sales:    "Tổng đã bán",
    },

    // Nhãn cột
    fields: {
        op:          "Thao tác",
        id:          "ID sản phẩm",
        type:        "Loại",
        name:        "Tên",
        price:       "Giá",
        status:      "Trạng thái",
        create_time: "Ngày tạo",
        update_time: "Ngày cập nhật",
        sale_count:  "Tổng đã bán",
        stock:       "Tồn kho",
    },

    // Trang tạo sản phẩm
    create: {
        title:    "Tạo sản phẩm",
        subtitle: "Cấu hình gói đăng ký mới hoặc gói nạp tiền.",
        save_btn: "Lưu",

        section_basic:       "Thông tin cơ bản",
        section_content:     "Nội dung sản phẩm",
        section_restriction: "Giới hạn mua",

        field_name:   "Tên",
        field_price:  "Giá",
        field_stock:  "Tồn kho (-1 là không giới hạn)",
        field_status: "Trạng thái bán",
        field_type:   "Loại",

        status_active:   "Đang bán",
        status_inactive: "Tạm dừng",

        type_tabp:      "Gói thời gian + dung lượng",
        type_bandwidth:  "Gói dung lượng",
        type_time:      "Gói thời gian",

        field_time:        "Thời hạn (ngày)",
        field_class:       "Cấp được cấp",
        field_class_time:  "Thời hạn cấp (ngày)",
        field_bandwidth:   "Dung lượng (GB)",
        field_node_group:  "Nhóm node được cấp",

        level_any:      "Bất kỳ",
        level_basic:    "Basic",
        level_standard: "Standard",
        level_premium:  "Premium",
        level_vip:      "VIP",
        field_speed_limit: "Giới hạn tốc độ (Mbps)",
        field_ip_limit:    "Giới hạn IP đồng thời",

        field_class_required:      "Cấp tối thiểu yêu cầu",
        field_node_group_required: "Nhóm node yêu cầu (điều kiện)",
        field_new_user_required:   "Chỉ người dùng mới",
        new_user_required_desc:    "Chỉ cho phép người dùng mới mua sản phẩm này.",

        hint_stock: "Đặt -1 để không giới hạn tồn kho.",
    },

    // Trang chỉnh sửa
    edit: {
        title:      "Chỉnh sửa sản phẩm",
        subtitle:   "Sửa đổi cấu hình của sản phẩm này.",
        save_btn:   "Lưu thay đổi",
        cancel_btn: "Hủy bỏ",
    },

    // Bộ lọc
    filter: {
        status_label:   "Trạng thái",
        type_label:     "Loại",
        filter_btn:     "Bộ lọc",
        all:            "Tất cả",
        active:         "Đang bán",
        inactive:       "Tạm dừng",
        type_tabp:      "Thời gian + Dung lượng",
        type_time:      "Thời gian",
        type_bandwidth: "Dung lượng",
    },
};
