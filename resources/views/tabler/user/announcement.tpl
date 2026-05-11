{include file='user/header.tpl'}

<script src="/assets/js/locales/user/ann/en_US.js{asset_ver path="/assets/js/locales/user/ann/en_US.js"}"></script>
<script src="/assets/js/locales/user/ann/vn_VN.js{asset_ver path="/assets/js/locales/user/ann/vn_VN.js"}"></script>
<script src="/assets/js/locales/user/ann/zh_CN.js{asset_ver path="/assets/js/locales/user/ann/zh_CN.js"}"></script>
<script src="/assets/js/locales/user/ann/zh_TW.js{asset_ver path="/assets/js/locales/user/ann/zh_TW.js"}"></script>
<script src="/assets/js/locales/user/ann/ja_JP.js{asset_ver path="/assets/js/locales/user/ann/ja_JP.js"}"></script>

<div class="ann-page-wrapper">
    <div class="container-xl">

        <!-- Page header -->
        <div class="ann-page-header">
            <h1 class="ann-page-title" data-i18n-user-ann="page_title">Thông báo</h1>
            <p class="ann-page-subtitle" data-i18n-user-ann="page_subtitle">
                Các thông báo chính thức và cập nhật quan trọng từ đội ngũ quản trị.
            </p>
        </div>

        <!-- Announcement table -->
        <div class="ann-table-wrap">
            <table class="ann-table">
                <thead>
                    <tr>
                        <th class="ann-th ann-th-id" data-i18n-user-ann="col_id">ID</th>
                        <th class="ann-th ann-th-date" data-i18n-user-ann="col_date">Ngày</th>
                        <th class="ann-th ann-th-status" data-i18n-user-ann="col_status">Trạng thái</th>
                        <th class="ann-th" data-i18n-user-ann="col_content">Nội dung</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $anns as $ann}
                    <tr class="ann-tr{if $ann->status === 2} ann-tr-pinned{/if}">
                        <td class="ann-td ann-td-id">#{$ann->id}</td>
                        <td class="ann-td ann-td-date">{$ann->date}</td>
                        <td class="ann-td ann-td-status">
                            {if $ann->status === 2}
                                <span class="ann-badge ann-badge-pinned" data-i18n-user-ann="badge_pinned">GHIM</span>
                            {else}
                                <span class="ann-badge ann-badge-published" data-i18n-user-ann="badge_published">MỚI</span>
                            {/if}
                        </td>
                        <td class="ann-td ann-td-content">{$ann->content}</td>
                    </tr>
                    {/foreach}

                    {if empty($anns)}
                    <tr>
                        <td colspan="4">
                            <div class="ann-empty">
                                <div class="ann-empty-icon"><i class="ti ti-speakerphone"></i></div>
                                <div class="ann-empty-title" data-i18n-user-ann="empty_title">Không có thông báo</div>
                                <div data-i18n-user-ann="empty_subtitle">Hiện tại chưa có thông báo nào.</div>
                            </div>
                        </td>
                    </tr>
                    {/if}
                </tbody>
            </table>
        </div>

    </div><!-- /.container-xl -->
</div><!-- /.ann-page-wrapper -->

{include file='user/footer.tpl'}

