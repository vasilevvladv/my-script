# Репозиторий содержит несколько примеров скриптов автоматизации

### Папка bash1
Содержит пример скрипта выполняющего резервное копирование. Резервное копирование выполняется 
в установленное время - 2 часа ночи, бэкапы старше 10 дней удаляются.

### Папка tf1
Содержит скрипт создания репозитория на GitLab c помощью Terraform.
Скрипт создает новый репозиторий Gitlab, добавляется ssh ключ для работы с репозиторием.

### Папка tf2
Содержит скрипт создания виртуальной машины на DigitalOcean c помощью Terraform.

### Папка tf3
Содержит скрипт создания виртуальной машины на DigitalOcean c помощью Terraform.
В отличие от предыдущего скрипта для получения ключа используется не Data Source,
а API DigitalOcean.

### Папка tf4
Содержит скрипт создания двух виртуальных машин на DigitalOcean c помощью Terraform.
Для каждой из машин настраивается A запись DNS в облаке AWS в сервисе Route53


