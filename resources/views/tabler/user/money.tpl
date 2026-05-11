{include file='user/header.tpl'}

<link href="/assets/css/user/money.css{asset_ver path="/assets/css/user/money.css"}" rel="stylesheet" />
<div class="page-body">
    <div class="container-xl">

        <!-- Page Header -->
        <div class="money-page-header">
            <div class="money-page-header__content">
                <h2 class="money-page-title" data-i18n="user.money.page_title">余额记录</h2>
                <p class="money-page-subtitle" data-i18n="user.money.page_subtitle">查看账户余额变动记录</p>
            </div>
            <div class="money-page-header__actions">
                <button class="money-btn-outline" data-bs-toggle="modal" data-bs-target="#apply-giftcard-dialog">
                    <span class="material-symbols-outlined">redeem</span>
                    <span data-i18n="user.money.btn_redeem">兑换礼品卡</span>
                </button>
                <button class="money-btn-primary" data-bs-toggle="modal" data-bs-target="#topup">
                    <span class="material-symbols-outlined">add_circle</span>
                    <span data-i18n="user.money.btn_topup">充值</span>
                </button>
            </div>
        </div>

        <!-- Balance Summary — Bento Grid -->
        <div class="money-bento-grid">

            <!-- Primary: Current Balance -->
            <div class="money-balance-card">
                <div class="money-balance-card__glow"></div>
                <p class="money-balance-card__label" data-i18n="user.money.stat_balance">当前余额</p>
                <div class="money-balance-card__value-row">
                    <span class="money-balance-card__amount">{$current_balance|number_format:2:'.':','}</span>
                    <span class="money-balance-card__currency">{$config['currency_symbol']|default:'$'}</span>
                </div>
                <div class="money-balance-card__footer">
                    <span class="material-symbols-outlined">verified_user</span>
                    <span data-i18n="user.money.stat_guardian">账户受 Luminous Guardian 保护</span>
                </div>
            </div>

            <!-- Secondary: Credit & Debit -->
            <div class="money-stat-cards">
                <div class="money-stat-card">
                    <div class="money-stat-card__icon money-stat-card__icon--credit">
                        <span class="material-symbols-outlined">arrow_upward</span>
                    </div>
                    <div>
                        <p class="money-stat-card__label" data-i18n="user.money.stat_credit">累计充值</p>
                        <p class="money-stat-card__value">{$total_credit|number_format:2:'.':','} {$config['currency_symbol']|default:'$'}</p>
                    </div>
                </div>
                <div class="money-stat-card">
                    <div class="money-stat-card__icon money-stat-card__icon--debit">
                        <span class="material-symbols-outlined">arrow_downward</span>
                    </div>
                    <div>
                        <p class="money-stat-card__label" data-i18n="user.money.stat_debit">累计消费</p>
                        <p class="money-stat-card__value">{$total_debit|number_format:2:'.':','} {$config['currency_symbol']|default:'$'}</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="container-xl">

        <!-- Transaction Table -->
        <div class="money-table-card">
            <div class="money-table-card__header">
                <h3 class="money-table-card__title" data-i18n="user.money.table_title">交易明细</h3>
            </div>

            <div class="table-responsive">
                <table class="table money-table-card">
                    <thead>
                        <tr>
                            {foreach
                                $details['field']
                                as
                                $key=>
                                $value
                            }
                                <th{if $key === 'before' || $key === 'after' || $key === 'amount' || $key === 'create_time'} class="text-end" {/if} data-i18n="user.money.fields.{$key}">{$value}</th>
                            {/foreach}
                        </tr>
                    </thead>
                    <tbody>
                        {if $moneylogs|count > 0}
                            {foreach $moneylogs as $moneylog}
                                <tr>
                                    <td>
                                        <span class="money-txn-id">#{$moneylog->id}</span>
                                    </td>
                                    <td class="text-end">
                                        <span class="money-balance-before">{$moneylog->before|number_format:2:'.':','}</span>
                                    </td>
                                    <td class="text-end">
                                        <span class="money-balance-after">{$moneylog->after|number_format:2:'.':','}</span>
                                    </td>
                                    <td class="text-end">
                                        {if $moneylog->amount > 0}
                                            <span class="money-amount-badge money-amount-badge--credit">+{$moneylog->amount|number_format:2:'.':','}</span>
                                        {elseif $moneylog->amount < 0}
                                            <span class="money-amount-badge money-amount-badge--debit">{$moneylog->amount|number_format:2:'.':','}</span>
                                        {else}
                                            <span class="money-amount-badge money-amount-badge--neutral">{$moneylog->amount|number_format:2:'.':','}</span>
                                        {/if}
                                    </td>
                                    <td>
                                        <p class="money-remark" title="{$moneylog->remark}">{$moneylog->remark}</p>
                                    </td>
                                    <td class="text-end">
                                        <span class="money-time">{$moneylog->create_time}</span>
                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr>
                                <td colspan="6">
                                    <div class="money-empty-state">
                                        <div class="money-empty-state__icon">
                                            <span class="material-symbols-outlined">account_balance_wallet</span>
                                        </div>
                                        <h4 class="money-empty-state__title" data-i18n="user.money.empty_title">暂无交易记录</h4>
                                        <p class="money-empty-state__desc" data-i18n="user.money.empty_desc">您尚未进行任何充值或消费操作。</p>
                                    </div>
                                </td>
                            </tr>
                        {/if}
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            {if $total_pages > 1}
                <div class="money-pagination">
                    <p class="money-pagination__info" data-money-pagination-total="{$moneylog_count}" data-money-pagination-page="{$current_page}" data-money-pagination-per="{$per_page}">
                        {math equation="(page-1)*per+1" page=$current_page per=$per_page}–{math equation="min(page*per, total)" page=$current_page per=$per_page total=$moneylog_count} / {$moneylog_count}
                    </p>
                    <div class="money-pagination__controls">
                        {if $current_page > 1}
                            <a href="?page={$current_page-1}" class="money-pagination__btn money-pagination__btn--nav">
                                <span class="material-symbols-outlined">chevron_left</span>
                            </a>
                        {else}
                            <button class="money-pagination__btn money-pagination__btn--nav" disabled>
                                <span class="material-symbols-outlined">chevron_left</span>
                            </button>
                        {/if}

                        {for $p = $page_start to $page_end}
                            {if $p === $current_page}
                                <button class="money-pagination__btn money-pagination__btn--active">{$p}</button>
                            {else}
                                <a href="?page={$p}" class="money-pagination__btn">{$p}</a>
                            {/if}
                        {/for}

                        {if $current_page < $total_pages}
                            <a href="?page={$current_page+1}" class="money-pagination__btn money-pagination__btn--nav">
                                <span class="material-symbols-outlined">chevron_right</span>
                            </a>
                        {else}
                            <button class="money-pagination__btn money-pagination__btn--nav" disabled>
                                <span class="material-symbols-outlined">chevron_right</span>
                            </button>
                        {/if}
                    </div>
                </div>
            {/if}

        </div>
    </div>
</div>

<!-- Gift Card Modal -->
<div class="modal modal-blur fade money-modal" id="apply-giftcard-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" data-i18n="user.money.modal_giftcard_title">兑换礼品卡</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <input id="giftcard" type="text" class="form-control" data-i18n-placeholder="user.money.modal_giftcard_placeholder" placeholder="输入礼品卡卡号并点击兑换">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn me-auto" data-bs-dismiss="modal" data-i18n="user.money.modal_giftcard_cancel">取消</button>
                <button id="apply-giftcard" class="money-btn-primary" data-bs-dismiss="modal" hx-post="/user/giftcard" hx-swap="none" hx-vals='js:{ giftcard: document.getElementById("giftcard").value }' data-i18n="user.money.modal_giftcard_submit">兑换</button>
            </div>
        </div>
    </div>
</div>

<!-- Top-up Modal -->
<div class="modal modal-blur fade money-modal" id="topup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" data-i18n="user.money.modal_topup_title">余额充值</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <input id="topup_amount" type="number" step="10" class="form-control" data-i18n-placeholder="user.money.modal_topup_placeholder" placeholder="请输入要充值的金额">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn me-auto" data-bs-dismiss="modal" data-i18n="user.money.modal_topup_cancel">取消</button>
                <button id="apply-topup" class="money-btn-primary" data-bs-dismiss="modal" hx-post="/user/order/create" hx-swap="none" hx-vals='js:{
                            amount: document.getElementById("topup_amount").value,
                            type: "topup"
                        }' data-i18n="user.money.modal_topup_submit">充值</button>
            </div>
        </div>
    </div>
</div>

{include file='user/footer.tpl'}