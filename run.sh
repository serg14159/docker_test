#!/bin/bash

# Загрузка необходимых образов
echo "Загрузка образа mysql..."
docker pull mysql:5.7

echo "Загрузка образа httpd..."
docker pull httpd:2.4

# Создание Docker-сети
docker network create my_network

# Запуск контейнера с базой данных
docker run -d --name my_mysql --network my_network -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=mydb mysql:5.7

# Запуск контейнера с веб-приложением
docker run -d --name my_httpd --network my_network -p 8080:80 httpd:2.4

echo "Веб-приложение работает по адресу http://localhost:8080"