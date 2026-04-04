# Hệ thống Cache Busting Tự động

## Giới thiệu

Dự án đã được nâng cấp với hệ thống **cache busting tự động** để đảm bảo người dùng luôn tải phiên bản mới nhất của CSS/JS mà không cần thủ công tăng số version.

## Cách hoạt động

### Trước đây (Thủ công)
```smarty
<link href="/assets/css/user/sidebar.css?v=9" rel="stylesheet"/>
<script src="/assets/js/i18n.js?v=5"></script>
```
❌ Phải nhớ tăng số version mỗi lần sửa file
❌ Dễ quên hoặc sửa sai số version

### Bây giờ (Tự động)
```smarty
<link href="/assets/css/user/sidebar.css{asset_ver path="/assets/css/user/sidebar.css"}" rel="stylesheet"/>
<script src="/assets/js/i18n.js{asset_ver path="/assets/js/i18n.js"}"></script>
```
✅ Version tự động dựa trên thời gian sửa file
✅ Không cần nhớ tăng số version
✅ Mỗi file có version riêng, không gây conflict

## Kết quả đầu ra

Khi render, template sẽ tự động chèn timestamp:
```html
<link href="/assets/css/user/sidebar.css?v=1712234567" rel="stylesheet"/>
<script src="/assets/js/i18n.js?v=1712234890"></script>
```

## Khi nào version thay đổi?

- ✅ Khi bạn sửa file CSS/JS, `filemtime()` thay đổi → version tự động cập nhật
- ✅ Người dùng sẽ tự động tải phiên bản mới
- ✅ Không cần hard refresh (Ctrl+F5)

## Các file đã được cấu hình

### Backend Code
- **src/Utils/Tools.php** - Chứa function `getAssetVersion()`
- **src/Services/View.php** - Register Smarty plugin `asset_ver`

### Template Files
- `resources/views/tabler/user/header.tpl`
- `resources/views/tabler/admin/header.tpl`
- `resources/views/tabler/index.tpl`
- `resources/views/tabler/header.tpl`

## Cách sử dụng trong template mới

Nếu bạn thêm CSS/JS mới, sử dụng cú pháp:

```smarty
<!-- CSS -->
<link href="/assets/css/your-file.css{asset_ver path="/assets/css/your-file.css"}" rel="stylesheet"/>

<!-- JavaScript -->
<script src="/assets/js/your-file.js{asset_ver path="/assets/js/your-file.js"}"></script>
```

**Lưu ý:** Path phải bắt đầu từ `/assets/` (tương ứng với `public/assets/` trong filesystem)

## Clear cache Smarty

Nếu không thấy thay đổi, clear cache Smarty:

```bash
./xcat Tool clearCache
```

Hoặc xóa thủ công:
```bash
rm -rf storage/framework/smarty/compile/*
rm -rf storage/framework/smarty/cache/*
```

## Technical Details

### Function: Tools::getAssetVersion()

**Location:** `src/Utils/Tools.php`

```php
public static function getAssetVersion(string $path): string
{
    $filePath = BASE_PATH . '/public' . $path;
    
    if (file_exists($filePath)) {
        return '?v=' . filemtime($filePath);
    }
    
    return '?v=' . time();
}
```

**Cách hoạt động:**
1. Nhận path tương đối từ template (vd: `/assets/css/style.css`)
2. Convert sang absolute path (`/path/to/public/assets/css/style.css`)
3. Lấy `filemtime()` (Unix timestamp của lần sửa cuối)
4. Trả về `?v=1712234567`
5. Nếu file không tồn tại, dùng `time()` để tránh cache

### Smarty Plugin Registration

**Location:** `src/Services/View.php`

```php
$smarty->registerPlugin('function', 'asset_ver', function ($params) {
    return Tools::getAssetVersion($params['path'] ?? '');
});
```

## Performance

- ✅ **Minimal overhead:** Chỉ gọi `filemtime()` khi render template
- ✅ **Smarty cache:** Kết quả được cache bởi Smarty
- ✅ **Production ready:** An toàn cho môi trường production

## Troubleshooting

### Template không thấy thay đổi?
```bash
./xcat Tool clearCache
```

### File CSS/JS không load?
Kiểm tra path có đúng không. Path phải:
- Bắt đầu bằng `/assets/`
- Tương ứng với file trong `public/assets/`
- Không có typo

### Version không đổi khi sửa file?
- Check file permission (đảm bảo PHP có quyền đọc)
- Clear Smarty cache
- Check file có thực sự được sửa không (kiểm tra timestamp)

## Migration Notes

✅ **Hoàn tất:** Tất cả file template chính đã được migrate
✅ **Backward compatible:** Không ảnh hưởng code cũ
✅ **Zero configuration:** Không cần config thêm gì

---

**Tác giả:** GitHub Copilot  
**Ngày tạo:** 4 tháng 4, 2026  
**Version:** 1.0
