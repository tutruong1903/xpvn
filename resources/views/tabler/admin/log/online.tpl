{include file='admin/header.tpl'}

<link href="/assets/css/admin/log-index.css{asset_ver path="/assets/css/admin/log-index.css"}" rel="stylesheet"/>

<div class="container-xl">
    <!-- Page Header -->
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.log.online.title">在线IP</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.log.online.subtitle">查看现在在线的用户IP</p>
        </div>
    </div>
</div>

<div class="page-body pt-0">
    <div class="container-xl">
        <div class="lmn-table-card">
            <table id="data-table" class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                    {foreach $details['field'] as $key => $value}
                        <th data-i18n="admin.log.fields.{$key}">{$value}</th>
                    {/foreach}
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

{include file='datatable.tpl'}

<script>
    tableConfig.serverSide = true;
    tableConfig.ajax = {
        url: '/admin/online/ajax',
        type: 'POST',
        dataSrc: 'onlines.data'
    };
    tableConfig.order = [
        [0, 'desc']
    ];
    tableConfig.columnDefs = [
        {
            orderable: false,
            targets: [0, 3, 5]
        },
    ];

    let table = new DataTable('#data-table', tableConfig);

    function loadTable() {
        table;
    }

    loadTable();
</script>

{include file='admin/footer.tpl'}
