window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.node = window.i18nLocales.admin.node || {};

window.i18nLocales.admin.node.vn_VN = {
    // Trang danh sách node
    index: {
        title:               "Danh sách node",
        subtitle:            "Quản lý tất cả các node proxy trong hệ thống.",
        create_btn:          "Tạo mới",
        filter_btn:          "Bộ lọc",
        search_placeholder:  "Tìm kiếm nhanh ID, tên hoặc địa chỉ...",
        delete_confirm:      "Bạn có chắc muốn xóa node này?",
        copy_confirm:        "Bạn có chắc muốn sao chép node này?",

        stat_total:     "Tổng số node",
        stat_online:    "Đang online",
        stat_hidden:    "Đã ẩn",
        stat_bandwidth: "Tổng băng thông đã dùng (GB)"
    },

    // Nhãn cột
    fields: {
        op:                      "Thao tác",
        id:                      "ID Node",
        name:                    "Tên",
        server:                  "Địa chỉ",
        type:                    "Hiển thị",
        sort:                    "Giao thức",
        traffic_rate:            "Hệ số",
        is_dynamic_rate:         "Hệ số động",
        dynamic_rate_type:       "Kiểu tính hệ số động",
        node_class:              "Cấp bậc",
        node_group:              "Nhóm",
        node_bandwidth_limit:    "Giới hạn lưu lượng/GB",
        node_bandwidth:          "Lưu lượng đã dùng/GB",
        bandwidthlimit_resetday: "Ngày reset"
    },

    // Trang tạo / chỉnh sửa node
    create: {
        title:              "Thêm mới máy chủ",
        subtitle:           "Khởi tạo một node mạng mới trong hạ tầng của bạn. Cấu hình các thông số kết nối và giới hạn lưu lượng để tối ưu hiệu suất người dùng.",
        save_btn:           "Lưu cấu hình",
        cancel_btn:         "Hủy bỏ",

        // Tiêu đề các nhóm
        section_basic:      "Thông tin cơ bản",
        section_config:     "Cấu hình tùy chọn",
        section_dynamic:    "Cấu hình tỷ lệ động",
        section_other:      "Thông tin khác",
        section_traffic:    "Thiết lập lưu lượng",

        // Trường cơ bản
        field_name:         "Tên máy chủ",
        field_server:       "Địa chỉ kết nối",
        field_traffic_rate: "Tỷ lệ lưu lượng",
        field_sort:         "Loại kết nối",

        // Cấu hình tùy chỉnh
        config_badge:       "JSON Editor",
        config_docs_link:   "tài liệu cấu hình tùy chỉnh",
        config_docs_text:   "Vui lòng tham khảo",
        config_docs_suffix: "để sửa đổi cấu hình tùy chỉnh của node.",
        field_show_node:    "Hiển thị máy chủ",
        show_node_desc:     "Cho phép máy chủ xuất hiện trong danh sách.",

        // Tỷ lệ động
        field_enable_dynamic: "Bật tỷ lệ lưu lượng động",
        field_dynamic_type:   "Cách tính tỷ lệ lưu lượng động",
        field_max_rate:       "Tỷ lệ tối đa",
        field_max_rate_time:  "Thời gian tỷ lệ tối đa (giờ)",
        field_min_rate:       "Tỷ lệ tối thiểu",
        field_min_rate_time:  "Thời gian tỷ lệ tối thiểu (giờ)",
        dynamic_hint:         "Tỷ lệ tối đa phải lớn hơn tỷ lệ tối thiểu, nếu không sẽ không có tác dụng.",
        dynamic_type_linear:  "Tuyến tính (Linear)",
        dynamic_type_logistic: "Logistic",

        // Thông tin khác
        field_node_class:   "Cấp độ (Level)",
        field_node_group:   "Nhóm (Group)",

        // Tên cấp độ
        level_basic:    "Basic",
        level_standard: "Standard",
        level_premium:  "Premium",
        level_vip:      "VIP",

        // Tên nhóm
        group_default:  "Mặc định (Default)",
        group_premium:  "Premium VIP",

        // Lưu lượng
        field_bandwidth_limit:    "Lưu lượng khả dụng (GB)",
        field_bandwidth_resetday: "Ngày reset lưu lượng",
        field_speedlimit:         "Tốc độ tối đa (Mbps)",

        // Tùy chọn giao thức
        protocol_trojan:         "Trojan",
        protocol_vmess:          "Vmess",
        protocol_tuic:           "TUIC",
        protocol_ss2022:         "Shadowsocks2022",
        protocol_ss:             "Shadowsocks"
    },

    // Trang chỉnh sửa node
    edit: {
        title:               "Chỉnh sửa node",
        subtitle:            "Cập nhật các thông số kết nối và cấu hình cho node proxy này.",
        section_advanced:    "Tùy chọn nâng cao",
        field_ipv4:          "Địa chỉ IPv4",
        field_ipv6:          "Địa chỉ IPv6",
        field_used_bandwidth: "Lưu lượng đã dùng",
        field_password_key:  "Khóa liên lạc",
        password_key_desc:   "Dùng để xác thực NodeAPI. Nhấn Đặt lại để tạo khóa mới.",
        reset_btn:           "Đặt lại",
        copy_btn:            "Sao chép",
        save_btn:            "Lưu thay đổi",
        cancel_btn:          "Hủy bỏ",
        clipboard_success:   "Đã sao chép vào clipboard"
    },

    // Bộ lọc
    filter: {
        type_label: "Hiển thị",
        sort_label: "Giao thức",
        all:        "Tất cả",
        visible:    "Hiển",
        hidden:     "Ẩn"
    }
};
