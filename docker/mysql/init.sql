-- Disable strict mode for SSPanel compatibility
SET GLOBAL sql_mode = '';
SET SESSION sql_mode = '';

-- The database 'sspanel' is already created by MARIADB_DATABASE env var.
-- Create the 'gotheme' database for GoPassThemeForSSPanel and grant shared user access.
CREATE DATABASE IF NOT EXISTS gotheme CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON gotheme.* TO 'sspanel'@'%';
FLUSH PRIVILEGES;
