(function () {
    document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
        anchor.addEventListener('click', function (e) {
            var href = this.getAttribute('href');
            if (href === '#') return;
            e.preventDefault();
            var target = document.querySelector(href);
            if (target) {
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });

    var langNames = {
        en_US: 'English',
        vn_VN: 'Tiếng Việt',
        zh_CN: '简体中文',
        zh_TW: '正體中文',
        ja_JP: '日本語',
    };

    var langBtn = document.getElementById('lang-switcher-btn');
    var langLabel = document.getElementById('current-lang-label');
    var dropdown = document.querySelector('.lang-dropdown');
    var dropdownItems = document.querySelectorAll('.lang-dropdown-item');

    if (!dropdown || !langBtn) return;

    if (window.sspanelI18n) {
        var currentLang = window.sspanelI18n.getLocale();
        if (langLabel) {
            langLabel.textContent = langNames[currentLang] || 'VI';
        }
        dropdownItems.forEach(function (item) {
            if (item.getAttribute('data-lang') === currentLang) {
                item.classList.add('active');
            }
        });
    }

    langBtn.addEventListener('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
        dropdown.classList.toggle('active');
    });

    dropdownItems.forEach(function (item) {
        item.addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            var lang = this.getAttribute('data-lang');

            if (window.sspanelI18n) {
                window.sspanelI18n.setLocale(lang);
            }

            if (langLabel) {
                langLabel.textContent = langNames[lang] || lang;
            }

            dropdownItems.forEach(function (i) {
                i.classList.remove('active');
            });
            this.classList.add('active');
            dropdown.classList.remove('active');
        });
    });

    document.addEventListener('click', function (e) {
        if (!dropdown.contains(e.target)) {
            dropdown.classList.remove('active');
        }
    });

    dropdown.addEventListener('click', function (e) {
        e.stopPropagation();
    });
})();
