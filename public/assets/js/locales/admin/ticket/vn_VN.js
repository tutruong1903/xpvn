window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.ticket = window.i18nLocales.admin.ticket || {};

window.i18nLocales.admin.ticket.vn_VN = {
    // Trang danh sách ticket
    index: {
        title:               "Danh sách ticket",
        subtitle:            "Xem và phản hồi ticket hỗ trợ của người dùng",
        search_placeholder:  "Tìm kiếm nhanh ID, chủ đề hoặc người dùng...",
        filter_btn:          "Bộ lọc",
        delete_confirm:      "Bạn có chắc muốn xóa ticket này?",
        close_confirm:       "Bạn có chắc muốn đóng ticket này?",

        stat_total:          "Tổng số ticket",
        stat_open:           "Đang mở",
        stat_closed:         "Đã đóng",
        stat_wait_admin:     "Chờ quản trị viên"
    },

    // Nhãn cột
    fields: {
        op:       "Thao tác",
        id:       "ID Ticket",
        title:    "Chủ đề",
        status:   "Trạng thái",
        type:     "Loại",
        userid:   "Người dùng",
        datetime: "Ngày tạo"
    },

    // Bảng lọc
    filter: {
        status_label:      "Trạng thái",
        type_label:        "Loại",
        all:               "Tất cả",
        status_open:       "Đang mở",
        status_closed:     "Đã đóng",
        status_wait_user:  "Chờ người dùng",
        status_wait_admin: "Chờ quản trị viên"
    },

    // Nhãn badge
    badges: {
        status_open_wait_admin: "Đang mở",
        status_open_wait_user:  "Chờ người dùng",
        status_closed:          "Đã đóng",
        type_howto:             "Hướng dẫn",
        type_billing:           "Thanh toán",
        type_account:           "Tài khoản",
        type_other:             "Khác"
    }
};
