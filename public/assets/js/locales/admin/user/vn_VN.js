window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.user = window.i18nLocales.admin.user || {};

window.i18nLocales.admin.user.vn_VN = {
    // Trang danh sách người dùng
    index: {
        title: "Danh sách người dùng",
        subtitle: "Quản lý và giám sát tất cả tài khoản trong hệ thống.",
        create_btn: "Tạo mới",
        create_dialog_title: "Thêm người dùng",
        create_dialog_submit: "Thêm",
        filter_btn: "Bộ lọc",
        delete_confirm: "Bạn có chắc muốn xóa người dùng này?",

        // Thống kê
        stat_total: "Tổng người dùng",
        stat_active: "Đang hoạt động",
        stat_banned: "Bị cấm",
        stat_admins: "Quản trị viên"
    },

    // Nhãn cột bảng
    fields: {
        op:          "Thao tác",
        id:          "ID",
        user_name:   "Biệt danh",
        email:       "Email",
        money:       "Số dư",
        ref_by:      "Người mời",
        transfer_enable: "Hạn mức lưu lượng",
        transfer_used:   "Lưu lượng đã dùng",
        class:       "Cấp bậc",
        is_admin:    "Admin?",
        is_banned:   "Trạng thái",
        is_inactive: "Không hoạt động?",
        reg_date:    "Ngày tạo",
        class_expire: "Hết hạn"
    },

    // Giá trị badge (trạng thái, cấp bậc)
    badges: {
        active:        "Hoạt động",
        banned:        "Đã bị cấm",
        inactive:      "Không hoạt động",
        class_basic:   "Cơ bản",
        class_std:     "Tiêu chuẩn",
        class_premium: "Cao cấp",
        class_vip:     "VIP"
    },

    // Trang chỉnh sửa người dùng
    edit: {
        // Header
        title: "Bảng điều khiển quản trị",
        breadcrumb_dashboard: "Bảng điều khiển",
        breadcrumb_users: "Người dùng",
        breadcrumb_edit: "Chỉnh sửa",
        save_btn: "Lưu thay đổi",
        cancel_btn: "Hủy bỏ",

        // Tiêu đề các nhóm
        section_account: "Thông tin tài khoản",
        section_usage: "Giới hạn sử dụng",
        section_other: "Cài đặt khác",
        section_history: "Lịch sử hoạt động",

        // Trường tài khoản
        field_email: "Email",
        field_username: "Tên người dùng",
        field_password: "Mật khẩu (Nhập để đặt lại)",
        field_balance: "Số dư",
        field_ref_by: "Mã được mời",
        field_port: "Cổng SS (Port)",
        field_method: "Mã hóa",

        // Lịch sử hoạt động
        history_reg_ip: "IP Đăng ký",
        history_reg_date: "Ngày đăng ký",
        history_last_use: "Hoạt động cuối",
        history_last_checkin: "Điểm danh cuối",
        history_last_login: "Thời gian đăng nhập cuối",

        // Trường giới hạn sử dụng
        field_transfer_enable: "Giới hạn lưu lượng (GB)",
        field_transfer_used: "Sử dụng tháng này",
        field_transfer_total: "Tổng tích lũy",
        field_class: "Cấp độ",
        field_node_group: "Nhóm NODE",
        field_class_expire: "Ngày hết hạn Cấp độ",
        field_auto_reset_day: "Ngày reset lưu lượng",
        field_auto_reset_bandwidth: "Số lượng Reset (GB)",
        field_speedlimit: "Giới hạn tốc độ (Mbps)",
        field_iplimit: "Kết nối tối đa",

        // Trường cài đặt khác
        field_locale: "Ngôn ngữ hiển thị",
        field_is_admin: "Quyền quản trị viên",
        field_ga_enable: "Bảo mật 2FA",
        field_is_shadow_banned: "Trạng thái Shadow Ban",
        field_is_banned: "Cấm người dùng",
        field_banned_reason: "Lý do cấm",
        field_remark: "Ghi chú quản trị",

        // Tùy chọn cấp độ
        level_basic: "Basic",
        level_standard: "Standard",
        level_premium: "Premium",
        level_vip: "VIP",

        // Badge
        badge_2fa_active: "Đã kích hoạt",

        // Placeholder
        ph_password: "Để trống nếu không đổi mật khẩu",
        ph_banned_reason: "Nhập lý do cấm người dùng...",
        ph_remark: "Chỉ quản trị viên mới thấy ghi chú này..."
    },

    // DataTable
    datatable: {
        search_placeholder: "Tìm kiếm nhanh ID, tên hoặc email...",
        processing: "Đang xử lý...",
        length_menu: "Hiển thị _MENU_ mục",
        zero_records: "Không tìm thấy kết quả phù hợp",
        info: "Hiển thị _START_ đến _END_ trong tổng số _TOTAL_ mục",
        info_empty: "Hiển thị 0 đến 0 trong tổng số 0 mục",
        info_filtered: "(lọc từ tổng số _MAX_ mục)",
        empty_table: "Bảng không có dữ liệu",
        loading: "Đang tải...",
        page_first: "Đầu",
        page_last: "Cuối",
        sort_asc: ": kích hoạt để sắp xếp tăng dần",
        sort_desc: ": kích hoạt để sắp xếp giảm dần",
        filter_all: "Tất cả"
    }
};
