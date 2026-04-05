{if $user->isLogin}
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="robots" content="noindex">
    <title>{$config['appName']}</title>
    <script>window.location.href = "/user"</script>
</head>
</html>
{else}
{include file='header.tpl'}

<main>
    <!-- Hero Section -->
    <section id="hero" class="relative pt-20 pb-32 overflow-hidden bg-surface-container-lowest">
        <div class="max-w-7xl mx-auto px-8 grid lg:grid-cols-12 gap-12 items-center">
            <div class="lg:col-span-7 z-10">
                <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-primary/10 text-primary font-bold text-xs mb-6 uppercase tracking-widest">
                    <span class="material-symbols-outlined text-base">verified_user</span>
                    <span data-i18n="landing.hero.badge">Mạng riêng ảo an toàn nhất</span>
                </div>
                <h1 class="font-headline text-6xl md:text-7xl font-extrabold tracking-tighter text-on-surface leading-[1.05] mb-8">
                    <span data-i18n="landing.hero.title_line1">Duyệt web</span> <br/>
                    <span class="text-transparent bg-clip-text hero-gradient" data-i18n="landing.hero.title_line2">không giới hạn.</span>
                </h1>
                <p class="text-xl text-on-surface-variant max-w-xl mb-12 leading-relaxed" data-i18n="landing.hero.desc">
                    {$config['appName']} cung cấp tốc độ vượt trội, mã hóa cấp quân sự và khả năng truy cập mọi nội dung bạn yêu thích từ bất kỳ đâu trên thế giới.
                </p>
                <div class="flex flex-col sm:flex-row gap-4">
                    <a href="/auth/register" class="hero-gradient text-white px-10 py-5 rounded-full font-bold text-lg shadow-2xl shadow-primary/30 flex items-center justify-center gap-3 hover:scale-[1.02] transition-transform">
                        <span data-i18n="landing.hero.cta_primary">Bắt đầu ngay</span>
                        <span class="material-symbols-outlined">arrow_forward</span>
                    </a>
                    <a href="#features" class="bg-surface-container-low text-on-surface px-10 py-5 rounded-full font-bold text-lg flex items-center justify-center gap-3 hover:bg-surface-container transition-colors">
                        <span data-i18n="landing.hero.cta_secondary">Xem tính năng</span>
                    </a>
                </div>
                <div class="mt-12 flex items-center gap-4 text-on-surface-variant text-sm font-medium">
                    <div class="flex -space-x-2">
                        <div class="w-8 h-8 rounded-full border-2 border-white bg-gradient-to-br from-purple-400 to-pink-400"></div>
                        <div class="w-8 h-8 rounded-full border-2 border-white bg-gradient-to-br from-blue-400 to-cyan-400"></div>
                        <div class="w-8 h-8 rounded-full border-2 border-white bg-gradient-to-br from-green-400 to-emerald-400"></div>
                    </div>
                    <span data-i18n="landing.hero.trust">Hơn 2M+ người dùng tin tưởng</span>
                </div>
            </div>

            <div class="lg:col-span-5 relative">
                <div class="relative z-10 glass-card p-8 rounded-[2.5rem] shadow-2xl shadow-primary/5">
                    <div class="flex items-center justify-between mb-10">
                        <span class="font-headline font-bold text-lg" data-i18n="landing.hero.status_card.title">Trạng thái</span>
                        <span class="px-3 py-1 rounded-full bg-secondary/10 text-secondary font-bold text-xs" data-i18n="landing.hero.status_card.protected">ĐÃ BẢO VỆ</span>
                    </div>
                    <div class="flex flex-col items-center gap-8 mb-12">
                        <div class="relative w-48 h-48 rounded-full bg-surface-container-low flex items-center justify-center">
                            <div class="absolute inset-0 rounded-full border-4 border-secondary opacity-20 scale-110"></div>
                            <div class="absolute inset-0 rounded-full border-2 border-secondary animate-pulse-ring"></div>
                            <div class="w-40 h-40 rounded-full hero-gradient flex flex-col items-center justify-center text-white shadow-xl">
                                <span class="material-symbols-outlined text-6xl mb-1" style="font-variation-settings: 'FILL' 1;">power_settings_new</span>
                                <span class="text-xs font-bold uppercase tracking-widest" data-i18n="landing.hero.status_card.connected">Connected</span>
                            </div>
                        </div>
                        <div class="text-center">
                            <p class="text-xs text-on-surface-variant uppercase tracking-widest font-bold mb-1" data-i18n="landing.hero.status_card.location_label">Vị trí hiện tại</p>
                            <p class="text-xl font-bold flex items-center justify-center gap-2">
                                <span class="material-symbols-outlined text-secondary">location_on</span>
                                <span data-i18n="landing.hero.status_card.location">Singapore #14</span>
                            </p>
                        </div>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="bg-surface-container-low p-4 rounded-2xl">
                            <span class="text-[10px] text-on-surface-variant uppercase font-bold block mb-1" data-i18n="landing.hero.status_card.download">Download</span>
                            <span class="text-lg font-bold text-secondary">854 Mbps</span>
                        </div>
                        <div class="bg-surface-container-low p-4 rounded-2xl">
                            <span class="text-[10px] text-on-surface-variant uppercase font-bold block mb-1" data-i18n="landing.hero.status_card.upload">Upload</span>
                            <span class="text-lg font-bold text-primary">124 Mbps</span>
                        </div>
                    </div>
                </div>
                <div class="absolute -top-12 -right-12 w-64 h-64 bg-primary/20 rounded-full blur-[100px]"></div>
                <div class="absolute -bottom-12 -left-12 w-64 h-64 bg-secondary/20 rounded-full blur-[100px]"></div>
            </div>
        </div>
    </section>

    <!-- Features Bento Grid -->
    <section id="features" class="py-24 bg-surface">
        <div class="max-w-7xl mx-auto px-8">
            <div class="text-center mb-20">
                <h2 class="font-headline text-4xl font-bold mb-4" data-i18n="landing.features.title">Trải nghiệm tốc độ và bảo mật tuyệt đối</h2>
                <p class="text-on-surface-variant max-w-2xl mx-auto" data-i18n="landing.features.desc">Chúng tôi kết hợp các công nghệ tiên tiến nhất để mang đến trải nghiệm duyệt web mượt mà như không có rào cản.</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="md:col-span-2 bg-surface-container-lowest p-10 rounded-[2rem] flex flex-col md:flex-row gap-10 items-center overflow-hidden">
                    <div class="flex-1">
                        <div class="w-12 h-12 rounded-2xl bg-primary/10 flex items-center justify-center text-primary mb-6">
                            <span class="material-symbols-outlined text-3xl">bolt</span>
                        </div>
                        <h3 class="font-headline text-2xl font-bold mb-4" data-i18n="landing.features.speed.title">Tốc độ cao, ổn định</h3>
                        <p class="text-on-surface-variant leading-relaxed mb-6" data-i18n="landing.features.speed.desc">Hệ thống máy chủ 10Gbps tại hơn 60 quốc gia giúp bạn xem video 4K mà không lo giật lag hay mất kết nối đột ngột.</p>
                        <a class="text-primary font-bold flex items-center gap-2 group" href="/auth/register">
                            <span data-i18n="landing.features.learn_more">Tìm hiểu thêm</span>
                            <span class="material-symbols-outlined group-hover:translate-x-1 transition-transform">chevron_right</span>
                        </a>
                    </div>
                    <div class="flex-1 relative">
                        <div class="w-full h-64 bg-gradient-to-br from-primary/20 to-secondary/20 rounded-xl flex items-center justify-center">
                            <span class="material-symbols-outlined text-[8rem] text-primary opacity-30">speed</span>
                        </div>
                    </div>
                </div>

                <div class="bg-primary p-10 rounded-[2rem] text-white flex flex-col justify-between">
                    <div>
                        <div class="w-12 h-12 rounded-2xl bg-white/20 flex items-center justify-center text-white mb-6">
                            <span class="material-symbols-outlined text-3xl">devices</span>
                        </div>
                        <h3 class="font-headline text-2xl font-bold mb-4" data-i18n="landing.features.multi_platform.title">Đa nền tảng</h3>
                        <p class="text-white/80 leading-relaxed" data-i18n="landing.features.multi_platform.desc">Một tài khoản sử dụng cùng lúc cho 10 thiết bị. Hỗ trợ iOS, Android, Windows, Mac và TV.</p>
                    </div>
                    <div class="mt-8">
                        <div class="flex gap-4 opacity-50">
                            <span class="material-symbols-outlined">laptop_mac</span>
                            <span class="material-symbols-outlined">smartphone</span>
                            <span class="material-symbols-outlined">tablet_mac</span>
                            <span class="material-symbols-outlined">tv</span>
                        </div>
                    </div>
                </div>

                <div class="bg-surface-container-lowest p-10 rounded-[2rem]">
                    <div class="w-12 h-12 rounded-2xl bg-secondary/10 flex items-center justify-center text-secondary mb-6">
                        <span class="material-symbols-outlined text-3xl">public</span>
                    </div>
                    <h3 class="font-headline text-2xl font-bold mb-4" data-i18n="landing.features.global.title">Mạng lưới toàn cầu</h3>
                    <p class="text-on-surface-variant leading-relaxed" data-i18n="landing.features.global.desc">Hơn 5000+ máy chủ được tối ưu hóa cho từng khu vực, đảm bảo độ trễ thấp nhất có thể.</p>
                </div>

                <div class="md:col-span-2 bg-surface-container-low p-10 rounded-[2rem] relative overflow-hidden flex items-center">
                    <div class="z-10 max-w-md">
                        <h3 class="font-headline text-2xl font-bold mb-4" data-i18n="landing.features.security.title">Bảo mật tuyệt đối 100%</h3>
                        <p class="text-on-surface-variant leading-relaxed" data-i18n="landing.features.security.desc">Chúng tôi áp dụng chính sách không lưu nhật ký (No-Log policy) đã được kiểm chứng bởi các bên độc lập.</p>
                    </div>
                    <div class="absolute right-0 bottom-0 top-0 w-1/2 opacity-20">
                        <span class="material-symbols-outlined text-[20rem] absolute -bottom-20 -right-20 text-primary">verified_user</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Device Compatibility -->
    <section class="py-20 bg-surface-container-lowest border-y border-outline-variant/10">
        <div class="max-w-7xl mx-auto px-8 text-center">
            <p class="text-xs font-bold uppercase tracking-[0.2em] text-on-surface-variant mb-12" data-i18n="landing.devices.title">Tương thích với mọi thiết bị</p>
            <div class="flex flex-wrap justify-center items-center gap-12 md:gap-24 opacity-60 grayscale hover:grayscale-0 transition-all">
                <span class="font-headline text-2xl font-extrabold flex items-center gap-2"><span class="material-symbols-outlined text-3xl">desktop_windows</span> Windows</span>
                <span class="font-headline text-2xl font-extrabold flex items-center gap-2"><span class="material-symbols-outlined text-3xl">laptop_mac</span> macOS</span>
                <span class="font-headline text-2xl font-extrabold flex items-center gap-2"><span class="material-symbols-outlined text-3xl">smartphone</span> Android</span>
                <span class="font-headline text-2xl font-extrabold flex items-center gap-2"><span class="material-symbols-outlined text-3xl">phone_iphone</span> iOS</span>
                <span class="font-headline text-2xl font-extrabold flex items-center gap-2"><span class="material-symbols-outlined text-3xl">router</span> Router</span>
            </div>
        </div>
    </section>

    <!-- Streaming Unlocking -->
    <section id="streaming" class="py-32 bg-surface-container-lowest relative overflow-hidden">
        <div class="max-w-7xl mx-auto px-8 grid md:grid-cols-2 gap-20 items-center">
            <div>
                <h2 class="font-headline text-4xl font-bold mb-8 leading-tight" data-i18n="landing.streaming.title">Mở khóa nội dung giải trí không giới hạn</h2>
                <p class="text-lg text-on-surface-variant leading-relaxed mb-10" data-i18n="landing.streaming.desc">
                    Đừng để giới hạn địa lý ngăn cản bạn xem các bộ phim bom tấn hay các giải đấu thể thao yêu thích. {$config['appName']} vượt qua mọi rào cản từ Netflix, Disney+, Hulu và nhiều dịch vụ khác.
                </p>
                <ul class="space-y-4 mb-10">
                    <li class="flex items-center gap-3 font-medium">
                        <span class="material-symbols-outlined text-secondary" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                        <span data-i18n="landing.streaming.feature1">Xem 4K UHD mượt mà</span>
                    </li>
                    <li class="flex items-center gap-3 font-medium">
                        <span class="material-symbols-outlined text-secondary" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                        <span data-i18n="landing.streaming.feature2">Không giới hạn băng thông</span>
                    </li>
                    <li class="flex items-center gap-3 font-medium">
                        <span class="material-symbols-outlined text-secondary" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                        <span data-i18n="landing.streaming.feature3">Máy chủ tối ưu cho Streaming</span>
                    </li>
                </ul>
                <a href="/user/node" class="text-primary font-bold text-lg flex items-center gap-2 underline underline-offset-8">
                    <span data-i18n="landing.streaming.cta">Khám phá các máy chủ giải trí</span>
                </a>
            </div>
            <div class="relative">
                <div class="grid grid-cols-2 gap-4">
                    <div class="space-y-4 pt-12">
                        <div class="bg-surface p-6 rounded-3xl shadow-sm border border-outline-variant/10 flex items-center justify-center h-24">
                            <span class="font-black text-2xl text-red-600">NETFLIX</span>
                        </div>
                        <div class="bg-surface p-6 rounded-3xl shadow-sm border border-outline-variant/10 flex items-center justify-center h-24">
                            <span class="font-black text-2xl text-blue-800">Disney+</span>
                        </div>
                    </div>
                    <div class="space-y-4">
                        <div class="bg-surface p-6 rounded-3xl shadow-sm border border-outline-variant/10 flex items-center justify-center h-24">
                            <span class="font-black text-2xl text-green-500">hulu</span>
                        </div>
                        <div class="bg-surface p-6 rounded-3xl shadow-sm border border-outline-variant/10 flex items-center justify-center h-24">
                            <span class="font-black text-2xl text-sky-400">Prime Video</span>
                        </div>
                        <div class="bg-surface p-6 rounded-3xl shadow-sm border border-outline-variant/10 flex items-center justify-center h-24">
                            <span class="font-black text-2xl text-red-500">YouTube</span>
                        </div>
                    </div>
                </div>
                <div class="absolute -z-10 top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[120%] h-[120%] bg-secondary/5 rounded-full blur-[80px]"></div>
            </div>
        </div>
    </section>

    <!-- Pricing Section -->
    <section id="pricing" class="py-32 bg-surface">
        <div class="max-w-7xl mx-auto px-8">
            <div class="text-center mb-16">
                <h2 class="font-headline text-4xl font-bold mb-4" data-i18n="landing.pricing.title">Lựa chọn gói của bạn</h2>
                <p class="text-on-surface-variant" data-i18n="landing.pricing.subtitle">Tất cả các gói đều bao gồm bảo hành hoàn tiền trong 30 ngày.</p>
            </div>
            <div class="grid md:grid-cols-3 gap-8">
                <div class="bg-surface-container-lowest p-10 rounded-[2.5rem] border border-outline-variant/5 shadow-sm flex flex-col h-full">
                    <div class="mb-8">
                        <p class="text-on-surface-variant font-bold text-xs uppercase tracking-widest mb-2" data-i18n="landing.pricing.basic.period">Gói 1 tháng</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-4xl font-black">$12.99</span>
                            <span class="text-on-surface-variant" data-i18n="landing.pricing.per_month">/tháng</span>
                        </div>
                    </div>
                    <ul class="space-y-4 mb-12 flex-grow">
                        <li class="flex items-center gap-3 text-sm"><span class="material-symbols-outlined text-green-500 text-lg">check</span> <span data-i18n="landing.pricing.basic.feature1">Bảo mật mọi thiết bị</span></li>
                        <li class="flex items-center gap-3 text-sm"><span class="material-symbols-outlined text-green-500 text-lg">check</span> <span data-i18n="landing.pricing.basic.feature2">Băng thông không giới hạn</span></li>
                        <li class="flex items-center gap-3 text-sm"><span class="material-symbols-outlined text-green-500 text-lg">check</span> <span data-i18n="landing.pricing.basic.feature3">Hỗ trợ 24/7</span></li>
                    </ul>
                    <a href="/user/shop" class="w-full py-4 rounded-full border-2 border-outline-variant font-bold hover:bg-surface-container transition-colors text-center block" data-i18n="landing.pricing.cta">Chọn gói này</a>
                </div>

                <div class="bg-surface-container-lowest p-10 rounded-[2.5rem] border-2 border-primary shadow-2xl shadow-primary/10 flex flex-col h-full relative overflow-hidden transform md:-translate-y-4">
                    <div class="absolute top-0 right-0 bg-primary text-white text-[10px] font-black px-6 py-2 rounded-bl-2xl uppercase tracking-tighter" data-i18n="landing.pricing.popular.badge">Phổ biến nhất</div>
                    <div class="mb-8">
                        <p class="text-primary font-bold text-xs uppercase tracking-widest mb-2" data-i18n="landing.pricing.popular.period">Gói 2 năm</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-5xl font-black text-on-surface">$3.29</span>
                            <span class="text-on-surface-variant font-medium" data-i18n="landing.pricing.per_month">/tháng</span>
                        </div>
                        <p class="text-secondary font-bold text-sm mt-2" data-i18n="landing.pricing.popular.save">Tiết kiệm 82%</p>
                    </div>
                    <ul class="space-y-4 mb-12 flex-grow">
                        <li class="flex items-center gap-3 text-sm font-bold"><span class="material-symbols-outlined text-green-500 text-lg">check</span> <span data-i18n="landing.pricing.popular.feature1">+3 tháng miễn phí</span></li>
                        <li class="flex items-center gap-3 text-sm"><span class="material-symbols-outlined text-green-500 text-lg">check</span> <span data-i18n="landing.pricing.popular.feature2">Tốc độ siêu việt 10Gbps</span></li>
                        <li class="flex items-center gap-3 text-sm"><span class="material-symbols-outlined text-green-500 text-lg">check</span> <span data-i18n="landing.pricing.popular.feature3">IP tĩnh miễn phí</span></li>
                        <li class="flex items-center gap-3 text-sm"><span class="material-symbols-outlined text-green-500 text-lg">check</span> <span data-i18n="landing.pricing.popular.feature4">Tối đa 10 kết nối</span></li>
                    </ul>
                    <a href="/user/shop" class="w-full py-4 rounded-full hero-gradient text-white font-bold shadow-xl shadow-primary/20 hover:scale-[1.02] transition-transform text-center block" data-i18n="landing.pricing.cta_primary">Bắt đầu ngay</a>
                </div>

                <div class="bg-surface-container-lowest p-10 rounded-[2.5rem] border border-outline-variant/5 shadow-sm flex flex-col h-full">
                    <div class="mb-8">
                        <p class="text-on-surface-variant font-bold text-xs uppercase tracking-widest mb-2" data-i18n="landing.pricing.advanced.period">Gói 1 năm</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-4xl font-black">$4.99</span>
                            <span class="text-on-surface-variant" data-i18n="landing.pricing.per_month">/tháng</span>
                        </div>
                        <p class="text-on-surface-variant text-sm mt-2" data-i18n="landing.pricing.advanced.save">Tiết kiệm 45%</p>
                    </div>
                    <ul class="space-y-4 mb-12 flex-grow">
                        <li class="flex items-center gap-3 text-sm"><span class="material-symbols-outlined text-green-500 text-lg">check</span> <span data-i18n="landing.pricing.advanced.feature1">Mọi tính năng cao cấp</span></li>
                        <li class="flex items-center gap-3 text-sm"><span class="material-symbols-outlined text-green-500 text-lg">check</span> <span data-i18n="landing.pricing.advanced.feature2">Chặn quảng cáo &amp; mã độc</span></li>
                        <li class="flex items-center gap-3 text-sm"><span class="material-symbols-outlined text-green-500 text-lg">check</span> <span data-i18n="landing.pricing.advanced.feature3">Trình quản lý mật khẩu</span></li>
                    </ul>
                    <a href="/user/shop" class="w-full py-4 rounded-full border-2 border-outline-variant font-bold hover:bg-surface-container transition-colors text-center block" data-i18n="landing.pricing.cta">Chọn gói này</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Support Section -->
    <section class="py-24 bg-surface-container-lowest">
        <div class="max-w-5xl mx-auto px-8 bg-surface-container-low rounded-[3rem] p-12 md:p-20 flex flex-col md:flex-row items-center gap-12">
            <div class="flex-1 text-center md:text-left">
                <h2 class="font-headline text-3xl font-bold mb-4" data-i18n="landing.support.title">Hỗ trợ khách hàng 24/7</h2>
                <p class="text-on-surface-variant mb-8 leading-relaxed" data-i18n="landing.support.desc">Đội ngũ chuyên gia của chúng tôi luôn sẵn sàng giải đáp mọi thắc mắc của bạn qua Live Chat hoặc Email bất kể ngày đêm.</p>
                <div class="flex flex-col sm:flex-row gap-4 justify-center md:justify-start">
                    <a href="/user/ticket" class="bg-on-surface text-surface px-8 py-4 rounded-full font-bold flex items-center justify-center gap-3">
                        <span class="material-symbols-outlined">chat</span>
                        <span data-i18n="landing.support.cta_chat">Chat ngay bây giờ</span>
                    </a>
                    <a href="/user/ticket" class="bg-white text-on-surface px-8 py-4 rounded-full font-bold border border-outline-variant/30 flex items-center justify-center gap-3">
                        <span class="material-symbols-outlined">mail</span>
                        <span data-i18n="landing.support.cta_email">Gửi Email hỗ trợ</span>
                    </a>
                </div>
            </div>
            <div class="w-48 h-48 relative">
                <div class="w-full h-full rounded-full bg-gradient-to-br from-primary/20 to-secondary/20 flex items-center justify-center shadow-2xl border-4 border-white">
                    <span class="material-symbols-outlined text-[6rem] text-primary">support_agent</span>
                </div>
                <div class="absolute -bottom-2 -right-2 w-10 h-10 bg-green-500 border-4 border-white rounded-full"></div>
            </div>
        </div>
    </section>
</main>

{include file='footer.tpl'}
{/if}
