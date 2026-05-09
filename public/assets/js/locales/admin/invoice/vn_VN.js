window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.invoice = window.i18nLocales.admin.invoice || {};

window.i18nLocales.admin.invoice.vn_VN = {
    index: {
        title:              "Danh sách hóa đơn",
        subtitle:           "Quản lý tất cả hóa đơn của khách hàng.",
        search_placeholder: "Tìm theo ID hoặc người dùng...",
        mark_paid_confirm:  "Đánh dấu hóa đơn này là đã thanh toán (Admin)?",
        stat_total:         "Tổng hóa đơn",
        stat_paid:          "Đã thanh toán",
        stat_unpaid:        "Chưa thanh toán",
        stat_cancelled:     "Đã hủy",
    },
    fields: {
        op:          "Thao tác",
        id:          "Mã hóa đơn",
        user_id:     "Mã người dùng",
        order_id:    "Mã đơn hàng",
        price:       "Số tiền",
        status:      "Trạng thái",
        create_time: "Ngày tạo",
        update_time: "Cập nhật lúc",
        pay_time:    "Ngày thanh toán",
    },
    badges: {
        unpaid:           "Chưa thanh toán",
        paid_gateway:     "Đã thanh toán (Cổng)",
        paid_balance:     "Đã thanh toán (Số dư)",
        paid_admin:       "Đã thanh toán (Admin)",
        cancelled:        "Đã hủy",
        refunded_balance: "Đã hoàn tiền (Số dư)",
        partially_paid:   "Thanh toán một phần",
    },
};
