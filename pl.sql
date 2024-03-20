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
