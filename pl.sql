-- Este procedimento pode ser chamado de um trigger após a inserção de um novo registro na tabela WATCHES_, 
-- garantindo que o número de filmes assistidos seja sempre mantido atualizado para cada usuário.

CREATE OR REPLACE PROCEDURE UPDATE_WATCHED_MOVIES_PROC (p_user_id IN NUMBER) AS
    v_watched_count NUMBER;
BEGIN
    -- Contar o número de filmes assistidos pelo usuário
    SELECT COUNT(*)
    INTO v_watched_count
    FROM WATCHES_
    WHERE ID_USER = p_user_id;

    -- Atualizar o número de filmes assistidos na tabela USER_
    UPDATE USER_
    SET WATCHED = v_watched_count
    WHERE ID = p_user_id;
END;
/

-- Este procedimento utiliza um trigger após a inserção de uma nova avaliação na tabela REVIEW_, 
-- garantindo que a média das avaliações seja sempre mantida atualizada para cada filme.
CREATE OR REPLACE PROCEDURE CALCULATE_AVERAGE_GRADE_PROC (p_movie_id IN NUMBER) AS
    v_avg_grade NUMBER;
BEGIN
    -- Calcular a média das avaliações do filme
    SELECT AVG(GRADE)
    INTO v_avg_grade
    FROM REVIEW_
    WHERE ID_MOVIE = p_movie_id;

    -- Atualizar a média de avaliações do filme na tabela MOVIE
    UPDATE MOVIE
    SET AVERAGE_GRADE = v_avg_grade
    WHERE ID = p_movie_id;
END;
/
