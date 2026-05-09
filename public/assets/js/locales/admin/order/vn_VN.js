window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.order = window.i18nLocales.admin.order || {};

window.i18nLocales.admin.order.vn_VN = {
    // Trang danh sách đơn hàng
    index: {
        title:              "Danh sách đơn hàng",
        subtitle:           "Quản lý tất cả đơn hàng của khách hàng.",
        search_btn:         "Tìm theo mã cổng",
        search_placeholder: "Tìm theo ID hoặc người dùng...",
        delete_confirm:     "Bạn có chắc muốn xóa đơn hàng này?",
        cancel_confirm:     "Bạn có chắc muốn hủy đơn hàng này? Nếu hóa đơn liên quan đã thanh toán, tiền sẽ được hoàn về số dư người dùng.",

        stat_total:    "Tổng đơn hàng",
        stat_pending:  "Chờ xử lý",
        stat_active:   "Đã kích hoạt",
        stat_cancelled:"Đã hủy",
    },

    // Nhãn cột
    fields: {
        op:           "Thao tác",
        id:           "ID đơn hàng",
        user_id:      "ID người dùng",
        product_id:   "ID sản phẩm",
        product_type: "Loại",
        product_name: "Tên sản phẩm",
        coupon:       "Mã giảm giá",
        price:        "Số tiền",
        status:       "Trạng thái",
        create_time:  "Ngày tạo",
        update_time:  "Ngày cập nhật",
    },

    // Modal tìm kiếm
    search_modal: {
        title:      "Tìm đơn hàng",
        label:      "Mã đơn hàng cổng thanh toán",
        cancel_btn: "Hủy",
        submit_btn: "Tìm",
    },

    // Badges
    badges: {
        pending_payment:    "Chờ thanh toán",
        pending_activation: "Chờ kích hoạt",
        activated:          "Đã kích hoạt",
        expired:            "Đã hết hạn",
        cancelled:          "Đã hủy",
        type_tabp:          "Thời gian + Dung lượng",
        type_time:          "Thời gian",
        type_bandwidth:     "Dung lượng",
        type_topup:         "Nạp tiền",
    },
};
