{include file='admin/header.tpl'}

    <div class="container-xl">
        <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
                    <h2 class="page-title">
                        <span class="home-title my-3" data-i18n="admin.invoice.view.title">账单</span> #{$invoice->id}
                    </h2>
                    <div class="page-pretitle">
                        <span class="home-subtitle" data-i18n="admin.invoice.view.subtitle">账单详情</span>
                    </div>
                </div>
                {if $invoice->status === 'unpaid'}
                    <div class="col-auto">
                        <div class="btn-list">
                            <button href="#" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#mark_paid_confirm_dialog">
                                <i class="icon ti ti-checklist"></i>
                                <span data-i18n="admin.invoice.view.mark_paid_btn">标记为支付</span>
                            </button>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
    <div class="page-body">
        <div class="container-xl">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title" data-i18n="admin.invoice.view.section_basic_info">基本信息</h3>
                </div>
                <div class="card-body">
                    <div class="datagrid">
                        <div class="datagrid-item">
                            <div class="datagrid-title" data-i18n="admin.invoice.view.label_user_id">提交用户</div>
                            <div class="datagrid-content">{$invoice->user_id}</div>
                        </div>
                        <div class="datagrid-item">
                            <div class="datagrid-title" data-i18n="admin.invoice.view.label_order_id">关联订单 ID</div>
                            <div class="datagrid-content">{$invoice->order_id}</div>
                        </div>
                        <div class="datagrid-item">
                            <div class="datagrid-title" data-i18n="admin.invoice.view.label_amount">账单金额</div>
                            <div class="datagrid-content">{$invoice->price}</div>
                        </div>
                        <div class="datagrid-item">
                            <div class="datagrid-title" data-i18n="admin.invoice.view.label_status">账单状态</div>
                            <div class="datagrid-content">{$invoice->status_text}</div>
                        </div>
                        <div class="datagrid-item">
                            <div class="datagrid-title" data-i18n="admin.invoice.view.label_create_time">创建时间</div>
                            <div class="datagrid-content">{$invoice->create_time}</div>
                        </div>
                        <div class="datagrid-item">
                            <div class="datagrid-title" data-i18n="admin.invoice.view.label_update_time">更新时间</div>
                            <div class="datagrid-content">{$invoice->update_time}</div>
                        </div>
                        <div class="datagrid-item">
                            <div class="datagrid-title" data-i18n="admin.invoice.view.label_pay_time">支付时间</div>
                            <div class="datagrid-content">{$invoice->pay_time}</div>
                        </div>
                        {if $invoice->status === 'paid_gateway'}
                            <div class="datagrid-item">
                                <div class="datagrid-title" data-i18n="admin.invoice.view.label_gateway_tradeno">支付网关单号</div>
                                <div class="datagrid-content">{$paylist->tradeno}</div>
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    <h3 class="card-title" data-i18n="admin.invoice.view.section_invoice_details">账单详情</h3>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="invoice_content_table" class="table table-vcenter card-table">
                            <thead>
                            <tr>
                                <th data-i18n="admin.invoice.view.label_item_name">名称</th>
                                <th data-i18n="admin.invoice.view.label_item_price">价格</th>
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
            </div>
        </div>
    </div>

    <div class="modal modal-blur fade" id="mark_paid_confirm_dialog" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" data-i18n="admin.invoice.view.modal_mark_paid_title">标记为支付</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <p data-i18n="admin.invoice.view.modal_mark_paid_confirm">
                            确认将此账单标记为支付？
                        <p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn me-auto" data-bs-dismiss="modal" data-i18n="admin.invoice.view.btn_cancel">取消</button>
                    <button id="confirm_mark_paid" type="button" class="btn btn-primary" data-bs-dismiss="modal" data-i18n="admin.invoice.view.btn_confirm">确认
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $("#confirm_mark_paid").click(function () {
            $.ajax({
                url: "/admin/invoice/{$invoice->id}/mark_paid",
                type: 'POST',
                dataType: "json",
                success: function (data) {
                    if (data.ret === 1) {
                        $('#success-message').text(data.msg);
                        $('#success-dialog').modal('show');
                    } else {
                        $('#fail-message').text(data.msg);
                        $('#fail-dialog').modal('show');
                    }
                }
            })
        });
    </script>

    {include file='admin/footer.tpl'}
