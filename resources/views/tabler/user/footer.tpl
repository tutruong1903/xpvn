<div class="modal modal-blur fade" id="success-dialog" role="dialog">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-success"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-circle-check icon mb-2 text-green icon-lg" style="font-size:3.5rem;"></i>
                <p id="success-message" class="text-secondary" data-i18n-user-footer="success_default">成功</p>
            </div>
            <div class="modal-footer">
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <button type="button" id="success-confirm" class="btn w-100" data-bs-dismiss="modal"
                                    data-i18n-user-footer="btn_ok">
                                OK
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-blur fade" id="fail-dialog" role="dialog">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-danger"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-circle-x icon mb-2 text-danger icon-lg" style="font-size:3.5rem;"></i>
                <p id="fail-message" class="text-secondary" data-i18n-user-footer="fail_default">失败</p>
            </div>
            <div class="modal-footer">
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <a href="" class="btn btn-danger w-100" data-bs-dismiss="modal"
                               data-i18n-user-footer="btn_confirm">
                                Confirm
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<script src="//{$config['jsdelivr_url']}/npm/@tabler/core@latest/dist/js/tabler.min.js"></script>

<!-- Footer Scripts -->
<script src="/assets/js/user/footer/sidebar-toggle.js{asset_ver path="/assets/js/user/footer/sidebar-toggle.js"}"></script>
<script src="/assets/js/user/footer/sidebar-active.js{asset_ver path="/assets/js/user/footer/sidebar-active.js"}"></script>
<script src="/assets/js/user/footer/admin-panel.js{asset_ver path="/assets/js/user/footer/admin-panel.js"}"></script>
<script src="/assets/js/user/footer/toast.js{asset_ver path="/assets/js/user/footer/toast.js"}"></script>
<script src="/assets/js/user/footer/dialogs.js{asset_ver path="/assets/js/user/footer/dialogs.js"}"></script>
<script src="/assets/js/user/footer/clipboard.js{asset_ver path="/assets/js/user/footer/clipboard.js"}"></script>
<script src="/assets/js/user/footer/htmx-handler.js{asset_ver path="/assets/js/user/footer/htmx-handler.js"}"></script>
<script>console.table([['数据库查询', '执行时间'], ['{count($queryLog)} 次', '{$optTime} ms']])</script>

{include file='live_chat.tpl'}

{include file='telemetry.tpl'}

</body>

</html>
