<?php

declare(strict_types=1);

namespace App\Controllers\Admin\Setting;

use App\Controllers\BaseController;
use App\Models\Config;
use App\Services\I18n;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;
use Smarty\Exception;

final class CronController extends BaseController
{
    private array $update_field;
    private array $settings;

    public function __construct()
    {
        parent::__construct();
        $this->update_field = Config::getItemListByClass('cron');
        $this->settings = Config::getClass('cron');
    }

    /**
     * @throws Exception
     */
    public function index(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        return $response->write(
            $this->view()
                ->assign('update_field', $this->update_field)
                ->assign('settings', $this->settings)
                ->fetch('admin/setting/cron.tpl')
        );
    }

    public function save(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $locale = $this->getLocale();
        $daily_job_hour = (int) $request->getParam('daily_job_hour');
        $daily_job_minute = (int) $request->getParam('daily_job_minute');

        if ($daily_job_hour < 0 || $daily_job_hour > 23) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_cron.hour_invalid', $locale),
            ]);
        }

        if ($daily_job_minute < 0 || $daily_job_minute > 59) {
            return $response->withJson([
                'ret' => 0,
                'msg' => I18n::trans('admin_cron.minute_invalid', $locale),
            ]);
        }

        foreach ($this->update_field as $item) {
            if ($item === 'daily_job_minute') {
                Config::set($item, $daily_job_minute - ($daily_job_minute % 5));
                continue;
            }

            if (! Config::set($item, $request->getParam($item))) {
                return $response->withJson([
                    'ret' => 0,
                    'msg' => I18n::trans('admin_cron.save_failed', $locale),
                ]);
            }
        }

        return $response->withJson([
            'ret' => 1,
            'msg' => I18n::trans('admin_cron.save_success', $locale),
        ]);
    }
}
