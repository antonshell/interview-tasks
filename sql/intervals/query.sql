SET @rankFr=0;
SET @rankTo=0;

SELECT fr.id as 'FROM', t.id as 'TO' FROM
(SELECT
 @rankFr:=@rankFr+1 AS rank, id
FROM test
WHERE (id+1) NOT IN (SELECT id FROM test)
AND id NOT IN (SELECT MAX(id) FROM test)) fr
INNER JOIN
(SELECT
@rankTo:=@rankTo+1 AS rank, id
FROM test
WHERE (id-1) NOT IN (SELECT id FROM test)
AND id NOT IN (SELECT MIN(id) FROM test)) t
ON fr.rank = t.rank