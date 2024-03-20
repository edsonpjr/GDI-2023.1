-- Este procedimento pode ser chamado de um trigger após a inserção de um novo registro na tabela WATCHES_, 
-- garantindo que o número de filmes assistidos seja sempre mantido atualizado para cada usuário.

CREATE OR REPLACE PROCEDURE UPDATE_WATCHED_MOVIES_PROC (p_user_id IN NUMBER) AS
    v_watched_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_watched_count
    FROM WATCHES_
    WHERE ID_USER = p_user_id;

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
    SELECT AVG(GRADE)
    INTO v_avg_grade
    FROM REVIEW_
    WHERE ID_MOVIE = p_movie_id;

    UPDATE MOVIE
    SET AVERAGE_GRADE = v_avg_grade
    WHERE ID = p_movie_id;
END;
/

-- Atualiza N_ACTED
CREATE OR REPLACE TRIGGER UPDATE_N_ACTED_AFTER_INSERT
AFTER INSERT ON PLAYED_BY
FOR EACH ROW
BEGIN
  UPDATE CREW_MEMBER
  SET N_ACTED = N_ACTED + 1
  WHERE ID = :NEW.ID_CREW;
END;

-- Atualiza N_DIRECTED
CREATE OR REPLACE TRIGGER UPDATE_N_DIRECTED_AFTER_INSERT
AFTER INSERT ON DIRECTS
FOR EACH ROW
BEGIN
  UPDATE CREW_MEMBER
  SET N_DIRECTED = N_DIRECTED + 1
  WHERE ID = :NEW.ID_CREW;
END;
