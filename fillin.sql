-- Inserir dados na tabela PERSON
INSERT INTO PERSON (BIO, PICTURE) VALUES ('John Doe is a passionate movie enthusiast.', NULL);
INSERT INTO PERSON (BIO, PICTURE) VALUES ('Jane Smith loves watching movies in her free time.', NULL);
INSERT INTO PERSON (BIO, PICTURE) VALUES ('Christopher Nolan is a British-American film director, screenwriter, and producer.', NULL);
INSERT INTO PERSON (BIO, PICTURE) VALUES ('Pedro Fernandes is passionate about cult cinema and loves gore.', NULL);
INSERT INTO PERSON (BIO, PICTURE) VALUES ('Pedro Cesar loves watching movies in his free time.', NULL);
INSERT INTO PERSON (BIO, PICTURE) VALUES ('Edson Arantes do Nascimento, known as Pelé, is a Brazilian former professional footballer who played as a forward.', NULL);
INSERT INTO PERSON (BIO, PICTURE) VALUES ('James Cameron is a Canadian film director, producer, and screenwriter.', NULL);
INSERT INTO PERSON (BIO, PICTURE) VALUES ('Linda Blair is an American actress and animal rights activist.', NULL);

-- Inserir dados na tabela USER_
INSERT INTO USER_ (ID, NICK, USER_PASSWORD, EMAIL, WATCHED, CREATION_DATE) VALUES (1, 'john_doe', 'hashed_password', 'john@example.com', 0, SYSDATE);
INSERT INTO USER_ (ID, NICK, USER_PASSWORD, EMAIL, WATCHED, CREATION_DATE) VALUES (2, 'jane_smith', 'hashed_password', 'jane@example.com', 0, SYSDATE);
INSERT INTO USER_ (ID, NICK, USER_PASSWORD, EMAIL, WATCHED, CREATION_DATE) VALUES (4, 'pedro_fernandes', 'hashed_password', 'pfbc2@cin.ufpe.br', 0, TO_DATE('2010-10-01', 'YYYY-MM-DD'));
INSERT INTO USER_ (ID, NICK, USER_PASSWORD, EMAIL, WATCHED, CREATION_DATE) VALUES (5, 'pedro_cesar', 'hashed_password', 'pcgr@cin.ufpe.br', 0, TO_DATE('2015-08-01', 'YYYY-MM-DD'));
INSERT INTO USER_ (ID, NICK, USER_PASSWORD, EMAIL, WATCHED, CREATION_DATE) VALUES (6, 'Pelé', 'hashed_password', 'pele@gmail.com', 0, TO_DATE('2000-01-13', 'YYYY-MM-DD'));

-- Inserir dados na tabela FAVORITE_MOVIES
INSERT INTO FAVORITE_MOVIES (ID, FAVORITE_MOVIES) VALUES (1, 'Inception');
INSERT INTO FAVORITE_MOVIES (ID, FAVORITE_MOVIES) VALUES (1, 'Titanic');
INSERT INTO FAVORITE_MOVIES (ID, FAVORITE_MOVIES) VALUES (1, 'Rambo');
INSERT INTO FAVORITE_MOVIES (ID, FAVORITE_MOVIES) VALUES (1, 'The Terminator');
INSERT INTO FAVORITE_MOVIES (ID, FAVORITE_MOVIES) VALUES (6, 'The Matrix');
INSERT INTO FAVORITE_MOVIES (ID, FAVORITE_MOVIES) VALUES (6, 'Society of the Snow');
INSERT INTO FAVORITE_MOVIES (ID, FAVORITE_MOVIES) VALUES (4, 'The Shining');

-- Inserir dados na tabela LIST_MOVIES
INSERT INTO LIST_MOVIES (DESCRIPTION_, LIST_NAME, CREATION_DATE, ID_USER) VALUES ('Action Movies', 'Action List', SYSDATE, 1);
INSERT INTO LIST_MOVIES (DESCRIPTION_, LIST_NAME, CREATION_DATE, ID_USER) VALUES ('My favorite movies', 'Favorites', SYSDATE, 1);
INSERT INTO LIST_MOVIES (DESCRIPTION_, LIST_NAME, CREATION_DATE, ID_USER) VALUES ('my favorite horror movies for Halloween night', 'HORROR', SYSDATE, 4);
INSERT INTO LIST_MOVIES (DESCRIPTION_, LIST_NAME, CREATION_DATE, ID_USER) VALUES ('5 start scifi movies', 'scifi', SYSDATE, 4);
INSERT INTO LIST_MOVIES (DESCRIPTION_, LIST_NAME, CREATION_DATE, ID_USER) VALUES ('movies about planes and drones', 'passion' , SYSDATE, 5);
INSERT INTO LIST_MOVIES (DESCRIPTION_, LIST_NAME, CREATION_DATE, ID_USER) VALUES ('Pelé''s favorite movies', 'Pelé''s List', SYSDATE, 6);

-- Inserir dados na tabela MOVIE
INSERT INTO MOVIE (AVERAGE_GRADE, MOVIE_NAME, COVER, D_SYNOSPSIS, D_YEAR, D_DURATION) VALUES (8.5, 'Inception', NULL, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 2010, 148);
INSERT INTO MOVIE (AVERAGE_GRADE, MOVIE_NAME, COVER, D_SYNOSPSIS, D_YEAR, D_DURATION) VALUES (7.9, 'Titanic', NULL, 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', 1997, 195);
INSERT INTO MOVIE (AVERAGE_GRADE, MOVIE_NAME, COVER, D_SYNOSPSIS, D_YEAR, D_DURATION) VALUES (7.7, 'Rambo', NULL, 'Vietnam War veteran John Rambo tries to find some semblance of peace by raising horses on a ranch in Arizona.', 2008, 92);
INSERT INTO MOVIE (AVERAGE_GRADE, MOVIE_NAME, COVER, D_SYNOSPSIS, D_YEAR, D_DURATION) VALUES (8.0, 'The Terminator', NULL, 'A human soldier is sent from 2029 to 1984 to stop an almost indestructible cyborg killing machine, sent from the same year, which has been programmed...', 1984, 107);
INSERT INTO MOVIE (AVERAGE_GRADE, MOVIE_NAME, COVER, D_SYNOSPSIS, D_YEAR, D_DURATION) VALUES (8.7, 'The Matrix', NULL, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 1999, 136);
INSERT INTO MOVIE (AVERAGE_GRADE, MOVIE_NAME, COVER, D_SYNOSPSIS, D_YEAR, D_DURATION) VALUES (8.7, 'Society of the Snow', NULL, 'A group of people are trapped in a snowstorm and must find a way to survive.', 2020, 120);
INSERT INTO MOVIE (AVERAGE_GRADE, MOVIE_NAME, COVER, D_SYNOSPSIS, D_YEAR, D_DURATION) VALUES (8.7, 'The Shining', NULL, 'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.', 1980, 146);
INSERT INTO MOVIE (AVERAGE_GRADE, MOVIE_NAME, COVER, D_SYNOSPSIS, D_YEAR, D_DURATION) VALUES (8.7, 'The Exorcist', NULL, 'A atriz gradually becomes aware that her twelve-year-old daughter is displaying completely terrifying behavior. She seeks help from a priest who is also a psychiatrist, and he concludes that the girl is possessed by a demon. He then requests the assistance of a second priest, an exorcism specialist, to try to rid the girl of this terrible possession.', 1973, 122);

-- Inserir dados na tabela GENRE
INSERT INTO GENRE (ID, MOVIE_GENRE) VALUES (1, 'Action');
INSERT INTO GENRE (ID, MOVIE_GENRE) VALUES (2, 'Romance');
INSERT INTO GENRE (ID, MOVIE_GENRE) VALUES (3, 'Action');
INSERT INTO GENRE (ID, MOVIE_GENRE) VALUES (4, 'Action');
INSERT INTO GENRE (ID, MOVIE_GENRE) VALUES (5, 'Scifi');
INSERT INTO GENRE (ID, MOVIE_GENRE) VALUES (6, 'Drama');
INSERT INTO GENRE (ID, MOVIE_GENRE) VALUES (7, 'Horror');
INSERT INTO GENRE (ID, MOVIE_GENRE) VALUES (8, 'Horror');

-- Inserir dados na tabela CRITICS_REVIEW
INSERT INTO CRITICS_REVIEW (TEXT, ID_MOVIE) VALUES ('Inception is a mind-bending masterpiece!', 1);
INSERT INTO CRITICS_REVIEW (TEXT, ID_MOVIE) VALUES ('Titanic is a timeless classic!', 2);
INSERT INTO CRITICS_REVIEW (TEXT, ID_MOVIE) VALUES ('Rambo is a thrilling action movie!', 3);

-- Inserir dados na tabela CREW_MEMBER
INSERT INTO CREW_MEMBER (ID, CREW_NAME, N_ACTED, N_DIRECTED) VALUES (3, 'Christopher Nolan', 0, 4);
INSERT INTO CREW_MEMBER (ID, CREW_NAME, N_ACTED, N_DIRECTED) VALUES (7, 'James Cameron', 0, 1);
INSERT INTO CREW_MEMBER (ID, CREW_NAME, N_ACTED, N_DIRECTED) VALUES (8, 'Linda Blair', 1, 0);

-- Inserir dados na tabela DIRECTS
INSERT INTO DIRECTS (ID_MOVIE, ID_CREW) VALUES (1, 3);
INSERT INTO DIRECTS (ID_MOVIE, ID_CREW) VALUES (3, 3);
INSERT INTO DIRECTS (ID_MOVIE, ID_CREW) VALUES (6, 3);
INSERT INTO DIRECTS (ID_MOVIE, ID_CREW) VALUES (7, 3);
INSERT INTO DIRECTS (ID_MOVIE, ID_CREW) VALUES (2, 7);

-- Inserir dados na tabela PROMOTES
INSERT INTO PROMOTES (ID_USER, ID_CREW_MEMBER, ID_MOVIE, TEXT) VALUES (1, 3, 1, 'A must-watch by Christopher Nolan!');
INSERT INTO PROMOTES (ID_USER, ID_CREW_MEMBER, ID_MOVIE, TEXT) VALUES (2, 7, 2, 'Experience the magic by James Cameron!');

-- Inserir dados na tabela FOLLOWS
INSERT INTO FOLLOWS (ID_FOLLOWS, ID_IS_FOLLOWED) VALUES (1, 2); 
INSERT INTO FOLLOWS (ID_FOLLOWS, ID_IS_FOLLOWED) VALUES (1, 4); 
INSERT INTO FOLLOWS (ID_FOLLOWS, ID_IS_FOLLOWED) VALUES (2, 1); 
INSERT INTO FOLLOWS (ID_FOLLOWS, ID_IS_FOLLOWED) VALUES (2, 4); 
INSERT INTO FOLLOWS (ID_FOLLOWS, ID_IS_FOLLOWED) VALUES (4, 5); 
INSERT INTO FOLLOWS (ID_FOLLOWS, ID_IS_FOLLOWED) VALUES (4, 6);
INSERT INTO FOLLOWS (ID_FOLLOWS, ID_IS_FOLLOWED) VALUES (4, 2);

--Inserir dados na tabela PLAYED_BY
INSERT INTO PLAYED_BY (ID_MOVIE, ID_CREW, ROLE_) VALUES (3, 8, 'Main Character');

--Inserir dados na tabela CONTAINS 
INSERT INTO CONTAINS (ID_LIST, ID_MOVIE) VALUES (1, 3);
INSERT INTO CONTAINS (ID_LIST, ID_MOVIE) VALUES (1, 4);
INSERT INTO CONTAINS (ID_LIST, ID_MOVIE) VALUES (2, 1);
INSERT INTO CONTAINS (ID_LIST, ID_MOVIE) VALUES (2, 2);
INSERT INTO CONTAINS (ID_LIST, ID_MOVIE) VALUES (2, 8);
INSERT INTO CONTAINS (ID_LIST, ID_MOVIE) VALUES (3, 7);
INSERT INTO CONTAINS (ID_LIST, ID_MOVIE) VALUES (4, 5);
INSERT INTO CONTAINS (ID_LIST, ID_MOVIE) VALUES (4, 1);
INSERT INTO CONTAINS (ID_LIST, ID_MOVIE) VALUES (5, 3);
INSERT INTO CONTAINS (ID_LIST, ID_MOVIE) VALUES (6, 6);

--Inserir dados na tabela WATCHES
INSERT INTO WATCHES_ (ID_USER, ID_MOVIE, TIME_STAMP, GRADE) VALUES (1, 1, TO_DATE('2020-10-01', 'YYYY-MM-DD'), 8);
INSERT INTO WATCHES_ (ID_USER, ID_MOVIE, TIME_STAMP, GRADE) VALUES (1, 2, TO_DATE('2020-10-02', 'YYYY-MM-DD'), 6);
INSERT INTO WATCHES_ (ID_USER, ID_MOVIE, TIME_STAMP, GRADE) VALUES (1, 3, TO_DATE('2020-10-03', 'YYYY-MM-DD'), 9);
INSERT INTO WATCHES_ (ID_USER, ID_MOVIE, TIME_STAMP, GRADE) VALUES (1, 4, TO_DATE('2020-10-04', 'YYYY-MM-DD'), 4.7);
INSERT INTO WATCHES_ (ID_USER, ID_MOVIE, TIME_STAMP, GRADE) VALUES (1, 5, TO_DATE('2020-10-05', 'YYYY-MM-DD'), 7.3);
INSERT INTO WATCHES_ (ID_USER, ID_MOVIE, TIME_STAMP, GRADE) VALUES (2, 6, TO_DATE('2020-10-06', 'YYYY-MM-DD'), 3.7);
INSERT INTO WATCHES_ (ID_USER, ID_MOVIE, TIME_STAMP, GRADE) VALUES (2, 7, TO_DATE('2020-10-06', 'YYYY-MM-DD'), 6.9);
INSERT INTO WATCHES_ (ID_USER, ID_MOVIE, TIME_STAMP, GRADE) VALUES (2, 8, TO_DATE('2020-10-06', 'YYYY-MM-DD'), 3);
INSERT INTO WATCHES_ (ID_USER, ID_MOVIE, TIME_STAMP, GRADE) VALUES (4, 1, TO_DATE('2022-08-23', 'YYYY-MM-DD'), 5.9);
INSERT INTO WATCHES_ (ID_USER, ID_MOVIE, TIME_STAMP, GRADE) VALUES (4, 2, TO_DATE('2022-08-23', 'YYYY-MM-DD'), 8);

--Inserir dados na tabela REVIEW_
INSERT INTO REVIEW_ (ID_USER, ID_MOVIE, WATCH_TIME_STAMP, RVW_TIMESTAMP, TEXT) VALUES (1, 1, TO_DATE('2020-10-01', 'YYYY-MM-DD'), TO_DATE('2020-10-01', 'YYYY-MM-DD'), 'Inception is a mind-bending masterpiece!');
INSERT INTO REVIEW_ (ID_USER, ID_MOVIE, WATCH_TIME_STAMP, RVW_TIMESTAMP, TEXT) VALUES (1, 2, TO_DATE('2020-10-02', 'YYYY-MM-DD'), TO_DATE('2020-10-02', 'YYYY-MM-DD'), 'Titanic is a timeless classic!');
INSERT INTO REVIEW_ (ID_USER, ID_MOVIE, WATCH_TIME_STAMP, RVW_TIMESTAMP, TEXT) VALUES (1, 3, TO_DATE('2020-10-03', 'YYYY-MM-DD'), TO_DATE('2020-10-03', 'YYYY-MM-DD'), 'Rambo is a thrilling action movie!');
INSERT INTO REVIEW_ (ID_USER, ID_MOVIE, WATCH_TIME_STAMP, RVW_TIMESTAMP, TEXT) VALUES (2, 6, TO_DATE('2020-10-06', 'YYYY-MM-DD'), TO_DATE('2020-10-04', 'YYYY-MM-DD'), 'Society of the Snow is a bad movie!');
INSERT INTO REVIEW_ (ID_USER, ID_MOVIE, WATCH_TIME_STAMP, RVW_TIMESTAMP, TEXT) VALUES (2, 7, TO_DATE('2020-10-06', 'YYYY-MM-DD'), TO_DATE('2020-10-04', 'YYYY-MM-DD'), 'The Shining is crazy film');
INSERT INTO REVIEW_ (ID_USER, ID_MOVIE, WATCH_TIME_STAMP, RVW_TIMESTAMP, TEXT) VALUES (4, 1, TO_DATE('2022-08-23', 'YYYY-MM-DD'), TO_DATE('2022-08-24', 'YYYY-MM-DD'), 'Manjado neh');
INSERT INTO REVIEW_ (ID_USER, ID_MOVIE, WATCH_TIME_STAMP, RVW_TIMESTAMP, TEXT) VALUES (4, 2, TO_DATE('2022-08-23', 'YYYY-MM-DD'), TO_DATE('2022-09-25', 'YYYY-MM-DD'), 'Morreu de besta otario');
