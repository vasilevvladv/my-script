#!/bin/bash
# бекапы старше указного количества дней будут удалены 
REMOVE_AFTER=10
# Если директории для хранения нет то надо её создать
if ! [ -d /var/lib/backups/ ]; then mkdir -p /var/lib/backups/; fi
START_TIME=02:00
# Формируем время и дату 
LOCAL_START_TIME=$( date --date="TZ=\"Europe/Samara\" $START_TIME" +%H:%M )
NAME_FILE_DATA = $( date --date="TZ=\"Europe/Samara\" $START_TIME" +%Y-%m-%d )
#создаем задание на архивацию, удаляем старые архивы если архивация выполнена успешно
echo  "(tar -cvzf /var/lib/backups/etc-backup-$NAME_FILE_DATA.tar.gz /etc/*) &&
(find /var/lib/backups/  -name 'etc-backup-*' -type f -mtime +$REMOVE_AFTER -print -delete)" | at $LOCAL_START_TIME