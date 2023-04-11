USE zgl;
DROP TABLE IF EXISTS zgl.books;
CREATE TABLE books (
    id INT AUTO_INCREMENT,
    title character varying(255) NOT NULL,
    category character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    place character varying(64) NOT NULL,
    keizai integer,
    hougaku integer,
    rigaku integer,
    kougaku integer,
    bungaku integer,
    igaku integer,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
