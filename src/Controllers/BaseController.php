<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Models\User;
use App\Services\Auth;
use App\Services\I18n;
use App\Services\View;
use Smarty\Smarty;
use Twig\Environment;
use voku\helper\AntiXSS;
use function in_array;
use function microtime;
use function round;

abstract class BaseController
{
    /**
     * @var Smarty
     */
    protected Smarty $view;

    /**
     * @var Environment
     */
    protected Environment $twig;

    /**
     * @var User
     */
    protected User $user;

    /**
     * @var AntiXSS
     */
    protected AntiXSS $antiXss;

    /**
     * Construct page renderer
     */
    public function __construct()
    {
        $this->user = Auth::getUser();
        $this->antiXss = new AntiXSS();
    }

    /**
     * Get user's locale from cookie, user setting, or default
     */
    protected function getLocale(): string
    {
        $supportedLocales = I18n::getLocaleList();
        
        // 1. Try to get from cookie (set by frontend)
        if (isset($_COOKIE['sspanel_locale'])) {
            $cookieLocale = $_COOKIE['sspanel_locale'];
            if (in_array($cookieLocale, $supportedLocales)) {
                return $cookieLocale;
            }
        }
        
        // 2. Try to get from logged-in user's settings
        if ($this->user !== null && isset($this->user->locale)) {
            if (in_array($this->user->locale, $supportedLocales)) {
                return $this->user->locale;
            }
        }
        
        // 3. Fall back to environment default
        return $_ENV['locale'] ?? 'en_US';
    }

    /**
     * Get smarty
     */
    public function view(): Smarty
    {
        $this->view = View::getSmarty();

        if (View::$connection) {
            $this->view->assign(
                'queryLog',
                View::$connection
                    ->connection('default')
                    ->getQueryLog()
            )->assign(
                'optTime',
                round((microtime(true) - View::$beginTime) * 1000, 2)
            );
        }

        return $this->view;
    }

    /**
     * Get twig
     */
    public function twig(): Environment
    {
        $this->twig = View::getTwig();

        if (View::$connection) {
            $this->twig->addGlobal(
                'queryLog',
                View::$connection
                    ->connection('default')
                    ->getQueryLog()
            );
            $this->twig->addGlobal(
                'optTime',
                round((microtime(true) - View::$beginTime) * 1000, 2)
            );
        }

        return $this->twig;
    }
}
