#!/bin/bash
set -e

echo "========================================="
echo "  SSPanel-UIM Docker Setup"
echo "========================================="

# Wait for DB to be fully ready
echo "[1/5] Waiting for database..."
max_retries=30
count=0
until php -r "
    \$pdo = new PDO('mysql:host=db;port=3306;dbname=sspanel', 'sspanel', 'sspanel');
    echo 'OK';
" 2>/dev/null; do
    count=$((count + 1))
    if [ $count -ge $max_retries ]; then
        echo "ERROR: Database not available after ${max_retries} retries"
        exit 1
    fi
    echo "  Waiting... ($count/$max_retries)"
    sleep 2
done
echo "  Database is ready!"

# Run composer install if vendor/ is missing
if [ ! -d "vendor" ]; then
    echo "[2/5] Installing composer dependencies..."
    composer install --no-dev --optimize-autoloader --no-interaction
else
    echo "[2/5] Dependencies already installed, skipping."
fi

# Check if tables exist (migration needed?)
TABLE_COUNT=$(php -r "
    \$pdo = new PDO('mysql:host=db;port=3306;dbname=sspanel', 'sspanel', 'sspanel');
    \$result = \$pdo->query('SHOW TABLES');
    echo \$result->rowCount();
")

if [ "$TABLE_COUNT" = "0" ]; then
    echo "[3/5] Running initial migration (new database)..."
    php xcat Migration new
    php xcat Migration latest
else
    echo "[3/5] Database already has tables, running latest migration..."
    php xcat Migration latest
fi

# Import settings
echo "[4/5] Importing settings..."
php xcat Tool importSetting

# Seed 2 users (admin + user) if user table is empty
USER_COUNT=$(php -r "
    \$pdo = new PDO('mysql:host=db;port=3306;dbname=sspanel', 'sspanel', 'sspanel');
    \$result = \$pdo->query('SELECT COUNT(*) FROM user');
    echo \$result->fetchColumn();
" 2>/dev/null || echo "0")

if [ "$USER_COUNT" = "0" ]; then
    echo "[5/5] Seeding admin and user accounts..."

    # Create admin: admin@example.com / Admin@123456
    php xcat Tool createAdmin admin@example.com Admin@123456

    # Create regular user via PHP
    php -r "
        require __DIR__ . '/app/predefine.php';
        require __DIR__ . '/vendor/autoload.php';
        require __DIR__ . '/config/.config.php';

        use App\Services\Boot;
        use App\Models\User;
        use App\Utils\Hash;
        use App\Utils\Tools;
        use Ramsey\Uuid\Uuid;

        Boot::setTime();
        Boot::bootDb();

        \$user = new User();
        \$user->user_name = 'User';
        \$user->email = 'user@example.com';
        \$user->remark = '';
        \$user->pass = Hash::passwordHash('User@123456');
        \$user->passwd = Tools::genRandomChar(16);
        \$user->uuid = Uuid::uuid4();
        \$user->api_token = Tools::genRandomChar(32);
        \$user->port = 20002;
        \$user->u = 0;
        \$user->d = 0;
        \$user->transfer_enable = 10737418240; // 10GB
        \$user->ref_by = 0;
        \$user->is_admin = 0;
        \$user->reg_date = date('Y-m-d H:i:s');
        \$user->money = 0;
        \$user->im_type = 0;
        \$user->im_value = '';
        \$user->class = 0;
        \$user->class_expire = '2099-12-31 23:59:59';
        \$user->node_iplimit = 0;
        \$user->node_speedlimit = 0;
        \$user->theme = \$_ENV['theme'];
        \$user->locale = \$_ENV['locale'];
        \$user->method = 'aes-128-gcm';
        \$user->reg_ip = '127.0.0.1';
        \$user->last_login_time = time();

        if (\$user->save()) {
            echo 'Regular user created successfully.' . PHP_EOL;
        } else {
            echo 'Failed to create regular user.' . PHP_EOL;
        }
    "

    echo ""
    echo "========================================="
    echo "  Accounts created:"
    echo "  Admin: admin@example.com / Admin@123456"
    echo "  User:  user@example.com  / User@123456"
    echo "========================================="
else
    echo "[5/5] Users already exist ($USER_COUNT), skipping seed."
fi

echo ""
echo "Setup complete! Starting PHP-FPM..."
echo "Access the site at: http://localhost:8080"
echo ""

# Start php-fpm
exec php-fpm
