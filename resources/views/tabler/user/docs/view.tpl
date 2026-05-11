{include file='user/header.tpl'}

<div class="docs-view-wrapper">
    <div class="container-xl">

        <!-- Page header -->
        <div class="docs-view-header">
            <h1 class="docs-view-title">{$doc->title}</h1>
            <div class="docs-view-meta">
                <i class="ti ti-calendar docs-view-meta-icon"></i>
                <span data-i18n-user-docs="view_published">Ngày đăng:</span>
                <span>{$doc->date}</span>
            </div>
        </div>

        <!-- Content card -->
        <div class="docs-view-card">
            <div class="docs-view-content">
                {$doc->content}
            </div>
        </div>

    </div><!-- /.container-xl -->
</div><!-- /.docs-view-wrapper -->

{include file='user/footer.tpl'}
