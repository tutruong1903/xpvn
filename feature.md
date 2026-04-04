Dưới đây là danh sách đầy đủ các chức năng của dự án (VPN/Proxy Panel Backend - Slim 4 + Laravel Eloquent):

1. Xác thực & Bảo mật
Đăng nhập / Đăng ký với xác minh email
CAPTCHA (tùy chỉnh theo hành động)
MFA: TOTP, WebAuthn (FIDO2)
Đặt lại mật khẩu, quản lý session
API token, chống XSS, theo dõi IP đăng nhập
2. Quản lý tài khoản người dùng
Đổi email, username, mật khẩu
Cấu hình liên lạc (IM binding)
Theme sáng/tối, xóa tài khoản
Quản lý thiết bị MFA
3. Dashboard & Phân tích
Tổng quan lưu lượng, biểu đồ theo giờ
Hạn sử dụng class, check-in hàng ngày
Thông báo, theo dõi thiết bị online, lịch sử đăng nhập
Quản lý tải client VPN
4. Subscription (Đăng ký dịch vụ)
Hỗ trợ nhiều protocol: ShadowSocks, V2Ray, Trojan, Clash, SingBox, SIP008
Link subscription theo token, lọc node theo class/group, kiểm tra bandwidth
5. Quản lý Node/Server
CRUD đầy đủ cho VPN server
Tỷ lệ lưu lượng động (dynamic rate), phân nhóm, giới hạn tốc độ
Theo dõi trạng thái, clone cấu hình node
6. Sản phẩm & Định giá
Tạo nhiều loại sản phẩm (subscription, traffic pack, gift card)
Quản lý kho, template, trạng thái sản phẩm
7. Đơn hàng & Hóa đơn
Tạo đơn, xem lịch sử, thanh toán nhiều phương thức
Admin: tìm kiếm, hủy, xóa đơn
Hóa đơn tự động, thanh toán từ số dư tài khoản
8. Cổng thanh toán
Stripe, PayPal, Alipay F2F, Cryptomus (crypto), Epay, Smogate
Webhook tự động cập nhật trạng thái
9. Mã giảm giá (Coupon)
Tạo coupon với quy tắc tùy chỉnh, theo dõi sử dụng, bật/tắt
10. Gift Card & Số dư
Tạo gift card, theo dõi quy đổi
Nạp tiền vào tài khoản, log mọi thay đổi số dư
11. Hệ thống giới thiệu (Referral)
Hoa hồng giới thiệu, tạo link mời, theo dõi người được mời
12. Hệ thống hỗ trợ (Ticket)
Tạo ticket, trả lời theo luồng
LLM AI gợi ý tự động trả lời (OpenAI, Anthropic, Google AI, AWS Bedrock, Cloudflare Workers AI, Vertex AI, HuggingFace)
Đóng/mở lại ticket
13. Thông báo (Announcement)
Tạo, sắp xếp ưu tiên, publish/unpublish thông báo
14. Tài liệu hướng dẫn (Docs)
Tạo tài liệu, tự động tạo, sắp xếp
15. Phát hiện & Chống lạm dụng
Detection rules (regex), log vi phạm
Auto-ban sau X lần vi phạm
GFW detection (TCP ping, phát hiện node bị chặn)
16. Logging & Analytics
Log	Mô tả
Login Log	Theo dõi đăng nhập (IP, thời gian, vị trí)
Online Log	User đang hoạt động theo node
Sub Log	Theo dõi lượt pull subscription
Sys Log	Log hệ thống (error/warning/notice)
Hourly Usage	Phân tích lưu lượng theo giờ
17. Cài đặt Admin
Billing: Cấu hình cổng thanh toán
Captcha: Chọn provider, cấu hình theo hành động
Email: 9 provider (SMTP, SendGrid, Mailgun, AWS SES, Postal, Postmark, Resend, Mailchimp, AlibabaCloud)
Cron: Lên lịch task nền
IM/Notifications: Telegram, Discord, Slack bot
LLM/AI: 7 provider AI cho ticket auto-reply
Features: Bật/tắt các tính năng hệ thống
Registration: Quy tắc đăng ký
Subscriptions: Cấu hình node mặc định
18. Dynamic Rate (Tỷ lệ lưu lượng động)
Tỷ lệ traffic multiplier theo node, giới hạn min/max, cửa sổ thời gian
19. OAuth & Social Login
Hỗ trợ nhiều OAuth provider
20. REST API (Giao tiếp Node)
Endpoint	Chức năng
GET /mod_mu/nodes/{id}/info	Thông tin cấu hình node
GET /mod_mu/users	Danh sách user cho backend
POST /mod_mu/users/traffic	Báo cáo lưu lượng
POST /mod_mu/users/aliveip	Báo cáo IP hoạt động
POST /mod_mu/users/detectlog	Gửi log phát hiện
GET /mod_mu/func/detect_rules	Lấy tất cả detection rules
GET /mod_mu/func/ping	Health check
21. CLI Commands
Cron - Job scheduling
Migration - Database migration
Update - Cập nhật hệ thống
Tool - Admin utilities
ClientDownload - Quản lý VPN client
22. Middleware
Guest, User, Admin, NodeToken, ErrorHandler
