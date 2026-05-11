{include file='user/header.tpl'}

<link href="/assets/css/user/detect.css{asset_ver path="/assets/css/user/detect.css"}" rel="stylesheet"/>

<div class="page-body">
    <div class="container-xl">

        <!-- Page Header -->
        <div class="detect-page-header">
            <div class="detect-page-header__content">
                <h2 class="detect-page-title" data-i18n="user.detect.page_title">审计规则</h2>
                <p class="detect-page-subtitle" data-i18n="user.detect.page_subtitle">目前站点中所使用的审计规则</p>
            </div>
        </div>

        <!-- Rule Table -->
        <div class="detect-table-card">
            <div class="detect-table-card__header">
                <h3 class="detect-table-card__title" data-i18n="user.detect.table_title">规则列表</h3>
            </div>

            <div class="table-responsive">
                <table class="table detect-table-card">
                    <thead>
                        <tr>
                            <th data-i18n="user.detect.col_id">ID</th>
                            <th data-i18n="user.detect.col_name">名称</th>
                            <th data-i18n="user.detect.col_desc">描述</th>
                            <th data-i18n="user.detect.col_regex">正则表达式</th>
                            <th data-i18n="user.detect.col_type">类型</th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $rules|count > 0}
                            {foreach $rules as $rule}
                                <tr>
                                    <td><span class="detect-rule-id">#{$rule->id}</span></td>
                                    <td><span class="detect-rule-name">{$rule->name}</span></td>
                                    <td><p class="detect-rule-desc" title="{$rule->text}">{$rule->text}</p></td>
                                    <td><span class="detect-rule-regex" title="{$rule->regex}">{$rule->regex}</span></td>
                                    <td>
                                        {if $rule->type == 1}
                                            <span class="detect-type-badge detect-type-badge--plaintext">
                                                <span class="material-symbols-outlined">text_fields</span>
                                                <span data-i18n="user.detect.type_plaintext">数据包明文匹配</span>
                                            </span>
                                        {elseif $rule->type == 0}
                                            <span class="detect-type-badge detect-type-badge--hex">
                                                <span class="material-symbols-outlined">code</span>
                                                <span data-i18n="user.detect.type_hex">数据包 hex 匹配</span>
                                            </span>
                                        {/if}
                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr>
                                <td colspan="5">
                                    <div class="detect-empty-state">
                                        <div class="detect-empty-state__icon">
                                            <span class="material-symbols-outlined">policy</span>
                                        </div>
                                        <h4 class="detect-empty-state__title" data-i18n="user.detect.empty_title">暂无审计规则</h4>
                                        <p class="detect-empty-state__desc" data-i18n="user.detect.empty_desc">当前站点未配置任何审计规则。</p>
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
