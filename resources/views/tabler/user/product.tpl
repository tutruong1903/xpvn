{include file='user/header.tpl'}

<div class="product-page">
    <div class="container-xl">

        <!-- Page Header -->
        <div class="product-page-header">
            <div class="product-page-header__text">
                <div class="text-secondary text-uppercase fw-bold small mb-2" style="letter-spacing:.1em;">
                    <span data-i18n-user-product="tab_tabp">Danh mục dịch vụ</span>
                </div>
                <h2 data-i18n-user-product="page_title">Danh sách sản phẩm</h2>
                <p data-i18n-user-product="page_subtitle">Duyệt qua các gói dịch vụ bảo mật cao cấp được thiết kế riêng cho trải nghiệm kỹ thuật số không giới hạn của bạn.</p>
            </div>

            <!-- Filter tabs -->
            <div class="product-filter-tabs" role="tablist">
                <a href="#tab-tabp" class="nav-link active" data-bs-toggle="tab" data-bs-target="#tab-tabp" role="tab"
                   data-i18n-user-product="tab_tabp">Thời gian + Lưu lượng</a>
                <a href="#tab-bandwidth" class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-bandwidth" role="tab"
                   data-i18n-user-product="tab_bandwidth">Lưu lượng</a>
                <a href="#tab-time" class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-time" role="tab"
                   data-i18n-user-product="tab_time">Thời gian</a>
            </div>
        </div>

    </div>

    <div class="page-body">
        <div class="container-xl">
            <div class="tab-content">

                <!-- ─── Tab: Time + Traffic ────────────────────────── -->
                <div class="tab-pane fade show active" id="tab-tabp" role="tabpanel">
                    {if $tabps|@count > 0}
                        <div class="product-section">
                            <div class="product-scroll-wrapper">
                                {foreach $tabps as $tabp}
                                    <div class="product-card">
                                        <div class="product-card__accent"></div>
                                        <div class="product-card__body">
                                            <!-- Head -->
                                            <div class="product-card__head">
                                                <div>
                                                    <p class="product-card__name">{$tabp->name}</p>
                                                    <span class="product-card__badge" data-i18n-user-product="badge_time_traffic">Thời gian + Lưu lượng</span>
                                                </div>
                                                <div class="product-card__icon">
                                                    <span class="material-symbols-outlined">bolt</span>
                                                </div>
                                            </div>

                                            <!-- Price -->
                                            <div class="product-card__price-block">
                                                <div class="product-card__price">
                                                    <span class="product-card__price-value">{$tabp->price}</span>
                                                    <span class="product-card__price-currency">$</span>
                                                </div>
                                                <p class="product-card__price-cycle" data-i18n-user-product="price_cycle">Thanh toán theo chu kỳ hàng tháng</p>
                                            </div>

                                            <!-- Features -->
                                            <ul class="product-card__features">
                                                <li class="product-card__feature">
                                                    <div class="product-card__feature-left">
                                                        <span class="material-symbols-outlined">military_tech</span>
                                                        <span class="product-card__feature-label" data-i18n-user-product="label_service_class">Hạng dịch vụ</span>
                                                    </div>
                                                    <span class="product-card__feature-value">Lv. {$tabp->content->class}</span>
                                                </li>
                                                <li class="product-card__feature">
                                                    <div class="product-card__feature-left">
                                                        <span class="material-symbols-outlined">event</span>
                                                        <span class="product-card__feature-label" data-i18n-user-product="label_duration">Thời hạn sử dụng</span>
                                                    </div>
                                                    <span class="product-card__feature-value">
                                                        {$tabp->content->class_time}&nbsp;<span data-i18n-user-product="unit_days">ngày</span>
                                                    </span>
                                                </li>
                                                <li class="product-card__feature">
                                                    <div class="product-card__feature-left">
                                                        <span class="material-symbols-outlined">data_usage</span>
                                                        <span class="product-card__feature-label" data-i18n-user-product="label_bandwidth">Dung lượng</span>
                                                    </div>
                                                    <span class="product-card__feature-value">
                                                        {$tabp->content->bandwidth}&nbsp;<span data-i18n-user-product="unit_gb">GB</span>
                                                    </span>
                                                </li>
                                                <li class="product-card__feature">
                                                    <div class="product-card__feature-left">
                                                        <span class="material-symbols-outlined">speed</span>
                                                        <span class="product-card__feature-label" data-i18n-user-product="label_speed">Tốc độ tối đa</span>
                                                    </div>
                                                    <span class="product-card__feature-value">
                                                        {if $tabp->content->speed_limit === '0'}
                                                            <span data-i18n-user-product="label_unlimited">Không giới hạn</span>
                                                        {else}
                                                            {$tabp->content->speed_limit}&nbsp;<span data-i18n-user-product="unit_mbps">Mbps</span>
                                                        {/if}
                                                    </span>
                                                </li>
                                                <li class="product-card__feature">
                                                    <div class="product-card__feature-left">
                                                        <span class="material-symbols-outlined">devices</span>
                                                        <span class="product-card__feature-label" data-i18n-user-product="label_devices">Thiết bị tối đa</span>
                                                    </div>
                                                    <span class="product-card__feature-value">
                                                        {if $tabp->content->ip_limit === '0'}
                                                            <span data-i18n-user-product="label_unlimited">Không giới hạn</span>
                                                        {else}
                                                            {$tabp->content->ip_limit}&nbsp;<span data-i18n-user-product="unit_devices">thiết bị</span>
                                                        {/if}
                                                    </span>
                                                </li>
                                            </ul>

                                            <!-- CTA -->
                                            {if $tabp->stock === -1 || $tabp->stock > 0}
                                                <a href="/user/order/create?product_id={$tabp->id}"
                                                   class="product-card__btn"
                                                   data-i18n-user-product="btn_buy">Mua ngay</a>
                                            {else}
                                                <span class="product-card__btn product-card__btn--disabled"
                                                      data-i18n-user-product="btn_sold_out">Hết hàng</span>
                                            {/if}
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {else}
                        <div class="product-empty">
                            <span class="material-symbols-outlined">inventory_2</span>
                            <p class="product-empty__title" data-i18n-user-product="empty_title">Không có sản phẩm</p>
                            <p class="product-empty__desc" data-i18n-user-product="empty_desc">Hiện tại không có sản phẩm nào trong danh mục này.</p>
                        </div>
                    {/if}
                </div>

                <!-- ─── Tab: Traffic ───────────────────────────────── -->
                <div class="tab-pane fade" id="tab-bandwidth" role="tabpanel">
                    {if $bandwidths|@count > 0}
                        <div class="product-section">
                            <div class="product-scroll-wrapper">
                                {foreach $bandwidths as $bandwidth}
                                    <div class="product-card">
                                        <div class="product-card__accent"></div>
                                        <div class="product-card__body">
                                            <div class="product-card__head">
                                                <div>
                                                    <p class="product-card__name">{$bandwidth->name}</p>
                                                    <span class="product-card__badge" data-i18n-user-product="badge_traffic">Lưu lượng</span>
                                                </div>
                                                <div class="product-card__icon">
                                                    <span class="material-symbols-outlined">data_usage</span>
                                                </div>
                                            </div>

                                            <div class="product-card__price-block">
                                                <div class="product-card__price">
                                                    <span class="product-card__price-value">{$bandwidth->price}</span>
                                                    <span class="product-card__price-currency">$</span>
                                                </div>
                                                <p class="product-card__price-cycle" data-i18n-user-product="price_cycle">Thanh toán theo chu kỳ hàng tháng</p>
                                            </div>

                                            <ul class="product-card__features">
                                                <li class="product-card__feature">
                                                    <div class="product-card__feature-left">
                                                        <span class="material-symbols-outlined">data_usage</span>
                                                        <span class="product-card__feature-label" data-i18n-user-product="label_bandwidth">Dung lượng</span>
                                                    </div>
                                                    <span class="product-card__feature-value">
                                                        {$bandwidth->content->bandwidth}&nbsp;<span data-i18n-user-product="unit_gb">GB</span>
                                                    </span>
                                                </li>
                                            </ul>

                                            {if $bandwidth->stock === -1 || $bandwidth->stock > 0}
                                                <a href="/user/order/create?product_id={$bandwidth->id}"
                                                   class="product-card__btn"
                                                   data-i18n-user-product="btn_buy">Mua ngay</a>
                                            {else}
                                                <span class="product-card__btn product-card__btn--disabled"
                                                      data-i18n-user-product="btn_sold_out">Hết hàng</span>
                                            {/if}
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {else}
                        <div class="product-empty">
                            <span class="material-symbols-outlined">inventory_2</span>
                            <p class="product-empty__title" data-i18n-user-product="empty_title">Không có sản phẩm</p>
                            <p class="product-empty__desc" data-i18n-user-product="empty_desc">Hiện tại không có sản phẩm nào trong danh mục này.</p>
                        </div>
                    {/if}
                </div>

                <!-- ─── Tab: Time ──────────────────────────────────── -->
                <div class="tab-pane fade" id="tab-time" role="tabpanel">
                    {if $times|@count > 0}
                        <div class="product-section">
                            <div class="product-scroll-wrapper">
                                {foreach $times as $time}
                                    <div class="product-card">
                                        <div class="product-card__accent"></div>
                                        <div class="product-card__body">
                                            <div class="product-card__head">
                                                <div>
                                                    <p class="product-card__name">{$time->name}</p>
                                                    <span class="product-card__badge" data-i18n-user-product="badge_time">Thời gian</span>
                                                </div>
                                                <div class="product-card__icon">
                                                    <span class="material-symbols-outlined">schedule</span>
                                                </div>
                                            </div>

                                            <div class="product-card__price-block">
                                                <div class="product-card__price">
                                                    <span class="product-card__price-value">{$time->price}</span>
                                                    <span class="product-card__price-currency">$</span>
                                                </div>
                                                <p class="product-card__price-cycle" data-i18n-user-product="price_cycle">Thanh toán theo chu kỳ hàng tháng</p>
                                            </div>

                                            <ul class="product-card__features">
                                                <li class="product-card__feature">
                                                    <div class="product-card__feature-left">
                                                        <span class="material-symbols-outlined">military_tech</span>
                                                        <span class="product-card__feature-label" data-i18n-user-product="label_service_class">Hạng dịch vụ</span>
                                                    </div>
                                                    <span class="product-card__feature-value">Lv. {$time->content->class}</span>
                                                </li>
                                                <li class="product-card__feature">
                                                    <div class="product-card__feature-left">
                                                        <span class="material-symbols-outlined">event</span>
                                                        <span class="product-card__feature-label" data-i18n-user-product="label_duration">Thời hạn sử dụng</span>
                                                    </div>
                                                    <span class="product-card__feature-value">
                                                        {$time->content->class_time}&nbsp;<span data-i18n-user-product="unit_days">ngày</span>
                                                    </span>
                                                </li>
                                                <li class="product-card__feature">
                                                    <div class="product-card__feature-left">
                                                        <span class="material-symbols-outlined">speed</span>
                                                        <span class="product-card__feature-label" data-i18n-user-product="label_speed">Tốc độ tối đa</span>
                                                    </div>
                                                    <span class="product-card__feature-value">
                                                        {if $time->content->speed_limit === '0'}
                                                            <span data-i18n-user-product="label_unlimited">Không giới hạn</span>
                                                        {else}
                                                            {$time->content->speed_limit}&nbsp;<span data-i18n-user-product="unit_mbps">Mbps</span>
                                                        {/if}
                                                    </span>
                                                </li>
                                                <li class="product-card__feature">
                                                    <div class="product-card__feature-left">
                                                        <span class="material-symbols-outlined">devices</span>
                                                        <span class="product-card__feature-label" data-i18n-user-product="label_devices">Thiết bị tối đa</span>
                                                    </div>
                                                    <span class="product-card__feature-value">
                                                        {if $time->content->ip_limit === '0'}
                                                            <span data-i18n-user-product="label_unlimited">Không giới hạn</span>
                                                        {else}
                                                            {$time->content->ip_limit}&nbsp;<span data-i18n-user-product="unit_devices">thiết bị</span>
                                                        {/if}
                                                    </span>
                                                </li>
                                            </ul>

                                            {if $time->stock === -1 || $time->stock > 0}
                                                <a href="/user/order/create?product_id={$time->id}"
                                                   class="product-card__btn"
                                                   data-i18n-user-product="btn_buy">Mua ngay</a>
                                            {else}
                                                <span class="product-card__btn product-card__btn--disabled"
                                                      data-i18n-user-product="btn_sold_out">Hết hàng</span>
                                            {/if}
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {else}
                        <div class="product-empty">
                            <span class="material-symbols-outlined">inventory_2</span>
                            <p class="product-empty__title" data-i18n-user-product="empty_title">Không có sản phẩm</p>
                            <p class="product-empty__desc" data-i18n-user-product="empty_desc">Hiện tại không có sản phẩm nào trong danh mục này.</p>
                        </div>
                    {/if}
                </div>

            </div><!-- /.tab-content -->
        </div>
    </div>

    {include file='user/footer.tpl'}

