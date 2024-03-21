-- GROUP BY/HAVING -
-- Achar filmes que possuem um numero maior que 1 de críticas
SELECT
    M.MOVIE_NAME,
    COUNT(R.ID_MOVIE) AS NUM_REVIEWS
FROM
    MOVIE   M
    JOIN REVIEW_ R
    ON M.ID = R.ID_MOVIE
GROUP BY
    M.MOVIE_NAME
HAVING
    COUNT(R.ID_MOVIE) > 1;


-- Junçao interna - Retorna o nome de cada filme e o nome do diretor de cada filme. 
SELECT M.MOVIE_NAME, CM.CREW_NAME AS DIRECTOR
FROM MOVIE M
INNER JOIN DIRECTS D ON M.ID = D.ID_MOVIE
INNER JOIN CREW_MEMBER CM ON D.ID_CREW = CM.ID;

-- Junção externa - Retorna uma lista de todos os filmes, juntamente com as críticas associadas a cada filme, se disponível.
SELECT M.MOVIE_NAME, CR.TEXT AS CRITIC_REVIEW
FROM MOVIE M
LEFT JOIN CRITICS_REVIEW CR ON M.ID = CR.ID_MOVIE;

-- Semi junção 
-- Esta consulta retornará todos os IDs e apelidos de usuários que tem pelo menos uma rev
SELECT U.NICK
FROM USER_ U
WHERE EXISTS (
    SELECT *
    FROM  LIST_MOVIES
    WHERE LIST_MOVIES.ID_USER = U.ID
)
ORDER BY U.NICK;

-- Anti-junção
-- Filmes que nunca foram listados
SELECT M.MOVIE_NAME
FROM MOVIE M
WHERE NOT EXISTS (
    SELECT *
    FROM CONTAINS C
    WHERE C.ID_MOVIE = M.ID
);

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
-- Listas de filme do que tem o mesmo genero e ano que o filme de ID 1
SELECT M1.MOVIE_NAME
FROM MOVIE M1 INNER JOIN GENRE G1
ON M1.ID = G1.ID
WHERE (G1.MOVIE_GENRE, M1.D_YEAR) = (
    SELECT G2.MOVIE_GENRE, M2.D_YEAR
    FROM MOVIE M2 INNER JOIN GENRE G2
    ON M2.ID = G2.ID
    WHERE M2.ID = 1
);

-- Subconsulta do tipo tabela -- Filmes que tem atores registrados
SELECT M.MOVIE_NAME
FROM MOVIE M
WHERE M.ID IN (
    SELECT P.ID_MOVIE
    FROM PLAYED_BY P
    WHERE P.ID_CREW IS NOT NULL
);

-- Operação de conjunto
-- Consulta para obter os nomes das pessoas e seus filmes favoritos junto aos diretores e seus filmes dirigidos
SELECT
    U.NICK             AS INFO,
    FM.FAVORITE_MOVIES AS MOVIE_NAME
FROM
    PERSON          P
    INNER JOIN FAVORITE_MOVIES FM
    ON P.ID = FM.ID
    INNER JOIN USER_ U
    ON U.ID = P.ID
UNION

SELECT
    CM.CREW_NAME AS DIRECTOR,
    M.MOVIE_NAME
FROM
    MOVIE       M
    INNER JOIN DIRECTS D
    ON M.ID = D.ID_MOVIE
    INNER JOIN CREW_MEMBER CM
    ON D.ID_CREW = CM.ID;
