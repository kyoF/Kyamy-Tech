USE zgl;
DROP TABLE IF EXISTS zgl.users;
CREATE TABLE users (
    id INT AUTO_INCREMENT,
    user_id VARCHAR(64) NOT NULL UNIQUE,
    name VARCHAR(64) NOT NULL,
    password VARCHAR(64) NOT NULL,
    guraduate INT NOT NULL,
    undergraduate VARCHAR(64) NOT NULL,
    UNIQUE(user_id),
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
