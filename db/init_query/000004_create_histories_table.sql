USE zgl;

DROP TABLE IF EXISTS zgl.histories;
CREATE TABLE histories (
    id integer NOT NULL,
    book_id integer,
    user_id integer,
    datetime date NOT NULL
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
