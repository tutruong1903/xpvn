{include file='admin/header.tpl'}

<link href="/assets/css/admin/llm.css{asset_ver path="/assets/css/admin/llm.css"}" rel="stylesheet"/>

<div class="container-xl">
    <div class="lmn-page-header">
        <div class="lmn-page-header__content">
            <h2 class="lmn-page-title" data-i18n="admin.llm.index.title">AI / LLM</h2>
            <p class="lmn-page-subtitle" data-i18n="admin.llm.index.subtitle">设置站点的大型语言模型服务</p>
        </div>
        <div class="lmn-page-header__actions">
            <button id="save-setting" class="lmn-btn-primary">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;">save</span>
                <span data-i18n="admin.llm.index.save_btn">保存</span>
            </button>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="lmn-billing-grid">

            <div class="lmn-billing-tabs">
                <button class="lmn-billing-tab-btn is-active" data-tab="backend">
                    <span data-i18n="admin.llm.index.tab_backend">设置</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="openai">
                    <span>OpenAI</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="google-ai">
                    <span>Google AI</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="vertex-ai">
                    <span>Vertex AI</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="huggingface">
                    <span>Hugging Face</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="cf-workers-ai">
                    <span>Cloudflare Workers AI</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="anthropic">
                    <span>Anthropic</span>
                </button>
                <button class="lmn-billing-tab-btn" data-tab="aws-bedrock">
                    <span>AWS Bedrock</span>
                </button>
            </div>

            <div class="lmn-billing-content">

                <!-- Backend Panel -->
                <div class="lmn-billing-panel is-active" data-panel="backend">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">smart_toy</span>
                            <h2 class="lmn-edit-card-title" data-i18n="admin.llm.index.tab_backend">设置</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.backend">Backend</label>
                                <select id="llm_backend" class="lmn-edit-select">
                                    <option value="" {if $settings['llm_backend'] === ''}selected{/if} data-i18n="admin.llm.index.backend_none">None</option>
                                    <option value="openai" {if $settings['llm_backend'] === 'openai'}selected{/if}>OpenAI</option>
                                    <option value="google-ai" {if $settings['llm_backend'] === 'google-ai'}selected{/if}>Google AI</option>
                                    <option value="vertex-ai" {if $settings['llm_backend'] === 'vertex-ai'}selected{/if}>Vertex AI</option>
                                    <option value="huggingface" {if $settings['llm_backend'] === 'huggingface'}selected{/if}>Hugging Face</option>
                                    <option value="cf-workers-ai" {if $settings['llm_backend'] === 'cf-workers-ai'}selected{/if}>Cloudflare Workers AI</option>
                                    <option value="anthropic" {if $settings['llm_backend'] === 'anthropic'}selected{/if}>Anthropic</option>
                                    <option value="aws-bedrock" {if $settings['llm_backend'] === 'aws-bedrock'}selected{/if}>AWS Bedrock</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- OpenAI Panel -->
                <div class="lmn-billing-panel" data-panel="openai">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">key</span>
                            <h2 class="lmn-edit-card-title">OpenAI</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.api_key">API Key</label>
                                <input id="openai_api_key" type="text" class="lmn-edit-input"
                                       value="{$settings['openai_api_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.model_id">Model ID</label>
                                <input id="openai_model_id" type="text" class="lmn-edit-input"
                                       value="{$settings['openai_model_id']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Google AI Panel -->
                <div class="lmn-billing-panel" data-panel="google-ai">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">key</span>
                            <h2 class="lmn-edit-card-title">Google AI</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.api_key">API Key</label>
                                <input id="google_ai_api_key" type="text" class="lmn-edit-input"
                                       value="{$settings['google_ai_api_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.model_id">Model ID</label>
                                <input id="google_ai_model_id" type="text" class="lmn-edit-input"
                                       value="{$settings['google_ai_model_id']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Vertex AI Panel -->
                <div class="lmn-billing-panel" data-panel="vertex-ai">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">key</span>
                            <h2 class="lmn-edit-card-title">Vertex AI</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.access_token">Access Token</label>
                                <input id="vertex_ai_access_token" type="text" class="lmn-edit-input"
                                       value="{$settings['vertex_ai_access_token']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.location">Location</label>
                                <input id="vertex_ai_location" type="text" class="lmn-edit-input"
                                       value="{$settings['vertex_ai_location']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.project_id">Project ID</label>
                                <input id="vertex_ai_project_id" type="text" class="lmn-edit-input"
                                       value="{$settings['vertex_ai_project_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.model_id">Model ID</label>
                                <input id="vertex_ai_model_id" type="text" class="lmn-edit-input"
                                       value="{$settings['vertex_ai_model_id']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Hugging Face Panel -->
                <div class="lmn-billing-panel" data-panel="huggingface">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">key</span>
                            <h2 class="lmn-edit-card-title">Hugging Face</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.api_key">API Key</label>
                                <input id="huggingface_api_key" type="text" class="lmn-edit-input"
                                       value="{$settings['huggingface_api_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.endpoint_url">Endpoint URL</label>
                                <input id="huggingface_endpoint_url" type="text" class="lmn-edit-input"
                                       value="{$settings['huggingface_endpoint_url']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Cloudflare Workers AI Panel -->
                <div class="lmn-billing-panel" data-panel="cf-workers-ai">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">key</span>
                            <h2 class="lmn-edit-card-title">Cloudflare Workers AI</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.account_id">Account ID</label>
                                <input id="cf_workers_ai_account_id" type="text" class="lmn-edit-input"
                                       value="{$settings['cf_workers_ai_account_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.api_token">API Token</label>
                                <input id="cf_workers_ai_api_token" type="text" class="lmn-edit-input"
                                       value="{$settings['cf_workers_ai_api_token']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.model_id">Model ID</label>
                                <input id="cf_workers_ai_model_id" type="text" class="lmn-edit-input"
                                       value="{$settings['cf_workers_ai_model_id']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Anthropic Panel -->
                <div class="lmn-billing-panel" data-panel="anthropic">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">key</span>
                            <h2 class="lmn-edit-card-title">Anthropic</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.api_key">API Key</label>
                                <input id="anthropic_api_key" type="text" class="lmn-edit-input"
                                       value="{$settings['anthropic_api_key']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.model_id">Model ID</label>
                                <input id="anthropic_model_id" type="text" class="lmn-edit-input"
                                       value="{$settings['anthropic_model_id']}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- AWS Bedrock Panel -->
                <div class="lmn-billing-panel" data-panel="aws-bedrock">
                    <div class="lmn-edit-card">
                        <div class="lmn-edit-card-header">
                            <span class="material-symbols-outlined lmn-edit-card-icon">key</span>
                            <h2 class="lmn-edit-card-title">AWS Bedrock</h2>
                        </div>
                        <div class="lmn-edit-fields">
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.access_key_id">Access Key ID</label>
                                <input id="aws_bedrock_access_key_id" type="text" class="lmn-edit-input"
                                       value="{$settings['aws_bedrock_access_key_id']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.access_key_secret">Access Key Secret</label>
                                <input id="aws_bedrock_access_key_secret" type="text" class="lmn-edit-input"
                                       value="{$settings['aws_bedrock_access_key_secret']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.region">Region</label>
                                <input id="aws_bedrock_region" type="text" class="lmn-edit-input"
                                       value="{$settings['aws_bedrock_region']}">
                            </div>
                            <div class="lmn-edit-field">
                                <label class="lmn-edit-label" data-i18n="admin.llm.index.model_id">Model ID</label>
                                <input id="aws_bedrock_model_id" type="text" class="lmn-edit-input"
                                       value="{$settings['aws_bedrock_model_id']}">
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
(function () {
    // Tab switching
    document.querySelectorAll('.lmn-billing-tab-btn').forEach(function (btn) {
        btn.addEventListener('click', function () {
            document.querySelectorAll('.lmn-billing-tab-btn').forEach(function (b) { b.classList.remove('is-active'); });
            document.querySelectorAll('.lmn-billing-panel').forEach(function (p) { p.classList.remove('is-active'); });
            btn.classList.add('is-active');
            var panel = document.querySelector('.lmn-billing-panel[data-panel="' + btn.dataset.tab + '"]');
            if (panel) panel.classList.add('is-active');
        });
    });

    // Save
    document.getElementById('save-setting').addEventListener('click', function () {
        var data = {};
        {foreach $update_field as $key}
        var _el_{$key} = document.getElementById('{$key}');
        if (_el_{$key}) { data['{$key}'] = _el_{$key}.value; }
        {/foreach}
        fetch('/admin/setting/llm', {
            method: 'POST',
            headers: {ldelim}'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest'{rdelim},
            body: JSON.stringify(data),
        }).then(function (r) { return r.json(); }).then(function (res) {
            if (res.ret === 1) {
                document.getElementById('success-message').textContent = res.msg;
                (new bootstrap.Modal(document.getElementById('success-dialog'))).show();
            } else {
                document.getElementById('fail-message').textContent = res.msg;
                (new bootstrap.Modal(document.getElementById('fail-dialog'))).show();
            }
        });
    });
}());
</script>

{include file='admin/footer.tpl'}
