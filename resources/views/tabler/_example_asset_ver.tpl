{* 
  Example Template: Cách sử dụng asset_ver() function
  File này demo cách sử dụng hệ thống cache busting tự động
*}

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Example - Auto Cache Busting</title>
    
    {* ===================================== *}
    {* CSS Files - Sử dụng asset_ver        *}
    {* ===================================== *}
    
    {* ✅ ĐÚNG: Sử dụng asset_ver để tự động version *}
    <link href="/assets/css/user/sidebar.css{asset_ver path="/assets/css/user/sidebar.css"}" rel="stylesheet"/>
    <link href="/assets/css/user/header.css{asset_ver path="/assets/css/user/header.css"}" rel="stylesheet"/>
    
    {* ❌ SAI: Không nên hardcode version nữa *}
    {* <link href="/assets/css/user/sidebar.css?v=9" rel="stylesheet"/> *}
    
    
    {* ===================================== *}
    {* JavaScript Files - Sử dụng asset_ver *}
    {* ===================================== *}
    
    {* ✅ ĐÚNG: Tự động version cho JS files *}
    <script src="/assets/js/i18n.js{asset_ver path="/assets/js/i18n.js"}"></script>
    <script src="/assets/js/locales/en_US.js{asset_ver path="/assets/js/locales/en_US.js"}"></script>
    <script src="/assets/js/locales/vn_VN.js{asset_ver path="/assets/js/locales/vn_VN.js"}"></script>
    
    {* ❌ SAI: Không nên hardcode version *}
    {* <script src="/assets/js/i18n.js?v=5"></script> *}


    {* ===================================== *}
    {* External CDN - KHÔNG cần asset_ver   *}
    {* ===================================== *}
    
    {* ✅ ĐÚNG: CDN/External không cần asset_ver *}
    <link href="//{$config['jsdelivr_url']}/npm/@tabler/core@latest/dist/css/tabler.min.css" rel="stylesheet"/>
    <script src="//{$config['jsdelivr_url']}/npm/htmx.org@latest/dist/htmx.min.js"></script>


    {* ===================================== *}
    {* Image Files - Cũng có thể dùng       *}
    {* ===================================== *}
    
    {* ✅ Ngay cả images cũng có thể dùng asset_ver nếu muốn *}
    <link rel="icon" href="/assets/images/favicon.ico{asset_ver path="/assets/images/favicon.ico"}"/>
</head>
<body>
    <h1>Auto Cache Busting Example</h1>
    <p>Mở View Source để xem version numbers được tự động generate!</p>
    
    <div class="explanation">
        <h2>Cách hoạt động:</h2>
        <ul>
            <li>Khi bạn sửa file CSS/JS, timestamp của file thay đổi</li>
            <li>asset_ver() tự động tạo ?v=TIMESTAMP mới</li>
            <li>Trình duyệt thấy URL mới → Tải lại file</li>
            <li>Không cần hard refresh (Ctrl+F5)</li>
        </ul>
        
        <h2>Output ví dụ:</h2>
        <code>
            /assets/css/user/sidebar.css?v=1712234567<br>
            /assets/js/i18n.js?v=1712234890
        </code>
        
        <h2>Lợi ích:</h2>
        <ul>
            <li>✅ Không cần nhớ tăng version thủ công</li>
            <li>✅ Mỗi file có version riêng</li>
            <li>✅ Tự động update khi file thay đổi</li>
            <li>✅ Người dùng luôn thấy bản mới nhất</li>
        </ul>
    </div>
</body>
</html>
