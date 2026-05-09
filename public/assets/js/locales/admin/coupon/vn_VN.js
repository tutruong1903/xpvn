window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.coupon = window.i18nLocales.admin.coupon || {};

window.i18nLocales.admin.coupon.vn_VN = {
    index: {
        title:           "Danh sách mã giảm giá",
        subtitle:        "Xem và quản lý các mã giảm giá.",
        search_placeholder: "Tìm theo ID hoặc mã...",
        create_btn:      "Tạo mới",
        delete_confirm:  "Bạn có chắc muốn xóa mã giảm giá này?",
        disable_confirm: "Bạn có chắc muốn vô hiệu hóa mã giảm giá này?",
        stat_total:      "Tổng mã",
        stat_active:     "Đang hoạt động",
        stat_disabled:   "Đã vô hiệu",
    },
    fields: {
        op:             "Thao tác",
        id:             "ID",
        code:           "Mã",
        type:           "Loại",
        value:          "Giá trị",
        product_id:     "ID sản phẩm",
        use_time:       "Giới hạn/người dùng",
        total_use_time: "Giới hạn tổng",
        new_user:       "Chỉ người dùng mới",
        disabled:       "Đã vô hiệu",
        use_count:      "Số lần dùng",
        create_time:    "Ngày tạo",
        expire_time:    "Hết hạn",
    },
    create_modal: {
        title:        "Tạo mã giảm giá",
        expire_label: "Thời gian hết hạn (để trống nếu không giới hạn)",
        cancel_btn:   "Hủy",
        submit_btn:   "Tạo",
        // Field labels
        field_code:             "Mã giảm giá",
        field_type:             "Loại",
        field_value:            "Giá trị",
        field_product_id:       "ID sản phẩm áp dụng (phân cách bằng dấu phẩy)",
        field_use_time:         "Giới hạn sử dụng/người dùng (< 0 không giới hạn)",
        field_total_use_time:   "Giới hạn sử dụng tổng (< 0 không giới hạn)",
        field_new_user:         "Chỉ người dùng mới",
        field_generate_method:  "Phương thức tạo",
        // Select options
        opt_percentage:   "Phần trăm",
        opt_fixed:        "Cố định",
        opt_1:            "Có",
        opt_0:            "Không",
        opt_char:         "Ký tự chỉ định",
        opt_random:       "Ký tự ngẫu nhiên (bỏ qua trường mã)",
        opt_char_random:  "Ký tự chỉ định + ngẫu nhiên",
    },
    badges: {
        percentage: "Phần trăm",
        fixed:      "Cố định",
        unlimited:  "Không giới hạn",
        never:      "Vĩnh viễn",
        yes:        "Có",
        no:         "Không",
    },
};
