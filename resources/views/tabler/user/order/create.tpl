{include file='user/header.tpl'}

<div class="order-create-layout">
    <!-- Page Header -->
    <div class="container-xl">
        <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <div class="order-page-header">
                        <h2 data-i18n-user-order="page_title">Create Order</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Page Body -->
    <div class="page-body">
        <div class="container-xl">
            <div class="row row-cards g-4">

                <!-- ── Left: Order Details ── -->
                <div class="col-12 col-lg-8">
                    <div class="order-card">
                        <div class="order-card__header">
                            <div class="order-card__icon">
                                <span class="material-symbols-outlined">assignment</span>
                            </div>
                            <h3 class="order-card__title" data-i18n-user-order="section_details">Order Details</h3>
                        </div>

                        <div class="order-details-grid">
                            <!-- Product Name -->
                            <div>
                                <span class="order-field__label" data-i18n-user-order="label_product_name">Product Name</span>
                                <p class="order-field__value order-field__value--large">{$product->name}</p>
                            </div>

                            <!-- Product Type -->
                            <div>
                                <span class="order-field__label" data-i18n-user-order="label_product_type">Product Type</span>
                                <p class="order-field__value">
                                    <span class="order-type-badge" data-i18n-user-order="type_{$product->type}">{$product->type_text}</span>
                                </p>
                            </div>

                            {if $product->type === 'tabp' || $product->type === 'time'}
                                <!-- Duration -->
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_duration">Validity Period</span>
                                    <p class="order-field__value">
                                        <span class="material-symbols-outlined">calendar_today</span>
                                        {$product->content->time}&nbsp;<span data-i18n-user-order="unit_days">days</span>
                                    </p>
                                </div>

                                <!-- Class Time -->
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_class_time">Usage Duration</span>
                                    <p class="order-field__value">
                                        <span class="material-symbols-outlined">schedule</span>
                                        {$product->content->class_time}&nbsp;<span data-i18n-user-order="unit_days">days</span>
                                    </p>
                                </div>

                                <!-- Level -->
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_class">Granted Level</span>
                                    <p class="order-field__value">
                                        {if $product->content->class == 0}
                                            <span data-i18n-user-order="level_basic">Basic</span>
                                        {elseif $product->content->class == 1}
                                            <span data-i18n-user-order="level_standard">Standard</span>
                                        {elseif $product->content->class == 2}
                                            <span data-i18n-user-order="level_premium">Premium</span>
                                        {else}
                                            <span data-i18n-user-order="level_vip">VIP</span>
                                        {/if}
                                    </p>
                                </div>
                            {/if}

                            {if $product->type === 'tabp' || $product->type === 'bandwidth'}
                                <!-- Bandwidth -->
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_bandwidth">Data Cap</span>
                                    <p class="order-field__value">
                                        <span class="material-symbols-outlined">data_usage</span>
                                        {$product->content->bandwidth}&nbsp;<span data-i18n-user-order="unit_gb">GB</span>
                                    </p>
                                </div>
                            {/if}

                            {if $product->type === 'tabp' || $product->type === 'time'}
                                <!-- Speed Limit -->
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_speed">Max Speed</span>
                                    {if $product->content->speed_limit === '0'}
                                        <p class="order-field__value" data-i18n-user-order="label_no_limit">Unlimited</p>
                                    {else}
                                        <p class="order-field__value order-field__value--accent">
                                            <span class="material-symbols-outlined">bolt</span>
                                            {$product->content->speed_limit}&nbsp;<span data-i18n-user-order="unit_mbps">Mbps</span>
                                        </p>
                                    {/if}
                                </div>

                                <!-- IP Limit -->
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_ip_limit">Max Devices</span>
                                    {if $product->content->ip_limit === '0'}
                                        <p class="order-field__value">
                                            <span class="material-symbols-outlined">devices</span>
                                            <span data-i18n-user-order="label_no_limit">Unlimited</span>
                                        </p>
                                    {else}
                                        <p class="order-field__value">
                                            <span class="material-symbols-outlined">devices</span>
                                            {$product->content->ip_limit}
                                        </p>
                                    {/if}
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>

                <!-- ── Right: Payment ── -->
                <div class="col-12 col-lg-4">
                    <!-- Payment Card -->
                    <div class="order-payment-card mb-3">
                        <div class="order-payment-card__glow"></div>

                        <div class="order-card__header" style="position:relative;z-index:1;">
                            <div class="order-card__icon">
                                <span class="material-symbols-outlined">payments</span>
                            </div>
                            <h3 class="order-card__title" data-i18n-user-order="section_payment">Payment</h3>
                        </div>

                        <div style="position:relative;z-index:1;">
                            <!-- Price row -->
                            <div class="order-payment-row">
                                <span class="order-payment-row__label" data-i18n-user-order="label_product_price">Product Price</span>
                                <span class="order-payment-row__price" id="product-buy-base">{$product->price}</span>
                            </div>

                            <!-- Coupon input -->
                            <span class="order-coupon__label" data-i18n-user-order="label_coupon">Coupon Code</span>
                            <div class="order-coupon__group">
                                <input
                                    id="coupon"
                                    type="text"
                                    class="order-coupon__input"
                                    data-i18n-user-order-ph="placeholder_coupon"
                                    placeholder="Enter coupon..."
                                />
                                <button
                                    class="order-coupon__btn"
                                    type="button"
                                    hx-post="/user/coupon"
                                    hx-swap="none"
                                    hx-vals='js:{
                                        coupon: document.getElementById("coupon").value,
                                        product_id: {$product->id},
                                    }'
                                    data-i18n-user-order="btn_apply_coupon"
                                >Apply</button>
                            </div>

                            <!-- Total row -->
                            <div class="order-payment-row" id="row-coupon-code" style="display:none;">
                                <span class="order-payment-row__label" data-i18n-user-order="label_coupon_code">Coupon</span>
                                <span class="order-payment-row__price order-payment-row__price--coupon" id="coupon-code"></span>
                            </div>

                            <div class="order-payment-row" id="row-coupon-discount" style="display:none;">
                                <span class="order-payment-row__label" data-i18n-user-order="label_discount">Discount</span>
                                <span class="order-payment-row__price order-payment-row__price--discount" id="product-buy-discount"></span>
                            </div>

                            <!-- Total row -->
                            <div class="order-total-row">
                                <span class="order-total-row__label" data-i18n-user-order="label_total">Total</span>
                                <span class="order-total-row__amount" id="product-buy-total">{$product->price}</span>
                            </div>

                            <!-- CTA -->
                            <button
                                class="order-cta-btn"
                                type="button"
                                hx-post="/user/order/create"
                                hx-swap="none"
                                hx-vals='js:{
                                    type: "product",
                                    coupon: document.getElementById("coupon").value,
                                    product_id: {$product->id},
                                }'
                            >
                                <span class="material-symbols-outlined">shopping_cart_checkout</span>
                                <span data-i18n-user-order="btn_create_order">Create Order</span>
                            </button>
                        </div>
                    </div>

                </div>

            </div><!-- /row -->

            <!-- ── Eligibility Card ── -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="order-eligibility-card {if $can_buy}order-eligibility-card--ok{else}order-eligibility-card--fail{/if}">
                        <div class="order-eligibility-card__header">
                            <div class="order-eligibility-card__icon">
                                <span class="material-symbols-outlined">
                                    {if $can_buy}verified_user{else}gpp_bad{/if}
                                </span>
                            </div>
                            <div>
                                <h3 class="order-eligibility-card__title" data-i18n-user-order="{if $can_buy}eligibility_title_ok{else}eligibility_title_fail{/if}">
                                    {if $can_buy}Đủ điều kiện mua{else}Không đủ điều kiện mua{/if}
                                </h3>
                                <p class="order-eligibility-card__subtitle" data-i18n-user-order="{if $can_buy}eligibility_subtitle_ok{else}eligibility_subtitle_fail{/if}">
                                    {if $can_buy}Tài khoản của bạn đáp ứng tất cả yêu cầu của sản phẩm này.{else}Tài khoản của bạn chưa đáp ứng một số yêu cầu bên dưới.{/if}
                                </p>
                            </div>
                        </div>

                        {if $eligibility|@count == 0}
                            <div class="order-eligibility-item">
                                <div class="order-eligibility-item__info">
                                    <span class="material-symbols-outlined order-eligibility-item__icon">check_circle</span>
                                    <span class="order-eligibility-item__label" data-i18n-user-order="eligibility_no_limit">
                                        Không có giới hạn mua — Tất cả tài khoản đều có thể mua sản phẩm này.
                                    </span>
                                </div>
                                <span class="order-eligibility-item__status order-eligibility-item__status--pass">
                                    <span class="material-symbols-outlined">check_circle</span>
                                </span>
                            </div>
                        {else}
                            {foreach $eligibility as $check}
                                <div class="order-eligibility-item">
                                    {if $check.type === 'class'}
                                        <div class="order-eligibility-item__info">
                                            <span class="material-symbols-outlined order-eligibility-item__icon">military_tech</span>
                                            <span class="order-eligibility-item__label" data-i18n-user-order="eligibility_label_class">Cấp độ tài khoản</span>
                                        </div>
                                        <div class="order-eligibility-item__compare">
                                            <div class="order-eligibility-chip order-eligibility-chip--user">
                                                <span class="order-eligibility-chip__sub" data-i18n-user-order="eligibility_yours">Của bạn</span>
                                                <span class="order-eligibility-chip__val">
                                                    {if $check.current == 0}Basic{elseif $check.current == 1}Standard{elseif $check.current == 2}Premium{else}VIP{/if}
                                                </span>
                                            </div>
                                            <span class="material-symbols-outlined order-eligibility-arrow">arrow_forward</span>
                                            <div class="order-eligibility-chip order-eligibility-chip--req">
                                                <span class="order-eligibility-chip__sub" data-i18n-user-order="eligibility_minimum">Tối thiểu</span>
                                                <span class="order-eligibility-chip__val">
                                                    {if $check.required == 0}Basic{elseif $check.required == 1}Standard{elseif $check.required == 2}Premium{else}VIP{/if}
                                                </span>
                                            </div>
                                            <span class="order-eligibility-item__status {if $check.pass}order-eligibility-item__status--pass{else}order-eligibility-item__status--fail{/if}">
                                                <span class="material-symbols-outlined">{if $check.pass}check_circle{else}cancel{/if}</span>
                                            </span>
                                        </div>
                                    {elseif $check.type === 'node_group'}
                                        <div class="order-eligibility-item__info">
                                            <span class="material-symbols-outlined order-eligibility-item__icon">hub</span>
                                            <span class="order-eligibility-item__label" data-i18n-user-order="eligibility_label_node_group">Nhóm node</span>
                                        </div>
                                        <div class="order-eligibility-item__compare">
                                            <div class="order-eligibility-chip order-eligibility-chip--user">
                                                <span class="order-eligibility-chip__sub" data-i18n-user-order="eligibility_yours">Của bạn</span>
                                                <span class="order-eligibility-chip__val" data-i18n-user-order="eligibility_group_prefix">Nhóm {$check.current}</span>
                                            </div>
                                            <span class="material-symbols-outlined order-eligibility-arrow">arrow_forward</span>
                                            <div class="order-eligibility-chip order-eligibility-chip--req">
                                                <span class="order-eligibility-chip__sub" data-i18n-user-order="eligibility_required_label">Yêu cầu</span>
                                                <span class="order-eligibility-chip__val" data-i18n-user-order="eligibility_group_prefix">Nhóm {$check.required}</span>
                                            </div>
                                            <span class="order-eligibility-item__status {if $check.pass}order-eligibility-item__status--pass{else}order-eligibility-item__status--fail{/if}">
                                                <span class="material-symbols-outlined">{if $check.pass}check_circle{else}cancel{/if}</span>
                                            </span>
                                        </div>
                                    {elseif $check.type === 'new_user'}
                                        <div class="order-eligibility-item__info">
                                            <span class="material-symbols-outlined order-eligibility-item__icon">person_add</span>
                                            <span class="order-eligibility-item__label" data-i18n-user-order="eligibility_label_new_user">Chỉ dành cho người dùng mới</span>
                                        </div>
                                        <div class="order-eligibility-item__compare">
                                            <div class="order-eligibility-chip {if $check.pass}order-eligibility-chip--user{else}order-eligibility-chip--fail{/if}">
                                                <span class="order-eligibility-chip__sub" data-i18n-user-order="eligibility_yours">Của bạn</span>
                                                <span class="order-eligibility-chip__val" data-i18n-user-order="{if $check.pass}eligibility_new_user_yes{else}eligibility_new_user_no{/if}">
                                                    {if $check.pass}Người mới{else}Đã có đơn hàng{/if}
                                                </span>
                                            </div>
                                            <span class="material-symbols-outlined order-eligibility-arrow">arrow_forward</span>
                                            <div class="order-eligibility-chip order-eligibility-chip--req">
                                                <span class="order-eligibility-chip__sub" data-i18n-user-order="eligibility_required_label">Yêu cầu</span>
                                                <span class="order-eligibility-chip__val" data-i18n-user-order="eligibility_new_user_yes">Người mới</span>
                                            </div>
                                            <span class="order-eligibility-item__status {if $check.pass}order-eligibility-item__status--pass{else}order-eligibility-item__status--fail{/if}">
                                                <span class="material-symbols-outlined">{if $check.pass}check_circle{else}cancel{/if}</span>
                                            </span>
                                        </div>
                                    {/if}
                                </div>
                            {/foreach}
                        {/if}
                    </div>
                </div>
            </div>
        </div><!-- /container-xl -->
    </div><!-- /page-body -->

    <script>
        (function () {
            var couponBtn = document.querySelector('[hx-post="/user/coupon"]');
            if (!couponBtn) return;

            couponBtn.addEventListener('htmx:afterRequest', function (evt) {
                try {
                    var res = JSON.parse(evt.detail.xhr.response);
                    var rowCode     = document.getElementById('row-coupon-code');
                    var rowDiscount = document.getElementById('row-coupon-discount');

                    if (res.ret === 1 && res.data && res.data['coupon-code']) {
                        rowCode.style.display     = 'flex';
                        rowDiscount.style.display = 'flex';
                    } else {
                        rowCode.style.display     = 'none';
                        rowDiscount.style.display = 'none';
                        document.getElementById('coupon-code').textContent         = '';
                        document.getElementById('product-buy-discount').textContent = '';
                        document.getElementById('product-buy-total').textContent    =
                            document.getElementById('product-buy-base').textContent;
                    }
                } catch (e) {}
            }, false);
        })();
    </script>

    {include file='user/footer.tpl'}
