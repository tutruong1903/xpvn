<footer class="w-full border-t border-outline-variant/15 bg-background">
    <div class="flex flex-col md:flex-row justify-between items-center px-8 py-12 max-w-7xl mx-auto">
        <div class="mb-8 md:mb-0">
            <span class="text-lg font-black text-on-surface block mb-2 font-headline">{$config['appName']}</span>
            <p class="font-body text-xs text-on-surface-variant max-w-xs" data-i18n="landing.footer.desc">Giải pháp VPN tốc độ cao, riêng tư và an toàn hàng đầu thế giới dành cho mọi thiết bị.</p>
        </div>
        <div class="flex flex-wrap justify-center gap-8 md:gap-12 mb-8 md:mb-0">
            <a class="font-body text-xs text-on-surface-variant hover:text-primary underline underline-offset-4 transition-all duration-300" href="/tos" data-i18n="landing.footer.privacy">Privacy Policy</a>
            <a class="font-body text-xs text-on-surface-variant hover:text-primary underline underline-offset-4 transition-all duration-300" href="/tos" data-i18n="landing.footer.terms">Terms of Service</a>
            <a class="font-body text-xs text-on-surface-variant hover:text-primary underline underline-offset-4 transition-all duration-300" href="/staff" data-i18n="landing.footer.staff">Staff</a>
        </div>
        <div class="text-center md:text-right">
            <p class="font-body text-xs text-on-surface-variant">&copy; {$smarty.now|date_format:"%Y"} {$config['appName']}. <span data-i18n="landing.footer.rights">The Luminous Guardian.</span></p>
        </div>
    </div>
</footer>

<script src="/assets/js/landing/landing-page.js{asset_ver path="/assets/js/landing/landing-page.js"}"></script>

</body>
</html>
