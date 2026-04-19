{include file='user/header.tpl'}

<div class="page-wrapper precision-ticket-view">
    
    {* Two Column Layout *}
    <div class="precision-layout">
        
        {* Left Sidebar - Ticket Info *}
        <aside class="precision-sidebar">
            <div class="precision-sidebar-content">
                
                {* Ticket Header *}
                <div class="precision-sidebar-header">
                    <div class="{if $ticket->status !== 'closed'}precision-badge{else}precision-badge closed{/if}" data-i18n-user-ticket="{if $ticket->status !== 'closed'}view_badge_active{else}view_badge_closed{/if}">
                        {if $ticket->status !== 'closed'}工单进行中{else}工单已关闭{/if}
                    </div>
                    <h2 class="precision-sidebar-title">#{$ticket->id}</h2>
                    <p class="precision-sidebar-subtitle">{$ticket->title}</p>
                </div>

                {* Metadata Cards *}
                <div class="precision-sidebar-meta">
                    {* Status *}
                    <div class="precision-meta-item">
                        <span class="precision-meta-label" data-i18n-user-ticket="view_status_label">工单状态</span>
                        <div class="precision-meta-value-inline">
                            <div class="precision-status-indicator"></div>
                            <span data-i18n-user-ticket="status_{$ticket->status}">{$ticket->status}</span>
                        </div>
                    </div>

                    {* Type *}
                    <div class="precision-meta-item">
                        <span class="precision-meta-label" data-i18n-user-ticket="view_type_label">工单类型</span>
                        <div class="precision-meta-value-inline">
                            <i class="ti ti-file-text"></i>
                            <span data-i18n-user-ticket="type_{$ticket->type}">{$ticket->type}</span>
                        </div>
                    </div>

                    {* Created Time *}
                    <div class="precision-meta-item">
                        <span class="precision-meta-label" data-i18n-user-ticket="view_created_label">工单开启时间</span>
                        <div class="precision-meta-value-block">
                            {$ticket->datetime}
                        </div>
                    </div>
                </div>

            </div>
        </aside>

        {* Right Chat Area *}
        <main class="precision-chat-area">
            
            {* Chat Header *}
            <div class="precision-chat-header">
                <div>
                    <h3 class="precision-chat-title" data-i18n-user-ticket="view_conversation_title">对话历史</h3>
                </div>
            </div>

            {* Messages Area *}
            <div class="precision-chat-messages">
                {* Timeline Event *}
                <div class="precision-timeline-event">
                    <div class="precision-timeline-badge">
                        <i class="ti ti-history"></i>
                        <span class="precision-timeline-text" data-i18n-user-ticket="view_ticket_opened">工单由客户开启</span>
                    </div>
                </div>

                {* Messages Loop *}
                {foreach $comments as $comment}
                <div class="precision-message">
                    <div class="precision-avatar precision-avatar-user">
                        <span class="precision-avatar-text">
                            {$comment->commenter_name|substr:0:1|upper}
                        </span>
                    </div>
                    <div class="precision-message-content">
                        <div class="precision-message-header">
                            <span class="precision-commenter-name">{$comment->commenter_name}</span>
                            <span class="precision-badge-sm" data-i18n-user-ticket="view_customer_badge">客户</span>
                            <span class="precision-timestamp">
                                <span data-i18n-user-ticket="view_replied_at">回复于</span> {$comment->datetime}
                            </span>
                        </div>
                        <div class="precision-message-body">
                            {$comment->comment}
                        </div>
                    </div>
                </div>
                {/foreach}
            </div>

            {* Reply Box - Sticky Bottom *}
            {if $ticket->status !== 'closed'}
            <div class="precision-chat-input">
                <textarea id="reply-comment-inline" class="precision-input-textarea" 
                          placeholder="请输入你的回复内容..." 
                          data-i18n-user-ticket-ph="view_textarea_placeholder"></textarea>
                <div class="precision-input-actions">
                    <div class="precision-input-tools"> 
                    </div>
                    <button id="reply-inline" class="precision-btn-send"
                            hx-post="/user/ticket/{$ticket->id}" hx-swap="none"
                            hx-vals='js:{ comment: document.getElementById("reply-comment-inline").value }'>
                        <i class="ti ti-send"></i>
                        <span data-i18n-user-ticket="view_btn_add_reply">发送</span>
                    </button>
                </div>
            </div>
            {/if}

        </main>

    </div>

</div>

{* Modal for Mobile fallback *}
<div class="modal modal-blur fade ev-ticket-modal" id="add-reply" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header ev-modal-header">
                <h5 class="modal-title" data-i18n-user-ticket="modal_add_reply_title">添加回复</h5>
                <button class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body ev-modal-body">
                <div class="mb-3">
                    <textarea id="reply-comment" class="form-control ev-form-control ev-form-textarea" 
                              rows="15" placeholder="请输入回复内容"
                              data-i18n-user-ticket-ph="modal_reply_placeholder"></textarea>
                </div>
            </div>
            <div class="modal-footer ev-modal-footer">
                <button type="button" class="ev-btn ev-btn-cancel" data-bs-dismiss="modal" data-i18n-user-ticket="btn_cancel">取消</button>
                <button id="reply" class="ev-btn ev-btn-primary" data-bs-dismiss="modal"
                        hx-post="/user/ticket/{$ticket->id}" hx-swap="none"
                        hx-vals='js:{ comment: document.getElementById("reply-comment").value }'>
                    <span data-i18n-user-ticket="modal_btn_reply">回复</span>
                </button>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Apply i18n translations for ticket view if available
    if (window.sspanelI18n && typeof window.sspanelI18n.applyTranslations === 'function') {
        window.sspanelI18n.applyTranslations(window.sspanelI18n.getLocale());
    }
});
</script>

{include file='user/footer.tpl'}
