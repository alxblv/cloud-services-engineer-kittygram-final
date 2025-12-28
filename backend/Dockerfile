# Данный Dockerfile предназначен для сборки и запуска приложения на основе Python
# there would be no problems with PyYaml version (see requirements) if we don't use alpine-based image
FROM python:3.10 

# Устанавливаем переменную окружения PYTHONUNBUFFERED, чтобы отключить буферизацию вывода
ENV PYTHONUNBUFFERED=1

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /code

# Копируем все файлы приложения в контейнер
COPY . .

# The headers or library files could not be found for zlib,
# a required dependency when compiling Pillow from source
# from https://stackoverflow.com/a/78593745
# this is not required when we don't use alpine-based image
# RUN apk add build-base zlib-dev jpeg-dev

# Our answer to "A new release of pip is available"
RUN pip install --upgrade pip --root-user-action=ignore

# Выполняем установку зависимостей, указанных в файле requirements.txt
RUN pip install -r requirements.txt --root-user-action=ignore

# Открываем порт 8000 для доступа к приложению
EXPOSE 8000

# Собрали все действия в один скрипт
ADD migrate_collect_static_run_server.sh WORKDIR/

# Запускаем миграции, собираем статику и поднимаем сервер
CMD ["sh", "migrate_collect_static_run_server.sh"]