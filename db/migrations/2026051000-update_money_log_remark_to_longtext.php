<?php

declare(strict_types=1);

use App\Interfaces\MigrationInterface;
use App\Services\DB;

return new class() implements MigrationInterface {
    public function up(): int
    {
        DB::getPdo()->exec(
            "ALTER TABLE `user_money_log` MODIFY COLUMN `remark` longtext NOT NULL COMMENT '备注(JSON多语言)'"
        );

        return 2026051000;
    }

    public function down(): int
    {
        DB::getPdo()->exec(
            "ALTER TABLE `user_money_log` MODIFY COLUMN `remark` text NOT NULL DEFAULT '' COMMENT '备注'"
        );

        return 2026050900;
    }
};
