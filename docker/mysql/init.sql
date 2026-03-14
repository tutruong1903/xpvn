-- Disable strict mode for SSPanel compatibility
SET GLOBAL sql_mode = '';
SET SESSION sql_mode = '';

-- The database 'sspanel' is already created by MARIADB_DATABASE env var.
-- This file seeds the 2 sample users AFTER migration runs.
-- See docker/seed.sql for the INSERT statements.
