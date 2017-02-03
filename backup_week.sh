#!/bin/sh
echo "*********************************************************"
echo "*******НАЧАЛО ЕЖЕНЕДЕЛЬНОГО РЕЗЕРВНОГО КОПИРОВАНИЯ*******"
echo "*********************************************************"
echo ""
echo "*********************************************************"
echo "*******ЭТАП 1. РЕЗЕРВНОЕ КОПИРОВАНИЕ ФАЙЛОВ САЙТОВ*******"
echo "*********************************************************"
TIME=`date +%Y-%m-%d-%H:%M`
WHAT=/home/www
WHERE=/backup/WEEK/www
COPY=/mnt/yadisk/VDS/backup/WEEK/www
echo "НАЧИНАЕТСЯ СОЗДАНИЕ БЭКАПА"
tar -cpzf $WHERE/$TIME.tgz $WHAT
echo "СОЗДАНИЕ БЭКАПА УСПЕШНО ЗАВЕРШЕНО"
cp $WHERE/$TIME.tgz $COPY
echo "ФАЙЛ БЭКАПА УСПЕШНО СКОПИРОВАН НА ЯНДЕКС.ДИСК"
find $WHERE -mmin +30 -print -delete
find $COPY -mtime +30 -print -delete
echo "СТАРЫЕ РЕЗЕРВНЫЕ КОПИИ УДАЛЕНЫ"
echo "*********************************************************"
echo "**********************КОНЕЦ ЭТАПА 1**********************"
echo "*********************************************************"
echo ""
echo "*********************************************************"
echo "*********ЭТАП 2. РЕЗЕРВНОЕ КОПИРОВАНИЕ ФАЙЛОВ БД*********"
echo "*********************************************************"
TIME=`date +%Y-%m-%d-%H:%M`
WHAT=/var/lib/mysql
WHERE=/backup/WEEK/mysql_files
COPY=/mnt/yadisk/VDS/backup/WEEK/mysql_files
echo "ОСТАНОВКА СЕРВИСА MYSQL"
service mysql stop
sleep 10s
echo "СЕРВИС MYSQL ОСТАНОВЛЕН"
echo "НАЧИНАЕТСЯ СОЗДАНИЕ БЭКАПА"
tar -cpzf $WHERE/$TIME.tgz $WHAT
echo "СОЗДАНИЕ БЭКАПА УСПЕШНО ЗАВЕРШЕНО"
service mysql start
echo "СЕРВИС MYSQL ЗАПУЩЕН"
cp $WHERE/$TIME.tgz $COPY
echo "ФАЙЛ БЭКАПА УСПЕШНО СКОПИРОВАН НА ЯНДЕКС.ДИСК"
find $WHERE -mmin +30 -print -delete
find $COPY -mtime +30 -print -delete
echo "СТАРЫЕ РЕЗЕРВНЫЕ КОПИИ УДАЛЕНЫ"
echo "*********************************************************"
echo "**********************КОНЕЦ ЭТАПА 2**********************"
echo "*********************************************************"
echo ""
echo "*********************************************************"
echo "*****ЭТАП 3.  РЕЗЕРВНОЕ КОПИРОВАНИЕ НАСТРОЕК СЕРВЕРА*****"
echo "*********************************************************"
TIME=`date +%Y-%m-%d-%H:%M`
WHAT=/etc
WHERE=/backup/WEEK/etc
COPY=/mnt/yadisk/VDS/backup/WEEK/etc
echo "НАЧИНАЕТСЯ СОЗДАНИЕ БЭКАПА"
tar -cpzf $WHERE/$TIME.tgz $WHAT
echo "СОЗДАНИЕ БЭКАПА УСПЕШНО ЗАВЕРШЕНО"
cp $WHERE/$TIME.tgz $COPY
echo "ФАЙЛ БЭКАПА УСПЕШНО СКОПИРОВАН НА ЯНДЕКС.ДИСК"
find $WHERE -mmin +30 -print -delete
find $COPY -mtime +30 -print -delete
echo "СТАРЫЕ РЕЗЕРВНЫЕ КОПИИ УДАЛЕНЫ"
echo "*********************************************************"
echo "**********************КОНЕЦ ЭТАПА 3**********************"
echo "*********************************************************"
echo""
echo "*********************************************************"
echo "*********ЭТАП 4.  РЕЗЕРВНОЕ КОПИРОВАНИЕ СКРИПТОВ*********"
echo "*********************************************************"
TIME=`date +%Y-%m-%d-%H:%M`
WHAT=/scripts
WHERE=/backup/WEEK/scripts
COPY=/mnt/yadisk/VDS/backup/WEEK/scripts
echo "НАЧИНАЕТСЯ СОЗДАНИЕ БЭКАПА"
tar -cpzf $WHERE/$TIME.tgz $WHAT
echo "СОЗДАНИЕ БЭКАПА УСПЕШНО ЗАВЕРШЕНО"
cp $WHERE/$TIME.tgz $COPY
echo "ФАЙЛ БЭКАПА УСПЕШНО СКОПИРОВАН НА ЯНДЕКС.ДИСК"
find $WHERE -mmin +30 -print -delete
find $COPY -mtime +30 -print -delete
echo "СТАРЫЕ РЕЗЕРВНЫЕ КОПИИ УДАЛЕНЫ"
echo "*********************************************************"
echo "**********************КОНЕЦ ЭТАПА 4**********************"
echo "*********************************************************"
echo ""
echo "*********************************************************"
echo "******ЕЖЕНЕДЕЛЬНОЕ РЕЗЕРВНОЕ КОПИРОВАНИЕ ЗАВЕРШЕНО*******"
echo "*********************************************************"
