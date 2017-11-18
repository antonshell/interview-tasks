# Posts - Likes

Вам поступила задача:
Необходимо создать общую ленту новостей для пользователей с возможностью оценки постов в ленте.
Лента должна иметь фильтр по категориям. Любой пользователь может поставить "лайк" или отменить его. Необходимо предусмотреть возможность просмотра списка всех оценивших пост пользователей. Ограничение на размер хранения контента одного поста - 243 байта.
Предложите структуру базы данных MySQL, позволяющую реализовать данную задачу. Напишите базовый модуль на PHP, реализующий функции вывода новостей, добавление нового поста в ленту, установку и отмену "лайка" на новости.


# Solve

Implemented very basic app with plain php. Usage:

1 . Edit _bootstrap.php, set database connection

```
_bootstrap.php
```

2 . Upload database dump 

```
fotostrana_likes.sql
```

3 . Open index.php in browser

# Demo


See [**demo**][1] for more details

[1]: http://demo.antonshell.me/posts-likes/

<p align="center">
    <a href="http://demo.antonshell.me/posts-likes/" target="_blank">
        <img src="http://demo.antonshell.me/images/posts-likes.jpg" alt="egrul-nalog-parser" />
    </a>
</p>