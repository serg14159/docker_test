# Пример многоэтапной сборки

## Как собрать и запустить

1. Убедитесь, что Docker установлен.
2. Клонируйте репозиторий:
    ```
    git clone <repository_url>
    cd <repository_directory>
    ```
3. Соберите Docker-образ:
    ```
    docker build -t hello_world .
    ```
4. Запустите приложение на C по умолчанию:
    ```
    docker run --rm hello_world
    ```
5. Запустите приложение на Go:
    ```
    docker run --rm hello_world /app/hello_go
    ```