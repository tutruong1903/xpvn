window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.admin = window.i18nLocales.admin || {};
window.i18nLocales.admin.detect = window.i18nLocales.admin.detect || {};

window.i18nLocales.admin.detect.vn_VN = {
    rule: {
        title:            "Quy tắc kiểm duyệt",
        subtitle:         "Xem và quản lý các quy tắc kiểm duyệt của trang web.",
        add_btn:          "Thêm quy tắc",
        add_dialog_title: "Thêm quy tắc kiểm duyệt",
        cancel_btn:       "Hủy",
        submit_btn:       "Gửi",
        delete_confirm:   "Bạn có chắc chắn muốn xóa quy tắc kiểm duyệt này?"
    },
    log: {
        title:    "Nhật ký vi phạm kiểm duyệt",
        subtitle: "Xem lịch sử vi phạm quy tắc kiểm duyệt."
    },
    ban: {
        title:    "Nhật ký cấm kiểm duyệt",
        subtitle: "Xem lịch sử cấm do vi phạm kiểm duyệt."
    },

    fields: {
        op:                 "Thao tác",
        id:                 "ID quy tắc",
        name:               "Tên quy tắc",
        text:               "Mô tả",
        regex:              "Biểu thức chính quy",
        type:               "Loại quy tắc",
        user_id:            "ID người dùng",
        node_id:            "ID node",
        node_name:          "Tên node",
        list_id:            "ID quy tắc",
        rule_name:          "Tên quy tắc",
        datetime:           "Thời gian",
        detect_number:      "Số lần vi phạm",
        ban_time:           "Thời gian cấm (phút)",
        start_time:         "Thời gian bắt đầu thống kê",
        end_time:           "Thời gian kết thúc thống kê & bắt đầu cấm",
        ban_end_time:       "Thời gian kết thúc cấm",
        all_detect_number:  "Tổng số lần vi phạm"
    },

    add_dialog: {
        field_name:  "Tên quy tắc",
        ph_name:     "Tên quy tắc kiểm duyệt",
        field_text:  "Mô tả",
        ph_text:     "Mô tả ngắn gọn về quy tắc kiểm duyệt",
        field_regex: "Biểu thức chính quy",
        ph_regex:    "Biểu thức chính quy để khớp nội dung kiểm duyệt",
        field_type:  "Loại quy tắc",
        opt_1:       "Khớp văn bản gói dữ liệu",
        opt_0:       "Khớp hex gói dữ liệu"
    }
};
