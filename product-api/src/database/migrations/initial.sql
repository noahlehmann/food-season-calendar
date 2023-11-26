BEGIN TRANSACTION;
CREATE TABLE "users"
(
    "id"       INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name"     text,
    "email"    text UNIQUE,
    "password" text
);

INSERT INTO users
(name,email,password)
VALUES
    ('noah',
     'test@mail.com',
     'pw');
COMMIT;
