CREATE TABLE PERSON (
    ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    BIO VARCHAR2(1000),
    PICTURE BLOB, --blob armazena imagens
    CONSTRAINT PK_PERSON PRIMARY KEY (ID)
);

CREATE TABLE USER_ (
    ID INT,
    NICK CHAR(25),
    USER_PASSWORD CHAR(64),
    EMAIL VARCHAR2(255),
    WATCHED INT, --criar trigger
    CREATION_DATE DATE,
    CONSTRAINT PK_USER PRIMARY KEY (ID),
    CONSTRAINT FK_PERSON FOREIGN KEY (ID) REFERENCES PERSON(ID)
);

CREATE TABLE FAVORITE_MOVIES (
    ID INT,
    FAVORITE_MOVIES VARCHAR(255),
    CONSTRAINT PK_FAVORITE_MOVIES PRIMARY KEY (ID, FAVORITE_MOVIES),
    CONSTRAINT FK_FAVORITE_MOVIES_USER FOREIGN KEY (ID) REFERENCES USER_(ID)
);

CREATE TABLE CREW_MEMBER (
    ID INT,
    CREW_NAME VARCHAR2(255),
    N_ACTED NUMBER, --criar trigger
    N_DIRECTED NUMBER, --criar trigger
    CONSTRAINT PK_CREW_MEMBER PRIMARY KEY (ID),
    CONSTRAINT FK_CREW_MEMBER_PERSON FOREIGN KEY (ID) REFERENCES PERSON(ID)
);

CREATE TABLE LIST_MOVIES (
    ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    DESCRIPTION_ VARCHAR2(255),
    LIST_NAME VARCHAR2(255),
    CREATION_DATE DATE,
    ID_USER INT,
    CONSTRAINT PK_LIST PRIMARY KEY (ID),
    CONSTRAINT FK_LIST_USER FOREIGN KEY (ID_USER) REFERENCES USER_(ID)
);

CREATE TABLE MOVIE (
    ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    AVERAGE_GRADE NUMBER, --criar trigger
    MOVIE_NAME VARCHAR2(255),
    COVER BLOB,
    D_SYNOSPSIS VARCHAR2(1000),
    D_YEAR NUMBER(4),
    D_DURATION NUMBER,
    CONSTRAINT PK_MOVIE PRIMARY KEY (ID)
);

CREATE TABLE GENRE (
    ID INT,
    MOVIE_GENRE VARCHAR2(255),
    CONSTRAINT PK_GENRE PRIMARY KEY (ID,MOVIE_GENRE),
    CONSTRAINT FK_GENRE_MOVIE FOREIGN KEY (ID) REFERENCES MOVIE(ID)
);

CREATE TABLE CRITICS_REVIEW (
    ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    TEXT VARCHAR2(1000),
    ID_MOVIE INT NOT NULL UNIQUE,
    CONSTRAINT PK_CRITICS_REVIEW PRIMARY KEY (ID),
    CONSTRAINT FK_CRITICS_REVIEW_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID)
);

CREATE TABLE WATCHES_ (
    ID_MOVIE INT,
    ID_USER INT,
    TIME_STAMP TIMESTAMP,
    GRADE NUMBER, --CRIAR trigger
    CONSTRAINT PK_WATCHES PRIMARY KEY (ID_MOVIE, ID_USER, TIME_STAMP),
    CONSTRAINT FK_WATCHES_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID),
    CONSTRAINT FK_WATCHES_USER FOREIGN KEY (ID_USER) REFERENCES USER_(ID)
);

CREATE TABLE REVIEW_ (
    ID_USER INT,
    ID_MOVIE INT,
    WATCH_TIME_STAMP TIMESTAMP,
    RVW_TIMESTAMP TIMESTAMP,
    TEXT VARCHAR2(1000),
    CONSTRAINT PK_REVIEW PRIMARY KEY (ID_USER, ID_MOVIE, WATCH_TIME_STAMP, RVW_TIMESTAMP),
    CONSTRAINT FK_REVIEW FOREIGN KEY (ID_MOVIE, ID_USER, WATCH_TIME_STAMP) REFERENCES WATCHES_(ID_MOVIE, ID_USER, TIME_STAMP)
);

CREATE TABLE CONTAINS (
    ID_LIST INT,
    ID_MOVIE INT,
    CONSTRAINT PK_CONTAINS PRIMARY KEY (ID_LIST, ID_MOVIE),
    CONSTRAINT FK_CONTAINS_LIST FOREIGN KEY (ID_LIST) REFERENCES LIST_MOVIES(ID),
    CONSTRAINT FK_CONTAINS_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID)
);

CREATE TABLE PLAYED_BY (
    ID_MOVIE NUMBER,
    ID_CREW NUMBER,
    ROLE_ VARCHAR2(255),
    CONSTRAINT PK_PLAYED_BY PRIMARY KEY (ID_MOVIE, ID_CREW, ROLE_),
    CONSTRAINT FK_PLAYED_BY_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID),
    CONSTRAINT FK_PLAYED_BY_CREW FOREIGN KEY (ID_CREW) REFERENCES CREW_MEMBER(ID)
);

CREATE TABLE DIRECTS (
    ID_MOVIE NUMBER,
    ID_CREW NUMBER,
    DIRECTOR_ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    CONSTRAINT PK_DIRECTS PRIMARY KEY (ID_MOVIE, ID_CREW, DIRECTOR_ID),
    CONSTRAINT FK_DIRECTS_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID),
    CONSTRAINT FK_DIRECTS_CREW FOREIGN KEY (ID_CREW) REFERENCES CREW_MEMBER(ID)
);

CREATE TABLE PROMOTES (
    ID_USER INT,
    ID_CREW_MEMBER INT,
    ID_MOVIE INT NOT NULL,
    TEXT VARCHAR2(1000),
    CONSTRAINT PK_PROMOTES PRIMARY KEY (ID_USER, ID_CREW_MEMBER),
    CONSTRAINT FK_PROMOTES_USER FOREIGN KEY (ID_USER) REFERENCES USER_(ID),
    CONSTRAINT FK_PROMOTES_CREW_MEMBER FOREIGN KEY (ID_CREW_MEMBER) REFERENCES CREW_MEMBER(ID),
    CONSTRAINT FK_PROMOTES_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID)
);

CREATE TABLE FOLLOWS (
    ID_FOLLOWS NUMBER,
    ID_IS_FOLLOWED NUMBER,
    CONSTRAINT PK_FOLLOWS PRIMARY KEY (ID_FOLLOWS, ID_IS_FOLLOWED),
    CONSTRAINT FK_FOLLOWS_USER FOREIGN KEY (ID_FOLLOWS) REFERENCES USER_(ID),
    CONSTRAINT FK_FOLLOWS_IS_FOLLOWED FOREIGN KEY (ID_IS_FOLLOWED) REFERENCES USER_(ID)
);
