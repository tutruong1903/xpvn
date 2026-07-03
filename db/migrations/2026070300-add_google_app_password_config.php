<?php

declare(strict_types=1);

use App\Interfaces\MigrationInterface;
use App\Services\DB;

return new class() implements MigrationInterface {
    public function up(): int
    {
        DB::getPdo()->exec("
            INSERT INTO `config` (`item`, `value`, `class`, `is_public`, `type`, `default`, `mark`)
            VALUES
                ('google_app_password_username', '', 'email', 0, 'string', '', 'Google App Password Username (Gmail)'),
                ('google_app_password_password', '', 'email', 0, 'string', '', 'Google App Password'),
                ('google_app_password_sender_name', '', 'email', 0, 'string', '', 'Google App Password Sender Name')
        ");

        return 2026070300;
    }

    public function down(): int
    {
        DB::getPdo()->exec("
            DELETE FROM `config` WHERE `item` IN (
                'google_app_password_username',
                'google_app_password_password',
                'google_app_password_sender_name'
            )
        ");

        return 2026051000;
    }
};
