# Landing Page i18n Structure

## 📁 Cấu trúc mới

```
public/assets/js/locales/
├── landing/                 # Landing page translations  
│   ├── en_US.js            # English
│   ├── vn_VN.js            # Tiếng Việt
│   ├── zh_CN.js            # 简体中文
│   ├── zh_TW.js            # 正體中文
│   └── ja_JP.js            # 日本語
├── auth/                    # Auth pages (future)
│   ├── en_US.js
│   ├── vn_VN.js
│   └── ...
└── [Legacy files - deprecated for landing]
    ├── en_US.js            # Contains user/admin sections only
    ├── vn_VN.js
    └── ...
```

## 🔧 Cách sử dụng

### Landing Page
Các file `locales/landing/*.js` chứa tất cả translation cho landing page:
- Navigation menu
- Hero section
- Features
- Streaming
- Pricing
- Support
- Footer

Keys được tổ chức theo: `landing.section.key`

Ví dụ:
```javascript
data-i18n="landing.nav.speed"
data-i18n="landing.hero.title_line1"
data-i18n="landing.pricing.basic.feature1"
```

### Load order trong HTML
```html
<!-- i18n - Landing Page -->
<script src="/assets/js/i18n.js"></script>
<script src="/assets/js/locales/landing/en_US.js"></script>
<script src="/assets/js/locales/landing/vn_VN.js"></script>
<script src="/assets/js/locales/landing/zh_CN.js"></script>
<script src="/assets/js/locales/landing/zh_TW.js"></script>
<script src="/assets/js/locales/landing/ja_JP.js"></script>
<script src="/assets/js/locale-switcher.js"></script>
```

## 🎨 CSS Structure

### Tailwind Landing CSS
File: `public/assets/css/landing/tailwind-landing.css`

Chứa:
- Material Symbols configuration
- Custom utilities (glass-card, hero-gradient)
- Animations (pulse-ring)
- Language dropdown styles
- Smooth scroll

### Backup files
- `public/assets/css/landing/style_old_backup.css` - Bootstrap-based landing CSS (deprecated)

## 🌐 Language Switcher

Dropdown menu với 5 ngôn ngữ:
- 🇻🇳 Tiếng Việt (vn_VN)
- 🇺🇸 English (en_US)
- 🇨🇳 简体中文 (zh_CN)
- 🇹🇼 正體中文 (zh_TW)
- 🇯🇵 日本語 (ja_JP)

Click vào nút ngôn ngữ để mở dropdown, chọn ngôn ngữ mong muốn.

## ⚙️ Tailwind Config

Tailwind configuration được define inline trong `index.tpl` với:
- Custom colors (The Luminous Guardian palette)
- Border radius presets
- Font families (Manrope, Inter)

## 🚀 Migration Notes

1. **Landing page** bây giờ sử dụng file i18n mới từ folder `landing/`
2. **Auth pages** (login, register) vẫn sử dụng file i18n chính (sẽ migrate sau)
3. **User/Admin panels** sử dụng file i18n chính 
4. Các file i18n cũ vẫn được giữ lại để backward compatibility với user/admin panels

## 📝 TODO

- [ ] Tạo `locales/auth/` cho login/register pages
- [ ] Cleanup các key không sử dụng trong file i18n chính
- [ ] Optimize file loading (lazy load theo page)
