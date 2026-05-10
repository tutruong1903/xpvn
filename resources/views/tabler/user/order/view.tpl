{include file='user/header.tpl'}

<div class="order-view-layout">

    <!-- Page Header -->
    <div class="container-xl">
        <div class="order-view-header">
            <div class="order-view-header__content">
                <a href="/user/order" class="order-view-back">
                    <span class="material-symbols-outlined">arrow_back</span>
                    <span data-i18n-user-order="breadcrumb_orders">Orders</span>
                </a>
                <h2>#{$order->id}</h2>
                <p data-i18n-user-order="view_title">Order Details</p>
            </div>
            <div class="order-view-header__actions">
                <a href="/user/invoice/{$invoice->id}/view" class="order-view-btn">
                    <span class="material-symbols-outlined">receipt_long</span>
                    <span data-i18n-user-order="view_btn_invoice">View Invoice</span>
                </a>
            </div>
        </div>
    </div>

    <!-- Page Body -->
    <div class="page-body">
        <div class="container-xl">
            <div class="row row-cards g-4">

                <!-- ── Left: Order Info ── -->
                <div class="col-12 col-lg-7">

                    <!-- Basic Information Card -->
                    <div class="order-card mb-4">
                        <div class="order-card__header">
                            <div class="order-card__icon">
                                <span class="material-symbols-outlined">assignment</span>
                            </div>
                            <h3 class="order-card__title" data-i18n-user-order="section_basic_info">Basic Information</h3>
                        </div>

                        <div class="order-details-grid">
                            <div>
                                <span class="order-field__label" data-i18n-user-order="label_product_name">Product Name</span>
                                <p class="order-field__value order-field__value--large">{$order->product_name}</p>
                            </div>

                            <div>
                                <span class="order-field__label" data-i18n-user-order="label_product_type">Product Type</span>
                                <p class="order-field__value">
                                    <span class="order-type-badge">{$order->product_type_text}</span>
                                </p>
                            </div>

                            <div>
                                <span class="order-field__label" data-i18n-user-order="label_order_amount">Order Amount</span>
                                <p class="order-field__value order-field__value--accent">
                                    <span class="material-symbols-outlined">attach_money</span>
                                    {$order->price}
                                </p>
                            </div>

                            <div>
                                <span class="order-field__label" data-i18n-user-order="label_order_status">Order Status</span>
                                <p class="order-field__value">
                                    <span class="order-view-status">{$order->status}</span>
                                </p>
                            </div>

                            {if $order->coupon}
                            <div>
                                <span class="order-field__label" data-i18n-user-order="label_coupon">Coupon Code</span>
                                <p class="order-field__value">
                                    <span class="order-payment-row__price--coupon">{$order->coupon}</span>
                                </p>
                            </div>
                            {/if}

                            <div>
                                <span class="order-field__label" data-i18n-user-order="label_create_time">Created At</span>
                                <p class="order-field__value">
                                    <span class="material-symbols-outlined">calendar_today</span>
                                    {$order->create_time}
                                </p>
                            </div>

                            <div>
                                <span class="order-field__label" data-i18n-user-order="label_update_time">Updated At</span>
                                <p class="order-field__value">
                                    <span class="material-symbols-outlined">update</span>
                                    {$order->update_time}
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Product Contents Card (only for non-topup orders) -->
                    {if $order->type !== 'topup'}
                    <div class="order-card">
                        <div class="order-card__header">
                            <div class="order-card__icon">
                                <span class="material-symbols-outlined">inventory_2</span>
                            </div>
                            <h3 class="order-card__title" data-i18n-user-order="section_product_content">Product Contents</h3>
                        </div>

                        <div class="order-details-grid">
                            {if $order->product_type === 'tabp' || $order->product_type === 'time'}
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_duration">Validity Period</span>
                                    <p class="order-field__value">
                                        <span class="material-symbols-outlined">calendar_today</span>
                                        {$order->content->time}&nbsp;<span data-i18n-user-order="unit_days">days</span>
                                    </p>
                                </div>
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_class_time">Usage Duration</span>
                                    <p class="order-field__value">
                                        <span class="material-symbols-outlined">schedule</span>
                                        {$order->content->class_time}&nbsp;<span data-i18n-user-order="unit_days">days</span>
                                    </p>
                                </div>
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_class">Granted Level</span>
                                    <p class="order-field__value">
                                        {if $order->content->class == 0}
                                            <span data-i18n-user-order="level_basic">Basic</span>
                                        {elseif $order->content->class == 1}
                                            <span data-i18n-user-order="level_standard">Standard</span>
                                        {elseif $order->content->class == 2}
                                            <span data-i18n-user-order="level_premium">Premium</span>
                                        {else}
                                            <span data-i18n-user-order="level_vip">VIP</span>
                                        {/if}
                                    </p>
                                </div>
                            {/if}

                            {if $order->product_type === 'tabp' || $order->product_type === 'bandwidth'}
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_bandwidth">Data Cap</span>
                                    <p class="order-field__value">
                                        <span class="material-symbols-outlined">data_usage</span>
                                        {$order->content->bandwidth}&nbsp;<span data-i18n-user-order="unit_gb">GB</span>
                                    </p>
                                </div>
                            {/if}

                            {if $order->product_type === 'tabp' || $order->product_type === 'time'}
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_speed">Max Speed</span>
                                    {if $order->content->speed_limit === '0'}
                                        <p class="order-field__value" data-i18n-user-order="label_no_limit">Unlimited</p>
                                    {else}
                                        <p class="order-field__value order-field__value--accent">
                                            <span class="material-symbols-outlined">bolt</span>
                                            {$order->content->speed_limit}&nbsp;<span data-i18n-user-order="unit_mbps">Mbps</span>
                                        </p>
                                    {/if}
                                </div>
                                <div>
                                    <span class="order-field__label" data-i18n-user-order="label_ip_limit">Max Devices</span>
                                    {if $order->content->ip_limit === '0'}
                                        <p class="order-field__value">
                                            <span class="material-symbols-outlined">devices</span>
                                            <span data-i18n-user-order="label_no_limit">Unlimited</span>
                                        </p>
                                    {else}
                                        <p class="order-field__value">
                                            <span class="material-symbols-outlined">devices</span>
                                            {$order->content->ip_limit}
                                        </p>
                                    {/if}
                                </div>
                            {/if}
                        </div>
                    </div>
                    {/if}

                </div>

                <!-- ── Right: Invoice ── -->
                <div class="col-12 col-lg-5">
                    <div class="order-payment-card">
                        <div class="order-payment-card__glow"></div>

                        <div class="order-card__header" style="position:relative;z-index:1;">
                            <div class="order-card__icon">
                                <span class="material-symbols-outlined">receipt_long</span>
                            </div>
                            <h3 class="order-card__title" data-i18n-user-order="section_invoice">Related Invoice</h3>
                        </div>

                        <div style="position:relative;z-index:1;">

                            <!-- Invoice items table -->
                            <span class="order-field__label" data-i18n-user-order="label_invoice_content">Invoice Items</span>
                            <div style="margin-top:0.5rem;margin-bottom:1.5rem;">
                                <table class="order-invoice-table">
                                    <thead>
                                    <tr>
                                        <th data-i18n-user-order="label_item_name">Item Name</th>
                                        <th data-i18n-user-order="label_item_price">Price</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach $invoice->content as $invoice_content}
                                        <tr>
                                            <td>{$invoice_content->name}</td>
                                            <td>{$invoice_content->price}</td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                            </div>

                            <!-- Invoice summary -->
                            <div class="order-invoice-summary">
                                <div class="order-payment-row" style="margin-bottom:0;">
                                    <span class="order-payment-row__label" data-i18n-user-order="label_invoice_amount">Invoice Amount</span>
                                    <span class="order-payment-row__price">{$invoice->price}</span>
                                </div>

                                <div class="order-payment-row" style="margin-bottom:0;">
                                    <span class="order-payment-row__label" data-i18n-user-order="label_invoice_status">Invoice Status</span>
                                    <span class="order-view-status">{$invoice->status}</span>
                                </div>

                                <div class="order-payment-row" style="margin-bottom:0;">
                                    <span class="order-payment-row__label" data-i18n-user-order="label_create_time">Created At</span>
                                    <span style="font-size:0.875rem;font-weight:500;color:#464554;">{$invoice->create_time}</span>
                                </div>

                                <div class="order-payment-row" style="margin-bottom:0;">
                                    <span class="order-payment-row__label" data-i18n-user-order="label_update_time">Updated At</span>
                                    <span style="font-size:0.875rem;font-weight:500;color:#464554;">{$invoice->update_time}</span>
                                </div>

                                <div class="order-payment-row" style="margin-bottom:0;">
                                    <span class="order-payment-row__label" data-i18n-user-order="label_pay_time">Paid At</span>
                                    <span style="font-size:0.875rem;font-weight:500;color:#464554;">{$invoice->pay_time}</span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div><!-- /row -->
        </div><!-- /container-xl -->
    </div><!-- /page-body -->

    {include file='user/footer.tpl'}
</div>
