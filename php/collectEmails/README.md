# Collect Emails

Имеется таблица пользователей:

```
CREATE TABLE `users` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(32) NOT NULL,
`gender` tinyint(2) NOT NULL,
`email` varchar(1024) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;
```

В таблице более 100 млн записей, и она находится под нагрузкой в production (идут запросы на добавление / изменение / удаление).
В поле email может быть от одного до нескольких перечисленных через запятую адресов. Может быть пусто.
Напишите скрипт, который выведет список представленных в таблице почтовых доменов с количеством пользователей по каждому домену.

# Solution

Use chunked sql queries with limit.
See ```calculate.php``` for more details.

# Usage

1 . Edit _bootstrap.php, set database info

2 . Install dependencies

```
composer install
```

3 . Generate data. Warning, may take a lot of time

```
php generate.php
```

Database dump available here:
https://yadi.sk/d/tt6gNMOJ3PiRto


4 . Calculate emails

```
php calculate.php
```