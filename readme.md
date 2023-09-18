Задание ПРО

Развернуть спроектированную Вами БД «Библиотека» в docker, используя docker-compose.

Sql-cкрипт на создание таблиц должен выполняться при развертывании образа docker.

Результат выполнения задания необходимо выложить в github/gitlab и указать ссылку на Ваш репозиторий (репозиторий должен быть публичным).

В репозиторий необходимо внести следующие файлы:

    графическая структура файла БД,

    sql-cкрипт создание таблиц БД,

    файл docker-compose.

    Команды для Windows Powershell
1. Скачиваем образ Postgres
docker pull postgres
2. Пишем инструкции для docker-file
3. Собираем контейнер
docker build -t my-postgres .
4. Запускаем
docker run --name my-postgres-container -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d my-postgres
5.Проверяем
docker ps
6. В docker-файл добавляем команду
VOLUME data:/var/lib/postgressql/data

Docker-файл
# Используем официальный образ PostgreSQL
FROM postgres:latest
ENV POSTGRES_DB=database
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=password

# Копируем SQL-скрипт из абсолютного пути в контейнер
COPY biblioteka.sql /docker-entrypoint-initdb.d/biblioteka.sql
# Этот контейнер использует механизм хранения данных "volume"
# чтобы сохранить данные между перезапусками контейнера
VOLUME data:/var/lib/postgressql/data

Результат работы Docker-контейнера

PS C:\Users\Denis\Documents\1T\SQL\1T_DE_2.2_pro> docker remove my-postgres-container
my-postgres-container
PS C:\Users\Denis\Documents\1T\SQL\1T_DE_2.2_pro> docker run --name my-postgres-container -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d my-postgres
9102601c14e82695c97dc30861bc19f9e17495e0454cff9176df63f25001ec70
PS C:\Users\Denis\Documents\1T\SQL\1T_DE_2.2_pro> docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED      STATUS          PORTS      NAMES
2aacf730606d   87fa4ada3896   "docker-entrypoint.s…"   8 days ago   Up 30 minutes   5432/tcp   pedantic_williamson
PS C:\Users\Denis\Documents\1T\SQL\1T_DE_2.2_pro>
