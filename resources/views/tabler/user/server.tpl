{include file="user/header.tpl"}

<div class="server-page-wrapper">
    <div class="container-xl">

        <!-- Page header -->
        <div class="server-page-header">
            <div class="row align-items-center g-3">
                <div class="col">
                    <h1 class="server-page-title" data-i18n-user-server="page_title">Danh sách máy chủ</h1>
                    <p class="server-page-subtitle" data-i18n-user-server="page_subtitle">
                        Theo dõi trạng thái và kết nối đến các cụm máy chủ trong mạng lưới với tốc độ ánh sáng.
                    </p>
                </div>
            </div>
        </div>

    </div><!-- /.container-xl (header) -->

    <div class="page-body">
        <div class="container-xl">

            <!-- Server grid -->
            <div class="row row-deck row-cards" id="server-grid">

                {foreach $servers as $server}
                {assign var="sort_lower" value=$server['sort']|lower|replace:' ':'-'}
                <div class="col-xl-3 col-lg-3 col-md-6 server-card-col{if $user->class < $server['class']} is-locked{/if}"
                     data-status="{$server['online']}"
                     data-level="{$server['class']}">

                    <div class="server-card{if $user->class < $server['class']} is-locked{/if}">

                        <!-- Badge -->
                        {if $server['class'] === 0}
                            <span class="server-badge server-badge-free" data-i18n-user-server="badge_free">MIỄN PHÍ</span>
                        {else}
                            <span class="server-badge server-badge-premium" data-i18n-user-server="badge_premium">PREMIUM</span>
                        {/if}

                        <!-- Header: icon + name + status -->
                        <div class="server-card-header">
                            <div class="server-icon server-icon-{$sort_lower}">
                                {if $server['sort'] === 'Trojan'}
                                    <i class="ti ti-shield-check"></i>
                                {elseif $server['sort'] === 'Vmess' || $server['sort'] === 'VLESS'}
                                    <i class="ti ti-world-www"></i>
                                {elseif $server['sort'] === 'WireGuard'}
                                    <i class="ti ti-lock"></i>
                                {elseif $server['sort'] === 'TUIC'}
                                    <i class="ti ti-bolt"></i>
                                {elseif $server['sort'] === 'Shadowsocks' || $server['sort'] === 'Shadowsocks2022'}
                                    <i class="ti ti-eye-off"></i>
                                {else}
                                    <i class="ti ti-world"></i>
                                {/if}
                            </div>
                            <div class="min-w-0">
                                <div class="server-status
                                    {if $server['online'] === 1}server-status-online
                                    {elseif $server['online'] === -1}server-status-offline
                                    {else}server-status-new{/if}">
                                    <span class="server-status-dot"></span>
                                    <span {if $server['online'] === 1}data-i18n-user-server="status_online"
                                          {elseif $server['online'] === -1}data-i18n-user-server="status_offline"
                                          {else}data-i18n-user-server="status_new"{/if}>
                                        {if $server['online'] === 1}TRỰC TUYẾN
                                        {elseif $server['online'] === -1}NGOẠI TUYẾN
                                        {else}NODE MỚI{/if}
                                    </span>
                                </div>
                                <h3 class="server-name">{$server['name']}</h3>
                            </div>
                        </div>

                        <!-- Bandwidth -->
                        <div class="server-bandwidth">
                            <div class="server-bandwidth-label">
                                <span data-i18n-user-server="bandwidth_used">Băng thông đã dùng</span>
                                <span class="server-bandwidth-values ms-1">
                                    {$server['node_bandwidth']} / {$server['node_bandwidth_limit']}
                                </span>
                            </div>
                            <div class="server-bandwidth-bar">
                                <div class="server-bandwidth-bar-fill
                                    {if $server['node_bandwidth_pct'] >= 80}high
                                    {elseif $server['node_bandwidth_pct'] >= 50}medium{/if}"
                                     style="width: {$server['node_bandwidth_pct']}%">
                                </div>
                            </div>
                        </div>

                        <!-- Stats -->
                        <div class="server-stats">
                            <div>
                                <div class="server-stat-label" data-i18n-user-server="stat_latency">ĐỘ TRỄ</div>
                                <div class="server-stat-value">
                                    <span data-i18n-user-server="latency_na">--</span><span class="server-stat-unit">ms</span>
                                </div>
                            </div>
                            <div>
                                <div class="server-stat-label" data-i18n-user-server="stat_load">TẢI TRỌNG</div>
                                <div class="server-stat-value">
                                    {$server['node_bandwidth_pct']}<span class="server-stat-unit">%</span>
                                </div>
                            </div>
                        </div>

                        <!-- Protocol tags -->
                        <div class="server-tags">
                            <span class="server-tag">{$server['sort']}</span>

                            {if $server['connection_type'] === 2}
                                <span class="server-tag" data-i18n-user-server="tag_dual">Dual Stack</span>
                            {elseif $server['connection_type'] === 1}
                                <span class="server-tag" data-i18n-user-server="tag_ipv6">IPv6</span>
                            {/if}

                            {if $server['is_dynamic_rate']}
                                <span class="server-tag" data-i18n-user-server="tag_dynamic_rate">Động</span>
                            {/if}

                            {if $user->class < $server['class']}
                                <span class="server-tag server-tag-locked" data-i18n-user-server="tag_no_access">Chưa đủ cấp</span>
                                <a href="/user/product" class="server-tag server-tag-upgrade text-decoration-none"
                                   data-i18n-user-server="tag_upgrade">Nâng cấp</a>
                            {/if}
                        </div>

                    </div><!-- /.server-card -->
                </div><!-- /.col -->
                {/foreach}

                {if empty($servers)}
                <div class="col-12">
                    <div class="server-empty">
                        <div class="server-empty-icon">
                            <i class="ti ti-server-off"></i>
                        </div>
                        <div class="server-empty-title" data-i18n-user-server="empty_title">Không có máy chủ nào</div>
                        <div data-i18n-user-server="empty_subtitle">Không có máy chủ nào khớp với bộ lọc hiện tại.</div>
                    </div>
                </div>
                {/if}

            </div><!-- /#server-grid -->

        </div><!-- /.container-xl -->
    </div><!-- /.page-body -->

    {include file="user/footer.tpl"}
</div><!-- /.server-page-wrapper -->
