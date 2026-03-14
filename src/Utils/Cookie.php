<?php

declare(strict_types=1);

namespace App\Utils;

final class Cookie
{
    private static function isSecure(): bool
    {
        return str_starts_with($_ENV['baseUrl'] ?? '', 'https://');
    }

    public static function set(array $arg, int $time): void
    {
        $secure = self::isSecure();

        foreach ($arg as $key => $value) {
            setcookie($key, $value, $time, path: '/', secure: $secure, httponly: true);
        }
    }

    public static function setWithDomain(array $arg, int $time, string $domain): void
    {
        $secure = self::isSecure();
        // Strip port from domain since cookie domains must not include port
        $cookieDomain = explode(':', $domain)[0];

        foreach ($arg as $key => $value) {
            setcookie($key, $value, $time, path: '/', domain: $cookieDomain, secure: $secure, httponly: true);
        }
    }

    public static function get(string $key): string
    {
        return $_COOKIE[$key] ?? '';
    }
}
