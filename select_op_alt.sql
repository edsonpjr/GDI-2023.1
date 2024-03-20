-- GROUP BY/HAVING -


-- Junção interna - Esta consulta retornará o nome de cada filme e o nome do diretor de cada filme. 
-- A junção interna garante que apenas os filmes que têm diretores associados serão incluídos no resultado.
SELECT M.MOVIE_NAME, CM.CREW_NAME AS DIRECTOR
FROM MOVIE M
INNER JOIN DIRECTS D ON M.ID = D.ID_MOVIE
INNER JOIN CREW_MEMBER CM ON D.ID_CREW = CM.ID;

-- Junção externa - Esta consulta retornará uma lista de todos os filmes, juntamente com as críticas dos críticos associadas a cada filme, se disponível. 
-- Se um filme não tiver uma crítica de crítico associada a ele, o campo CRITIC_REVIEW será NULL.
SELECT M.MOVIE_NAME, CR.TEXT AS CRITIC_REVIEW
FROM MOVIE M
LEFT JOIN CRITICS_REVIEW CR ON M.ID = CR.ID_MOVIE;

-- Semi junção - Esta consulta retornará todos os IDs e apelidos de usuários que assistiram a pelo menos um filme.
SELECT U.ID, U.NICK
FROM USER_ U
WHERE EXISTS (
    SELECT *
    FROM WATCHES_ W
    WHERE W.ID_USER = U.ID
);

-- Anti-junção


-- Subconsulta do tipo escalar - Esta consulta retornará os filmes cuja média de notas é maior do que a média geral das médias de notas dos filmes
SELECT MOVIE_NAME, AVERAGE_GRADE
FROM MOVIE
WHERE AVERAGE_GRADE > (
    SELECT AVG(AVERAGE_GRADE)
    FROM MOVIE
);

-- Subconsulta do tipo escalar
SELECT M1.MOVIE_NAME
FROM MOVIE M1
WHERE M1.D_YEAR = (
    SELECT M2.D_YEAR
    FROM MOVIE M2
    WHERE M2.ID = 1
);

-- Subconsulta do tipo linha

-- Subconsulta do tipo tabela

-- Operação de conjunto






