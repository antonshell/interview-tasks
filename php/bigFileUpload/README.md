# Big File Upload

Написать скрипт для загрузки больших файлов(более 2гб) на сервер.

# Solve 

Use resumable.js library for this task

https://github.com/23/resumable.js

Full example here: https://github.com/antonshell/big-file-upload-example

# Usage


https://github.com/antonshell/big-file-upload-example


Серверная часть: см файл server.php
Клиентская часть: см файл resources/script.js
 
Использование: 
 
1. Расппаковать архив в папку доступную из web. Открыть index.html
2. Добавить файл, Начать загрузку
3. Появится progressbar, по окончании появится сообщение об успешной загрузке файла
 
Использовал библиотеку 
https://github.com/23/resumable.js
 
- Протестировал на локальной машине. 
- Тестировал с файлом размером 1.3GB(zip-архив)
- Проверял целостность файла после передачи
- Тестировал, загрузка продолжается после разрыва соединения(Google Chrome Dev Tools, см. скриншот  http://joxi.ru/823j9ROhJp9Y7m )
- Загрузка идет при низкой скорости соединения - 512 кбит/с, 2 мбит/с(Google Chrome Dev Tools, см. скриншот http://joxi.ru/v29JLkQu3DZn4A ) 