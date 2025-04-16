#!/bin/bash

crontab -l > wp_cron

echo "*/10 * * * * DISPLAY=:0.0 $HOME/Pictures/Wallpaper/.cfg/wallpaper.sh" >> wp_cron

crontab wp_cron

rm wp_cron

service cron reload

