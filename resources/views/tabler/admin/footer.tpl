<div class="modal modal-blur fade" id="success-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-success"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-circle-check icon mb-2 text-green icon-lg" style="font-size:3.5rem;"></i>
                <p id="success-message" class="text-secondary" data-i18n="admin.dialog.success">成功</p>
            </div>
            <div class="modal-footer">
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <a id="success-confirm" href="" class="btn w-100" data-bs-dismiss="modal">
                                <span data-i18n="admin.dialog.ok">好</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-blur fade" id="fail-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-danger"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-circle-x icon mb-2 text-danger icon-lg" style="font-size:3.5rem;"></i>
                <p id="fail-message" class="text-secondary" data-i18n="admin.dialog.fail">失败</p>
            </div>
            <div class="modal-footer">
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <a href="" class="btn btn-danger w-100" data-bs-dismiss="modal">
                                <span data-i18n="admin.dialog.confirm">确认</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-blur fade" id="notice-dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-yellow"></div>
            <div class="modal-body text-center py-4">
                <i class="ti ti-alert-circle icon mb-2 text-yellow icon-lg" style="font-size:3.5rem;"></i>
                <p id="notice-message" class="text-secondary" data-i18n="admin.dialog.notice">注意</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn me-auto" data-bs-dismiss="modal">
                    <span data-i18n="admin.dialog.cancel">取消</span>
                </button>
                <button id="notice-confirm" type="button" class="btn btn-yellow" data-bs-dismiss="modal">
                    <span data-i18n="admin.dialog.confirm">确认</span>
                </button>
            </div>
        </div>
    </div>
</div>

<footer class="footer footer-transparent d-print-none">
    <div class="container-xl">
        <div class="row text-center align-items-center flex-row-reverse">
            <div class="col-lg-auto ms-lg-auto">
                <ul class="list-inline list-inline-dots mb-0">
                    <li class="list-inline-item">
                        Powered by <a href="/staff" class="link-secondary">SSPanel-UIM</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>
</div>
</div>
<!-- js -->
<script src="//{$config['jsdelivr_url']}/npm/@tabler/core@latest/dist/js/tabler.min.js"></script>

<!-- Admin Footer Scripts -->
<script src="/assets/js/admin/footer/sidebar-toggle.js{asset_ver path="/assets/js/admin/footer/sidebar-toggle.js"}"></script>
<script src="/assets/js/admin/footer/sidebar-active.js{asset_ver path="/assets/js/admin/footer/sidebar-active.js"}"></script>
<script src="/assets/js/admin/footer/admin-panel.js{asset_ver path="/assets/js/admin/footer/admin-panel.js"}"></script>
<script src="/assets/js/admin/footer/toast.js{asset_ver path="/assets/js/admin/footer/toast.js"}"></script>
<script src="/assets/js/admin/footer/dialogs.js{asset_ver path="/assets/js/admin/footer/dialogs.js"}"></script>
<script src="/assets/js/admin/footer/htmx-handler.js{asset_ver path="/assets/js/admin/footer/htmx-handler.js"}"></script>
<script>console.table([['数据库查询', '执行时间'], ['{count($queryLog)} 次', '{$optTime} ms']])</script>

{include file='telemetry.tpl'}

</body>

</html>
