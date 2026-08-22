#!/bin/bash

# Ждем 1 секунд, чтобы Noctalia и системный трей гарантированно прогрузились
sleep 1

# Запускаем приложения по их абсолютным путям, направляя все ошибки в лог-файл
env QT_QPA_PLATFORM=xcb /usr/local/sbin/AmneziaVPN >/tmp/amnezia-autostart.log 2>&1 &
/home/den/Soft/Telegram/Telegram >/tmp/Telegram-autostart.log 2>&1 &
