-- GROUP BY/HAVING -


-- Junçao interna - Retorna o nome de cada filme e o nome do diretor de cada filme. 
SELECT M.MOVIE_NAME, CM.CREW_NAME AS DIRECTOR
FROM MOVIE M
INNER JOIN DIRECTS D ON M.ID = D.ID_MOVIE
INNER JOIN CREW_MEMBER CM ON D.ID_CREW = CM.ID;

-- Junção externa - 
SELECT M.MOVIE_NAME, CR.TEXT AS CRITIC_REVIEW
FROM MOVIE M
LEFT JOIN CRITICS_REVIEW CR ON M.ID = CR.ID_MOVIE;

-- Semi junção 
-- Esta consulta retornará todos os IDs e apelidos de usuários que tem pelo menos uma rev
SELECT U.ID, U.NICK
FROM USER_ U
WHERE EXISTS (
    SELECT *
    FROM WATCHES_ W
    WHERE W.ID_USER = U.ID
);

-- Anti-junção


-- Subconsulta do tipo escalar 
-- Filmes cuja média de notas é maior do que a média geral das médias de notas dos filmes
SELECT MOVIE_NAME, AVERAGE_GRADE
FROM MOVIE
WHERE AVERAGE_GRADE > (
    SELECT AVG(AVERAGE_GRADE)
    FROM MOVIE
);

-- Subconsulta do tipo escalar
-- Retorna os filmes que tem mesmo ano que o filme de id 9
SELECT M1.MOVIE_NAME
FROM MOVIE M1
WHERE M1.D_YEAR = (
    SELECT M2.D_YEAR
    FROM MOVIE M2
    WHERE M2.ID = 9
);

-- Subconsulta do tipo linha
-- Descrições das listas de filme do usuário de ID = 1 que tem o mesmo nome e data de criação que a lista de Id = 2
SELECT L.DESCRIPTION_
FROM LIST_MOVIES L
WHERE L.ID_USER = 1 AND (L.LIST_NAME, L.CREATION_DATE) = (
    SELECT L2.LIST_NAME, L2.CREATION_DATE
    FROM LIST_MOVIES L2
    WHERE L2.ID = 2
);

-- Subconsulta do tipo tabela -- Filmes que tem atores registrados
SELECT M.NAME
FROM MOVIE M
WHERE M.ID IN (
    SELECT PB.ID
    FROM DIRECTED PB
);

-- Operação de conjunto
