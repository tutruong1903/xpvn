{include file='user/header.tpl'}

<script src="/assets/js/locales/user/docs/en_US.js{asset_ver path="/assets/js/locales/user/docs/en_US.js"}"></script>
<script src="/assets/js/locales/user/docs/vn_VN.js{asset_ver path="/assets/js/locales/user/docs/vn_VN.js"}"></script>
<script src="/assets/js/locales/user/docs/zh_CN.js{asset_ver path="/assets/js/locales/user/docs/zh_CN.js"}"></script>
<script src="/assets/js/locales/user/docs/zh_TW.js{asset_ver path="/assets/js/locales/user/docs/zh_TW.js"}"></script>
<script src="/assets/js/locales/user/docs/ja_JP.js{asset_ver path="/assets/js/locales/user/docs/ja_JP.js"}"></script>

<div class="docs-page-wrapper">
    <div class="container-xl">

        <!-- Page header -->
        <div class="docs-page-header">
            <h1 class="docs-page-title" data-i18n-user-docs="page_title">Tài liệu</h1>
            <p class="docs-page-subtitle" data-i18n-user-docs="page_subtitle">
                Hướng dẫn cài đặt, hướng dẫn sử dụng và các tài liệu kỹ thuật.
            </p>
        </div>

        <!-- Docs list -->
        <div class="row g-3">

            {foreach $docs as $doc}
            <div class="col-12 col-md-6">
                <a class="docs-card" href="/user/docs/{$doc->id}/view">
                    <div class="docs-card-icon">
                        <i class="ti ti-file-text"></i>
                    </div>
                    <div class="docs-card-body">
                        <div class="docs-card-title">{$doc->title}</div>
                        <div class="docs-card-date">{$doc->date}</div>
                    </div>
                    <i class="ti ti-arrow-right docs-card-arrow"></i>
                </a>
            </div>
            {/foreach}

            {if empty($docs)}
            <div class="col-12">
                <div class="docs-empty">
                    <div class="docs-empty-icon">
                        <i class="ti ti-file-off"></i>
                    </div>
                    <div class="docs-empty-title" data-i18n-user-docs="empty_title">Không có tài liệu</div>
                    <div data-i18n-user-docs="empty_subtitle">Hiện tại chưa có tài liệu nào.</div>
                </div>
            </div>
            {/if}

        </div><!-- /.row -->

    </div><!-- /.container-xl -->
</div><!-- /.docs-page-wrapper -->

{include file='user/footer.tpl'}

