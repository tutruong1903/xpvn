{include file='user/header.tpl'}

<link href="/assets/css/user/detect.css{asset_ver path="/assets/css/user/detect.css"}" rel="stylesheet"/>

<div class="page-body">
    <div class="container-xl">

        <!-- Page Header -->
        <div class="detect-page-header">
            <div class="detect-page-header__content">
                <h2 class="detect-page-title" data-i18n="user.detect.log_page_title">审计记录</h2>
                <p class="detect-page-subtitle" data-i18n="user.detect.log_page_subtitle">系统中所有审计记录</p>
            </div>
        </div>

        <!-- Log Table -->
        <div class="detect-table-card">
            <div class="detect-table-card__header">
                <h3 class="detect-table-card__title" data-i18n="user.detect.log_table_title">记录列表</h3>
            </div>

            <div class="table-responsive">
                <table class="table detect-table-card">
                    <thead>
                        <tr>
                            <th data-i18n="user.detect.log_col_id">事件ID</th>
                            <th data-i18n="user.detect.log_col_node_id">节点ID</th>
                            <th data-i18n="user.detect.log_col_node_name">节点名称</th>
                            <th data-i18n="user.detect.log_col_rule_id">规则ID</th>
                            <th data-i18n="user.detect.log_col_rule_name">名称</th>
                            <th data-i18n="user.detect.log_col_desc">描述</th>
                            <th data-i18n="user.detect.log_col_regex">正则表达式</th>
                            <th data-i18n="user.detect.log_col_type">类型</th>
                            <th data-i18n="user.detect.log_col_time">时间</th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $logs|count > 0}
                            {foreach $logs as $log}
                                <tr>
                                    <td><span class="detect-rule-id">#{$log->id}</span></td>
                                    <td><span class="detect-rule-id">{$log->node_id}</span></td>
                                    <td><span class="detect-rule-name">{$log->node_name}</span></td>
                                    <td><span class="detect-rule-id">{$log->list_id}</span></td>
                                    <td><span class="detect-rule-name">{$log->rule->name}</span></td>
                                    <td><p class="detect-rule-desc" title="{$log->rule->text}">{$log->rule->text}</p></td>
                                    <td><span class="detect-rule-regex" title="{$log->rule->regex}">{$log->rule->regex}</span></td>
                                    <td><span class="detect-type-badge detect-type-badge--hex">{$log->rule->type}</span></td>
                                    <td><span class="money-time">{$log->datetime}</span></td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr>
                                <td colspan="9">
                                    <div class="detect-empty-state">
                                        <div class="detect-empty-state__icon">
                                            <span class="material-symbols-outlined">manage_search</span>
                                        </div>
                                        <h4 class="detect-empty-state__title" data-i18n="user.detect.log_empty_title">暂无审计记录</h4>
                                        <p class="detect-empty-state__desc" data-i18n="user.detect.log_empty_desc">您的账户暂无审计碰撞记录。</p>
                                    </div>
                                </td>
                            </tr>
                        {/if}
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>

{include file='user/footer.tpl'}
