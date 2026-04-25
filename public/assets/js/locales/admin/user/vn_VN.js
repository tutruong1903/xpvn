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
