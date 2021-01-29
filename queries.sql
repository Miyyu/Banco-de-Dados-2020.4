--Consulta d) Ache os membros que fizeram mais empréstimos que o membro Smith.

SELECT e.num_membro ,m.nome
FROM emprestado e JOIN membro m ON m.num_membro = e.num_membro
GROUP by e.num_membro, m.nome
HAVING COUNT (e.num_membro) > (SELECT COUNT(e.num_membro)
                              FROM emprestado e JOIN membro m ON m.num_membro = e.num_membro
                              WHERE m.nome = 'Smith');


--Consulta e) Ache os membros que não fizeram empréstimos de livros do autor Abraham.

SELECT e.num_membro, m.nome
FROM emprestado e JOIN membro m ON e.num_membro = m.num_membro
GROUP by e.num_membro, m.num_membro
HAVING e.num_membro not in (SELECT num_membro
                          FROM emprestado e, livro l
                          WHERE e.isbn = l.isbn and l.autores = 'Abraham');