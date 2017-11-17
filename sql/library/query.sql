SELECT b.name, COUNT(*) as 'authors_count'
FROM book_author ba
INNER JOIN book b ON b.id = ba.book_id
GROUP BY ba.book_id HAVING COUNT(*) = 3