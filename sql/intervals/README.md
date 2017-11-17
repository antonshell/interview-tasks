# Intervals

Дано:

```
CREATE TABLE test (
  id INT NOT NULL PRIMARY KEY
);
```

```
INSERT INTO test (id) VALUES (1), (2), (3), (6), (8), (9), (12);
```

Задание: Написать SQL запрос который выведет все пропуски.

Результат:

```
FROM    | TO
3       | 6
6       | 8
9       | 12
```

# Solve

See ```data.sql``` and ```query.sql``` files for more details

Or see demo here: http://sqlfiddle.com/#!9/65b917/1