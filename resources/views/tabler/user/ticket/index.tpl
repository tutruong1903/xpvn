{include file='user/header.tpl'}

<link href="/assets/css/user/ticket.css{asset_ver path="/assets/css/user/ticket.css"}" rel="stylesheet"/>

<!-- Ticket page locale files -->
<script src="/assets/js/locales/user/ticket/en_US.js{asset_ver path="/assets/js/locales/user/ticket/en_US.js"}"></script>
<script src="/assets/js/locales/user/ticket/vn_VN.js{asset_ver path="/assets/js/locales/user/ticket/vn_VN.js"}"></script>
<script src="/assets/js/locales/user/ticket/zh_CN.js{asset_ver path="/assets/js/locales/user/ticket/zh_CN.js"}"></script>
<script src="/assets/js/locales/user/ticket/zh_TW.js{asset_ver path="/assets/js/locales/user/ticket/zh_TW.js"}"></script>
<script src="/assets/js/locales/user/ticket/ja_JP.js{asset_ver path="/assets/js/locales/user/ticket/ja_JP.js"}"></script>

<div class="ev-ticket-page">
    <div class="ev-ticket-container">
        <!-- Page Header -->
        <div class="ev-ticket-header">
            <div class="ev-ticket-header-content">
                <h2 data-i18n-user-ticket="page_title">工单列表</h2>
                <p data-i18n-user-ticket="page_subtitle">管理和处理支持请求</p>
            </div>
            <button class="ev-btn-new-ticket" data-bs-toggle="modal" data-bs-target="#create-ticket" data-i18n-user-ticket="btn_new_ticket">
                创建工单
            </button>
        </div>

        <!-- Metrics Grid -->
        <div class="ev-metrics-grid">
            <div class="ev-metric-card">
                <p class="ev-metric-card-label" data-i18n-user-ticket="metric_total">Total Active</p>
                <h3 class="ev-metric-card-value" id="total-tickets">0</h3>
            </div>
            <div class="ev-metric-card">
                <p class="ev-metric-card-label" data-i18n-user-ticket="metric_pending">Pending</p>
                <h3 class="ev-metric-card-value" id="pending-tickets">0</h3>
                <p class="ev-metric-card-desc" data-i18n-user-ticket="metric_pending_desc">Requiring attention</p>
            </div>
            <div class="ev-metric-card">
                <p class="ev-metric-card-label" data-i18n-user-ticket="metric_resolved">Resolved</p>
                <h3 class="ev-metric-card-value" id="resolved-tickets">0</h3>
                <p class="ev-metric-card-desc" data-i18n-user-ticket="metric_resolved_desc">All time success</p>
            </div>
        </div>

        <!-- Filter Tabs -->
        <div class="ev-filter-tabs">
            <button class="ev-filter-tab active" data-filter="all" data-i18n-user-ticket="filter_all">全部工单</button>
            <button class="ev-filter-tab" data-filter="howto" data-i18n-user-ticket="filter_howto">使用</button>
            <button class="ev-filter-tab" data-filter="billing" data-i18n-user-ticket="filter_billing">财务</button>
            <button class="ev-filter-tab" data-filter="account" data-i18n-user-ticket="filter_account">账户</button>
            <button class="ev-filter-tab" data-filter="other" data-i18n-user-ticket="filter_other">其他</button>
        </div>

        <!-- Ticket Table -->
        <div class="ev-ticket-table-container">
            {if $tickets !== 0}
            <!-- Table Header -->
            <div class="ev-table-header">
                <span data-i18n-user-ticket="th_id">ID</span>
                <span data-i18n-user-ticket="th_subject">Subject</span>
                <span data-i18n-user-ticket="th_type">Type</span>
                <span data-i18n-user-ticket="th_status">Status</span>
                <span data-i18n-user-ticket="th_updated">Last Update</span>
                <span data-i18n-user-ticket="th_action">Action</span>
            </div>

            <!-- Table Body -->
            <div class="ev-table-body" id="ticket-list">
                {foreach $tickets as $ticket}
                <div class="ev-table-row" data-ticket-type="{$ticket->type}">
                    <div class="ev-table-cell-id">#{$ticket->id}</div>
                    <div class="ev-table-cell-title">{$ticket->title}</div>
                    <div class="ev-table-cell-type" data-type="{$ticket->type}">
                        {if $ticket->type == 'howto'}
                            <span data-i18n-user-ticket="type_howto">使用</span>
                        {elseif $ticket->type == 'billing'}
                            <span data-i18n-user-ticket="type_billing">财务</span>
                        {elseif $ticket->type == 'account'}
                            <span data-i18n-user-ticket="type_account">账户</span>
                        {else}
                            <span data-i18n-user-ticket="type_other">其他</span>
                        {/if}
                    </div>
                    <div class="ev-table-cell-status {if $ticket->status != 'closed'}ev-status-open{else}ev-status-closed{/if}">
                        <span class="ev-status-dot"></span>
                        <span>{if $ticket->status != 'closed'}<span data-i18n-user-ticket="status_open">进行中</span>{else}<span data-i18n-user-ticket="status_closed">已关闭</span>{/if}</span>
                    </div>
                    <div class="ev-table-cell-updated">{$ticket->datetime}</div>
                    <div class="ev-table-cell-action">
                        <a href="/user/ticket/{$ticket->id}/view" class="ev-btn-view" data-i18n-user-ticket="action_view">查看</a>
                    </div>
                </div>
                {/foreach}
            </div>

            <!-- Pagination -->
            <div class="ev-pagination">
                <div class="ev-pagination-info">
                    <span data-i18n-user-ticket="pagination_showing">Showing</span>
                    <span id="page-start">1</span>-<span id="page-end">10</span>
                    <span data-i18n-user-ticket="pagination_of">of</span>
                    <span id="total-count">0</span>
                    <span data-i18n-user-ticket="pagination_tickets">tickets</span>
                </div>
                <div class="ev-pagination-controls">
                    <button class="ev-pagination-btn" id="prev-page" data-i18n-user-ticket="pagination_prev">Previous</button>
                    <div id="pagination-numbers"></div>
                    <button class="ev-pagination-btn" id="next-page" data-i18n-user-ticket="pagination_next">Next</button>
                </div>
            </div>
            {else}
            <!-- Empty State -->
            <div class="ev-empty-state">
                <h3 class="ev-empty-state-title" data-i18n-user-ticket="empty_title">没有任何工单</h3>
                <p class="ev-empty-state-desc" data-i18n-user-ticket="empty_desc">如需帮助，请点击上方按钮开启新工单</p>
            </div>
            {/if}
        </div>
    </div>
</div>

<script>
// Ticket filtering and pagination
(function() {
    var itemsPerPage = 10;
    var currentPage = 1;
    var currentFilter = 'all';
    var allRows = [];

    function initTickets() {
        allRows = Array.from(document.querySelectorAll('.ev-table-row'));
        updateMetrics();
        updatePagination();
        initFilterTabs();
    }

    function updateMetrics() {
        var total = allRows.length;
        var pending = allRows.filter(function(row) {
            var status = row.querySelector('.ev-table-cell-status');
            return status && status.classList.contains('ev-status-open');
        }).length;
        var closed = allRows.filter(function(row) {
            var status = row.querySelector('.ev-table-cell-status');
            return status && status.classList.contains('ev-status-closed');
        }).length;

        var totalEl = document.getElementById('total-tickets');
        var pendingEl = document.getElementById('pending-tickets');
        var resolvedEl = document.getElementById('resolved-tickets');

        if (totalEl) totalEl.textContent = total;
        if (pendingEl) pendingEl.textContent = pending;
        if (resolvedEl) resolvedEl.textContent = closed;
    }

    function initFilterTabs() {
        var tabs = document.querySelectorAll('.ev-filter-tab');
        tabs.forEach(function(tab) {
            tab.addEventListener('click', function() {
                tabs.forEach(function(t) { t.classList.remove('active'); });
                tab.classList.add('active');
                currentFilter = tab.getAttribute('data-filter');
                currentPage = 1;
                updatePagination();
            });
        });
    }

    function getFilteredRows() {
        if (currentFilter === 'all') {
            return allRows;
        }
        return allRows.filter(function(row) {
            var ticketType = row.getAttribute('data-ticket-type');
            return ticketType && ticketType.trim() === currentFilter;
        });
    }

    function updatePagination() {
        var filteredRows = getFilteredRows();
        var totalPages = Math.ceil(filteredRows.length / itemsPerPage);

        // Hide all rows first
        allRows.forEach(function(row) {
            row.style.display = 'none';
        });

        // Show current page rows
        var startIdx = (currentPage - 1) * itemsPerPage;
        var endIdx = Math.min(startIdx + itemsPerPage, filteredRows.length);

        for (var i = startIdx; i < endIdx; i++) {
            filteredRows[i].style.display = 'grid';
        }

        // Update pagination info
        var startEl = document.getElementById('page-start');
        var endEl = document.getElementById('page-end');
        var totalEl = document.getElementById('total-count');

        if (startEl) startEl.textContent = filteredRows.length > 0 ? startIdx + 1 : 0;
        if (endEl) endEl.textContent = endIdx;
        if (totalEl) totalEl.textContent = filteredRows.length;

        // Update buttons
        var prevBtn = document.getElementById('prev-page');
        var nextBtn = document.getElementById('next-page');

        if (prevBtn) {
            prevBtn.disabled = currentPage === 1;
            prevBtn.onclick = function() {
                if (currentPage > 1) {
                    currentPage--;
                    updatePagination();
                }
            };
        }

        if (nextBtn) {
            nextBtn.disabled = currentPage >= totalPages || filteredRows.length === 0;
            nextBtn.onclick = function() {
                if (currentPage < totalPages) {
                    currentPage++;
                    updatePagination();
                }
            };
        }

        // Update page numbers
        var numbersContainer = document.getElementById('pagination-numbers');
        if (numbersContainer) {
            numbersContainer.innerHTML = '';
            for (var p = 1; p <= Math.min(totalPages, 5); p++) {
                var btn = document.createElement('button');
                btn.className = 'ev-pagination-number';
                if (p === currentPage) btn.classList.add('active');
                btn.textContent = p;
                btn.onclick = (function(page) {
                    return function() {
                        currentPage = page;
                        updatePagination();
                    };
                })(p);
                numbersContainer.appendChild(btn);
            }
        }
    }

    // Initialize on DOM ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initTickets);
    } else {
        initTickets();
    }
})();
</script>

    <div class="modal modal-blur fade ev-ticket-modal" id="create-ticket" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="ev-modal-header">
                    <h5 data-i18n-user-ticket="modal_title">Tạo yêu cầu hỗ trợ</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="ev-modal-body">
                    <div class="ev-form-field">
                        <label class="ev-form-label" data-i18n-user-ticket="label_type">Loại yêu cầu</label>
                        <select id="ticket-type" class="ev-form-select">
                            <option value="" data-i18n-user-ticket="placeholder_type">Vui lòng chọn loại yêu cầu</option>
                            <option value="howto" data-i18n-user-ticket="option_howto">Hướng dẫn sử dụng</option>
                            <option value="billing" data-i18n-user-ticket="option_billing">Thanh toán & Hóa đơn</option>
                            <option value="account" data-i18n-user-ticket="option_account">Quản lý tài khoản</option>
                            <option value="other" data-i18n-user-ticket="option_other">Vấn đề khác</option>
                        </select>
                    </div>
                    <div class="ev-form-field">
                        <label class="ev-form-label" data-i18n-user-ticket="label_title">Tiêu đề</label>
                        <input id="ticket-title" type="text" class="ev-form-control" data-i18n-user-ticket-ph="placeholder_title" placeholder="Nhập tiêu đề yêu cầu">
                    </div>
                    <div class="ev-form-field">
                        <label class="ev-form-label" data-i18n-user-ticket="label_comment">Mô tả chi tiết</label>
                        <textarea id="ticket-comment" class="ev-form-control ev-form-textarea" rows="5" data-i18n-user-ticket-ph="placeholder_comment" placeholder="Vui lòng mô tả chi tiết vấn đề hoặc yêu cầu của bạn..."></textarea>
                    </div>
                </div>
                <div class="ev-modal-footer">
                    <button type="button" class="ev-btn ev-btn-cancel" data-bs-dismiss="modal" data-i18n-user-ticket="btn_cancel">Hủy bỏ</button>
                    <button id="create-ticket-button" class="ev-btn ev-btn-primary"
                            hx-post="/user/ticket" hx-swap="none" hx-on::after-request="if(event.detail.successful) this.closest('.modal').querySelector('.btn-close').click()"
                            hx-vals='js:{
                            title: document.getElementById("ticket-title").value,
                            comment: document.getElementById("ticket-comment").value,
                            type: document.getElementById("ticket-type").value }'
                            data-i18n-user-ticket="btn_submit">Gửi yêu cầu</button>
                </div>
            </div>
        </div>
    </div>

{include file='user/footer.tpl'}
