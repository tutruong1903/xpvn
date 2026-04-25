{include file='user/header.tpl'}

<link href="/assets/css/user/invite.css{asset_ver path="/assets/css/user/invite.css"}" rel="stylesheet"/>

<!-- Invite page locale files -->
<script src="/assets/js/locales/user/invite/en_US.js{asset_ver path="/assets/js/locales/user/invite/en_US.js"}"></script>
<script src="/assets/js/locales/user/invite/vn_VN.js{asset_ver path="/assets/js/locales/user/invite/vn_VN.js"}"></script>
<script src="/assets/js/locales/user/invite/zh_CN.js{asset_ver path="/assets/js/locales/user/invite/zh_CN.js"}"></script>
<script src="/assets/js/locales/user/invite/zh_TW.js{asset_ver path="/assets/js/locales/user/invite/zh_TW.js"}"></script>
<script src="/assets/js/locales/user/invite/ja_JP.js{asset_ver path="/assets/js/locales/user/invite/ja_JP.js"}"></script>

<div class="lg-invite-page">

    <!-- ── Page Header ── -->
    <div class="lg-invite-header">
        <h1 class="lg-invite-header__title" data-i18n-user-invite="page_title">Mời bạn bè &amp; Nhận quà</h1>
        <p class="lg-invite-header__subtitle">
            <span data-i18n-user-invite="page_subtitle_pre">Chia sẻ trải nghiệm Luminous Guardian với mạng lưới của bạn và bắt đầu nhận hoa hồng trọn đời lên đến </span><span class="lg-accent">{$invite_reward_rate}%</span><span data-i18n-user-invite="page_subtitle_post"> cho mỗi giao dịch thành công.</span>
        </p>
    </div>

    <!-- ── Bento Grid: Referral Link + Rules ── -->
    <div class="lg-invite-bento">

        <!-- Referral Link Card -->
        <div class="lg-invite-card">
            <div class="lg-referral-card__icon-wrap">
                <span class="material-symbols-outlined lg-referral-card__icon">link</span>
            </div>
            <h3 class="lg-referral-card__title" data-i18n-user-invite="referral_link_title">Liên kết mời</h3>
            <p class="lg-referral-card__subtitle" data-i18n-user-invite="referral_link_subtitle">Gửi liên kết này cho bạn bè của bạn để bắt đầu tích lũy phần thưởng.</p>

            <div class="lg-invite-field">
                <label class="lg-invite-label" data-i18n-user-invite="label_invite_url">URL mời bạn</label>
                <div class="lg-invite-input-wrap">
                    <input class="lg-invite-input" id="invite-url" type="text" value="{$invite_url}" readonly/>
                    <button class="lg-invite-input-btn copy" data-clipboard-target="#invite-url"
                            data-i18n-user-invite="btn_copy">Sao chép</button>
                </div>
            </div>

            <div class="lg-invite-card-footer">
                <button class="lg-btn-reset"
                        hx-post="/user/invite/reset" hx-swap="none"
                        data-i18n-user-invite="btn_reset">Đặt lại</button>
            </div>

            <div class="lg-referral-card__blob"></div>
        </div>

        <!-- Rules Card -->
        <div class="lg-invite-card">
            <h3 class="lg-rules-card__title">
                <span class="material-symbols-outlined lg-rules-card__title-icon">info</span>
                <span data-i18n-user-invite="rules_title">Quy tắc mời</span>
            </h3>

            <div class="lg-rules-list">
                    <div class="lg-rule-item">
                        <div class="lg-rule-number">1</div>
                        <p class="lg-rule-text" data-i18n-user-invite="rule_1">Người dùng được mời đăng ký tài khoản thành công thông qua liên kết của bạn.</p>
                    </div>
                    <div class="lg-rule-item">
                        <div class="lg-rule-number">2</div>
                        <p class="lg-rule-text">
                            <span data-i18n-user-invite="rule_2_pre">Phần thưởng hoa hồng </span><strong>{$invite_reward_rate}%</strong><span data-i18n-user-invite="rule_2_post"> được tính trên giá trị thanh toán thực tế.</span>
                        </p>
                    </div>
                    <div class="lg-rule-item">
                        <div class="lg-rule-number">3</div>
                        <p class="lg-rule-text" data-i18n-user-invite="rule_3">Hoa hồng sẽ được cộng vào số dư ví của bạn ngay sau khi giao dịch hoàn tất.</p>
                    </div>
            </div>

            <div class="lg-earnings-summary">
                <div>
                    <p class="lg-earnings-label" data-i18n-user-invite="label_total_earnings">Tổng hoa hồng</p>
                    <p class="lg-earnings-value">{$paybacks_sum} USD</p>
                </div>
            </div>
        </div>

    </div>

    <!-- ── Rewards History ── -->
    <div class="lg-history-section">
        <div class="lg-history-header">
            <h2 class="lg-history-title" data-i18n-user-invite="history_title">Lịch sử nhận thưởng</h2>
            <button class="lg-btn-filter">
                <span class="material-symbols-outlined">filter_list</span>
                <span data-i18n-user-invite="btn_filter">Lọc</span>
            </button>
        </div>

        <div class="lg-history-table-wrap">
            <table class="lg-history-table">
                <thead>
                    <tr>
                        <th data-i18n-user-invite="th_record_id">Mã giao dịch</th>
                        <th data-i18n-user-invite="th_user_id">ID người được mời</th>
                        <th data-i18n-user-invite="th_nickname">Tên hiển thị</th>
                        <th class="lg-col-amount" data-i18n-user-invite="th_amount">Số tiền</th>
                        <th data-i18n-user-invite="th_time">Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                {if $paybacks|@count > 0}
                    {foreach $paybacks as $payback}
                    {assign var="avatar_class" value="lg-avatar--a"}
                    {if $payback@iteration % 3 == 2}{assign var="avatar_class" value="lg-avatar--b"}{/if}
                    {if $payback@iteration % 3 == 0}{assign var="avatar_class" value="lg-avatar--c"}{/if}
                    <tr>
                        <td class="lg-td-record-id">#RE-{$payback->id}</td>
                        <td>{$payback->userid}</td>
                        <td>
                            <div class="lg-nickname-wrap">
                                <div class="lg-avatar {$avatar_class}">{$payback->user_name|truncate:2:'':true|upper}</div>
                                <span class="lg-nickname-text">{$payback->user_name}</span>
                            </div>
                        </td>
                        <td class="lg-td-amount">{$payback->ref_get} USD</td>
                        <td class="lg-td-time">{$payback->datetime}</td>
                    </tr>
                    {/foreach}
                {else}
                    <tr class="lg-history-empty">
                        <td colspan="5">
                            <span class="material-symbols-outlined lg-empty-icon">card_giftcard</span>
                            <p class="lg-empty-title" data-i18n-user-invite="empty_title">Chưa có giao dịch nào</p>
                            <p class="lg-empty-desc" data-i18n-user-invite="empty_desc">Mời bạn bè qua liên kết của bạn để bắt đầu nhận hoa hồng.</p>
                        </td>
                    </tr>
                {/if}
                </tbody>
            </table>
        </div>
    </div>
</div>

{include file='user/footer.tpl'}
