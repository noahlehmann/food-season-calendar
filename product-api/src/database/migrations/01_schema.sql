BEGIN TRANSACTION;
PRAGMA FOREIGN_KEYS = ON;

CREATE TABLE t_type
(
    id             INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name           TEXT    NOT NULL,
    fk_parent_type INTEGER,
    FOREIGN KEY (fk_parent_type) REFERENCES t_type (id)
);

CREATE TABLE t_product
(
    id          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name_german TEXT,
    name_latin  TEXT    NOT NULL,
    image_url   TEXT,
    fk_type     INTEGER NOT NULL,
    FOREIGN KEY (fk_type) REFERENCES t_type (id)
);

CREATE TABLE t_availability_type
(
    id     INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name   TEXT    NOT NULL,
    rating INTEGER NOT NULL
);

CREATE TABLE t_availability
(
    id                   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    fk_product           INTEGER NOT NULL,
    month_number         INTEGER NOT NULL CHECK (month_number >= 1 AND month_number <= 12),
    fk_availability_type INTEGER NOT NULL,
    FOREIGN KEY (fk_product) REFERENCES t_product (id),
    FOREIGN KEY (fk_availability_type) REFERENCES t_availability_type (id)
);

COMMIT;

