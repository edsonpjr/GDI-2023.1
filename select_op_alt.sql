-- GROUP BY/HAVING - Esta consulta retornará o nome de cada diretor e o número de filmes que cada um dirigiu, 
-- limitando-se aos diretores que dirigiram mais de 3 filmes.
SELECT CM.CREW_NAME AS DIRECTOR, COUNT(D.ID_MOVIE) AS NUM_FILMES_DIRIGIDOS
FROM CREW_MEMBER CM
JOIN DIRECTS D ON CM.ID = D.ID_CREW
GROUP BY CM.CREW_NAME
HAVING COUNT(D.ID_MOVIE) > 3;

-- GROUP BY/HAVING - Esta consulta retornará o gênero do filme e a média das notas para os gêneros que têm uma média de notas maior do que 8.
SELECT G.MOVIE_GENRE, AVG(R.GRADE) AS MEDIA_NOTAS
FROM GENRE G
JOIN MOVIE M ON G.ID = M.ID
JOIN REVIEW_ R ON M.ID = R.ID_MOVIE
GROUP BY G.MOVIE_GENRE
HAVING AVG(R.GRADE) > 8;

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
SELECT DISTINCT U.ID, U.NICK
FROM USER_ U
WHERE EXISTS (
    SELECT *
    FROM WATCHES_ W
    WHERE W.ID_USER = U.ID
);

-- Anti-junção - Esta consulta retornará os nomes dos filmes que não foram promovidos por nenhum usuário.
SELECT M.MOVIE_NAME
FROM MOVIE M
LEFT JOIN PROMOTES P ON M.ID = P.ID_MOVIE
WHERE P.ID_MOVIE IS NULL;

-- Subconsulta do tipo escalar - Esta consulta retornará os filmes cuja média de notas é maior do que a média geral das médias de notas dos filmes
SELECT MOVIE_NAME, AVERAGE_GRADE
FROM MOVIE
WHERE AVERAGE_GRADE > (
    SELECT AVG(AVERAGE_GRADE)
    FROM MOVIE
);

-- Subconsulta do tipo linha - Esta consulta retornará todos os filmes junto com os nomes dos diretores
SELECT MOVIE_NAME, (
    SELECT CREW_NAME
    FROM CREW_MEMBER cm
    JOIN DIRECTS d ON cm.ID = d.ID_CREW
    WHERE d.ID_MOVIE = m.ID
) AS DIRECTOR
FROM MOVIE m;

-- Subconsulta do tipo tabela - Esta consulta retornará todos os filmes junto com o número de críticas que cada um recebeu
SELECT 
    MOVIE_NAME, 
    (
        SELECT COUNT(*)
        FROM CRITICS_REVIEW
        WHERE ID_MOVIE = m.ID
    ) AS NUM_CRITICS_REVIEWS
FROM MOVIE m;

-- Operação de conjunto - Esta consulta retornará uma lista de filmes assistidos pelos usuários em suas listas de filmes favoritos.
SELECT MOVIE_NAME
FROM MOVIE
WHERE ID IN (
    SELECT ID_MOVIE
    FROM FAVORITE_MOVIES
    UNION
    SELECT ID_MOVIE
    FROM LIST_MOVIES
);







