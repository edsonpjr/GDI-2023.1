-- Atualiza watched (Numero de filmes assistidos em USER_
-- PL EDSON
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
-- Testa o uso do for, tem como fazer de forma mais eficiente.
CREATE OR REPLACE TRIGGER UPDATE_ALL_WATCHED_MOVIES_AFTER_INSERT
AFTER INSERT ON WATCHES_
BEGIN
    FOR r IN (SELECT DISTINCT ID_USER FROM WATCHES_) LOOP
        UPDATE_WATCHED_MOVIES_PROC(r.ID_USER);
    END LOOP;
END;

-- PL MARCONDES
-- Atualiza N_ACTED
CREATE OR REPLACE TRIGGER UPDATE_N_DIRECTED_AFTER_INSERT
AFTER INSERT ON PLAYED_BY
FOR EACH ROW
DECLARE
    v_new_n_acted NUMBER;
BEGIN
    UPDATE CREW_MEMBER
    SET N_ACTED = N_ACTED + 1
    WHERE ID = :NEW.ID_CREW
    RETURNING N_ACTED INTO v_new_n_acted;
    
    DBMS_OUTPUT.PUT_LINE('ID: ' || :NEW.ID_CREW || ' - N_ACTED updated to: ' || v_new_n_acted);
END;

-- Atualiza N_DIRECTED
CREATE OR REPLACE TRIGGER UPDATE_N_DIRECTED_AFTER_INSERT
AFTER INSERT ON DIRECTS
FOR EACH ROW
DECLARE
    v_new_n_directed NUMBER;
BEGIN
    UPDATE CREW_MEMBER
    SET N_DIRECTED = N_DIRECTED + 1
    WHERE ID = :NEW.ID_CREW
    RETURNING N_DIRECTED INTO v_new_n_directed;
    
    DBMS_OUTPUT.PUT_LINE('ID: ' || :NEW.ID_CREW || ' - N_DIRECTED updated to: ' || v_new_n_directed);
END;

-- PL MARIA
-- Checar se a data que o usuario assistiu um filme é a mesma usada para o review
CREATE OR REPLACE TRIGGER CHECK_WATCH_DATE 
BEFORE INSERT ON REVIEW_
FOR EACH ROW
DECLARE
    v_watch_date TIMESTAMP;
BEGIN
    SELECT TIME_STAMP
    INTO v_watch_date
    FROM WATCHES_
    WHERE ID_USER = :NEW.ID_USER AND ID_MOVIE = :NEW.ID_MOVIE;

    IF v_watch_date != :NEW.WATCH_TIME_STAMP THEN
        RAISE_APPLICATION_ERROR(-20000, 'Watch date does not match the review date');
    END IF;
END;

-- PL FELIPE
-- Calcular a média das notas dos filmes assistidos pelo usuário
CREATE OR REPLACE PROCEDURE CALCULATE_AVERAGE_GRADE (p_user_id IN NUMBER) AS
    v_average_grade NUMBER;
BEGIN
    SELECT AVG(GRADE) INTO v_average_grade
    FROM WATCHES_
    WHERE ID_USER = p_user_id;

    -- Exibir a média das notas
    DBMS_OUTPUT.PUT_LINE('Average grade for user ' || p_user_id || ': ' || v_average_grade);
END CALCULATE_AVERAGE_GRADE;

-- PL Pedro César
-- Evitar duplicatas em favoritos do user
CREATE OR REPLACE TRIGGER PREVENT_DUPLICATE_FAVORITES
BEFORE INSERT ON FAVORITE_MOVIES
FOR EACH ROW
DECLARE
    v_favorite_count NUMBER;
BEGIN

    -- Conta quantas vezes o filme ja foi adicionado aos favoritos pelo user

    SELECT COUNT(*)
    INTO v_favorite_count
    FROM FAVORITE_MOVIES

    -- O prefixo :NEW acessa valores da nova entrada a ser inserida, prevenindo duplicatas.
    WHERE ID = :NEW.ID AND FAVORITE_MOVIES = :NEW.FAVORITE_MOVIES;
    
    -- Se o filme já existe na lista de favoritos, lança um erro.
    IF v_favorite_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'O filme já está na lista de favoritos.');
    END IF;
END;

--PL PEDRO FERNANDES
-- Remover todos os papéis de um Crew_Member quando ele for excluído
CREATE OR REPLACE TRIGGER REMOVE_ROLES_WHEN_CREW_REMOVED
AFTER DELETE ON CREW_MEMBER
FOR EACH ROW
BEGIN

    DELETE FROM PROMOTES
    WHERE ID_CREW_MEMBER = :OLD.ID;

    DELETE FROM DIRECTS
    WHERE ID_CREW = :OLD.ID;

    DELETE FROM PLAYED_BY
    WHERE ID_CREW = :OLD.ID;
END;
/
    
-- POde ser testado com esse comando 2x: 
-- INSERT INTO FAVORITE_MOVIES (ID, FAVORITE_MOVIES) VALUES (1, 'Matrix');
