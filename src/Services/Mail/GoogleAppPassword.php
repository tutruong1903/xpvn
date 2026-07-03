<?php

declare(strict_types=1);

namespace App\Services\Mail;

use App\Models\Config;
use Exception;
use PHPMailer\PHPMailer\PHPMailer;

final class GoogleAppPassword extends Base
{
    private PHPMailer $mail;

    /**
     * @throws Exception
     */
    public function __construct()
    {
        $configs = Config::getClass('email');

        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->Port = 587;
        $mail->SMTPAuth = true;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->CharSet = 'UTF-8';
        $mail->Username = $configs['google_app_password_username'] ?? '';
        $mail->Password = $configs['google_app_password_password'] ?? '';
        $mail->setFrom(
            $configs['google_app_password_username'] ?? '',
            $configs['google_app_password_sender_name'] ?? ''
        );

        $this->mail = $mail;
    }

    /**
     * @throws Exception
     */
    public function send($to, $subject, $body): void
    {
        $mail = $this->mail;
        $mail->addAddress($to);
        $mail->isHTML();
        $mail->Subject = $subject;
        $mail->Body = $body;

        $mail->send();
    }
}
