#!/bin/sh

opkg update
opkg install python3
opkg install python3-pip
pip3 install python-telegram-bot --break-system-packages

wget -q -O /etc/init.d/telegram-bot https://raw.githubusercontent.com/iFHax/QWRT_V6.5/main/BOT/telegram-bot
chmod +x /etc/init.d/telegram-bot

wget -q -O /root/telegram-bot/telegram_bot.py https://raw.githubusercontent.com/iFHax/QWRT_V6.5/main/BOT/telegram_bot.py
chmod +x /root/telegram-bot/telegram_bot.py

/etc/init.d/telegram-bot enable
/etc/init.d/telegram-bot start
