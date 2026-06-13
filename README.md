# docker

Домашнее задание по Docker и bash.

Проект генерирует CSV-файл с данными о товарах, а потом делает HTML-отчет по этим данным.

## Структура

```text
generator/      генератор data.csv
reporter/       скрипт для отчета report.html
data/           сюда сохраняются результаты
local_data/     папка для локальной проверки
run.sh          основной скрипт
```

## Запуск

Сначала нужно проверить, что Docker работает:

```bash
docker --version
```

Дальше можно запускать команды из корня проекта.

```bash
./run.sh build_generator
./run.sh run_generator
./run.sh build_reporter
./run.sh run_reporter
```

После этого в папке `data/` должны появиться файлы:

```text
data.csv
report.html
```

## Дополнительные команды

```bash
./run.sh create_local_data
./run.sh structure
./run.sh clear_data
./run.sh inside_generator
./run.sh inside_reporter
```
