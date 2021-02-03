--Consulta a) Ache os autores que que tiveram livros pegos para empréstimo mais de 5 vezes e os agrupe por editora.

SELECT l.editora, l.autores
FROM emprestado e INNER JOIN livro l ON e.isbn = l.isbn
WHERE l.autores in (SELECT l.autores
       		        FROM emprestado e INNER JOIN livro l ON e.isbn = l.isbn
                  	GROUP by l.autores
			HAVING COUNT(l.autores) >= 5)
GROUP BY l.editora, l.autores;

--Consulta b) Ache a média de empréstimos por data.

SELECT AVG(media) AS media
FROM (SELECT e.data, count(e.data) AS media
			FROM emprestado e
	  		where e.data >= '2020-01-26' and e.data <= '2023-01-26'
			GROUP BY data)a;

--Consulta c) Liste os membros maiores de 50 anos e que fizeram pelo menos 3 empréstimos.

SELECT DISTINCT m.nome
FROM  membro m,emprestado e
WHERE m.idade > 50 and (SELECT COUNT(*)
        FROM emprestado e
        WHERE e.num_membro = m.num_membro) >= 3;

--Consulta d) Ache os membros que fizeram mais empréstimos que o membro Smith.

SELECT e.num_membro, m.nome
FROM emprestado e JOIN membro m ON m.num_membro = e.num_membro
GROUP by e.num_membro, m.nome
HAVING COUNT (e.num_membro) > (SELECT COUNT(e.num_membro)
                              FROM emprestado e INNER JOIN membro m ON m.num_membro = e.num_membro
                              WHERE m.nome = 'Smith');

--Consulta e) Ache os membros que não fizeram empréstimos de livros do autor Abraham.

SELECT e.num_membro, m.nome
FROM emprestado e JOIN membro m ON e.num_membro = m.num_membro
GROUP by e.num_membro, m.num_membro
HAVING e.num_membro not in (SELECT num_membro
                          FROM emprestado e JOIN livro l ON e.isbn = l.isbn
                          WHERE l.autores = 'Abraham');