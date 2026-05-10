{include file='user/header.tpl'}

<div class="order-view-layout">

    <!-- Page Header -->
    <div class="container-xl">
        <div class="order-view-header">
            <div class="order-view-header__content">
                <a href="/user/invoice" class="order-view-back">
                    <span class="material-symbols-outlined">arrow_back</span>
                    <span data-i18n-user-invoice="index_title">Invoices</span>
                </a>
                <h2>#{$invoice->id}</h2>
                <p data-i18n-user-invoice="view_title">Invoice Details</p>
            </div>
            <div class="order-view-header__actions">
                <a href="/user/order/{$invoice->order_id}/view" class="order-view-btn">
                    <span class="material-symbols-outlined">assignment</span>
                    <span data-i18n-user-invoice="view_btn_order">View Order</span>
                </a>
            </div>
        </div>
    </div>

    <!-- Page Body -->
    <div class="page-body">
        <div class="container-xl">
            <div class="row row-cards g-4">

                <!-- ── Left / Main: Basic info + Invoice items ── -->
                {if $invoice->status === 'unpaid' || $invoice->status === 'partially_paid'}
                <div class="col-12 col-lg-7">
                {else}
                <div class="col-12">
                {/if}

                    <!-- Basic Information Card -->
                    <div class="order-card mb-4">
                        <div class="order-card__header">
                            <div class="order-card__icon">
                                <span class="material-symbols-outlined">receipt_long</span>
                            </div>
                            <h3 class="order-card__title" data-i18n-user-invoice="section_basic_info">Basic Information</h3>
                        </div>

                        <div class="order-details-grid">
                            <div>
                                <span class="order-field__label" data-i18n-user-invoice="label_order_id">Order ID</span>
                                <p class="order-field__value">
                                    <a href="/user/order/{$invoice->order_id}/view" style="color:#712ae2;font-weight:600;text-decoration:none;">
                                        #{$invoice->order_id}
                                    </a>
                                </p>
                            </div>

                            <div>
                                <span class="order-field__label" data-i18n-user-invoice="label_invoice_amount">Invoice Amount</span>
                                <p class="order-field__value order-field__value--accent">
                                    <span class="material-symbols-outlined">attach_money</span>
                                    {$invoice->price}
                                </p>
                            </div>

                            <div>
                                <span class="order-field__label" data-i18n-user-invoice="label_invoice_status">Invoice Status</span>
                                <p class="order-field__value">
                                    <span class="order-view-status">{$invoice->status_text}</span>
                                </p>
                            </div>

                            <div>
                                <span class="order-field__label" data-i18n-user-invoice="label_create_time">Created At</span>
                                <p class="order-field__value">
                                    <span class="material-symbols-outlined">calendar_today</span>
                                    {$invoice->create_time}
                                </p>
                            </div>

                            <div>
                                <span class="order-field__label" data-i18n-user-invoice="label_update_time">Updated At</span>
                                <p class="order-field__value">
                                    <span class="material-symbols-outlined">update</span>
                                    {$invoice->update_time}
                                </p>
                            </div>

                            <div>
                                <span class="order-field__label" data-i18n-user-invoice="label_pay_time">Paid At</span>
                                <p class="order-field__value">
                                    <span class="material-symbols-outlined">payments</span>
                                    {$invoice->pay_time}
                                </p>
                            </div>

                            {if $invoice->status === 'paid_gateway'}
                            <div class="col-span-2">
                                <span class="order-field__label" data-i18n-user-invoice="label_gateway_tradeno">Gateway Transaction ID</span>
                                <p class="order-field__value">
                                    <span class="material-symbols-outlined">tag</span>
                                    {$paylist->tradeno}
                                </p>
                            </div>
                            {/if}
                        </div>
                    </div>

                    <!-- Invoice Items Card -->
                    <div class="order-card">
                        <div class="order-card__header">
                            <div class="order-card__icon">
                                <span class="material-symbols-outlined">list_alt</span>
                            </div>
                            <h3 class="order-card__title" data-i18n-user-invoice="section_invoice_details">Invoice Details</h3>
                        </div>

                        <table class="order-invoice-table">
                            <thead>
                            <tr>
                                <th data-i18n-user-invoice="label_item_name">Item Name</th>
                                <th data-i18n-user-invoice="label_item_price">Price</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach $invoice_content as $invoice_content_detail}
                                <tr>
                                    <td>{$invoice_content_detail->name}</td>
                                    <td>{$invoice_content_detail->price}</td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    </div>

                </div>

                <!-- ── Right: Payment Panel (only for unpaid invoices) ── -->
                {if $invoice->status === 'unpaid' || $invoice->status === 'partially_paid'}
                <div class="col-12 col-lg-5">
                    <div class="order-payment-card">
                        <div class="order-payment-card__glow"></div>

                        <div class="order-card__header" style="position:relative;z-index:1;">
                            <div class="order-card__icon">
                                <span class="material-symbols-outlined">payments</span>
                            </div>
                            <h3 class="order-card__title" data-i18n-user-invoice="section_payment">Payment</h3>
                        </div>

                        <div style="position:relative;z-index:1;">

                            <!-- Tab nav -->
                            <ul class="nav nav-tabs nav-fill mb-4" data-bs-toggle="tabs">
                                {if $invoice->type !== 'topup'}
                                <li class="nav-item">
                                    <a href="#tab-balance" class="nav-link active" data-bs-toggle="tab" data-i18n-user-invoice="tab_balance_pay">
                                        Balance Payment
                                    </a>
                                </li>
                                {/if}
                                {if count($payments) > 0}
                                <li class="nav-item">
                                    <a href="#tab-gateway" class="nav-link {if $invoice->type === 'topup'}active{/if}" data-bs-toggle="tab" data-i18n-user-invoice="tab_gateway_pay">
                                        Gateway Payment
                                    </a>
                                </li>
                                {/if}
                            </ul>

                            <div class="tab-content">

                                <!-- Balance tab -->
                                {if $invoice->type !== 'topup'}
                                <div class="tab-pane active show" id="tab-balance">
                                    <div class="order-payment-row" style="margin-bottom:1.25rem;">
                                        <span class="order-payment-row__label" data-i18n-user-invoice="label_balance_available">Available Balance</span>
                                        <span class="order-payment-row__price">{$user->money} USD</span>
                                    </div>

                                    <button class="order-cta-btn" type="button"
                                            hx-post="/user/invoice/pay_balance"
                                            hx-swap="none"
                                            hx-vals='js:{ invoice_id: {$invoice->id} }'>
                                        <span class="material-symbols-outlined">payments</span>
                                        <span data-i18n-user-invoice="btn_pay">Pay Now</span>
                                    </button>
                                </div>
                                {/if}

                                <!-- Gateway tab -->
                                {if count($payments) > 0}
                                <div class="tab-pane show {if $invoice->type === 'topup'}active{/if}" id="tab-gateway">
                                    {foreach from=$payments item=payment}
                                    <div class="mb-3">
                                        {$payment_name = $payment::_name()}
                                        {include file="../../gateway/$payment_name.tpl"}
                                    </div>
                                    {/foreach}
                                </div>
                                {/if}

                                <!-- No methods -->
                                {if $invoice->type === 'topup' && count($payments) === 0}
                                <p class="order-field__label" style="text-align:center;padding:1.5rem 0;" data-i18n-user-invoice="no_payment_method">
                                    No payment methods available
                                </p>
                                {/if}

                            </div>
                        </div>
                    </div>
                </div>
                {/if}

            </div><!-- /row -->
        </div><!-- /container-xl -->
    </div><!-- /page-body -->

    {include file='user/footer.tpl'}
</div>
