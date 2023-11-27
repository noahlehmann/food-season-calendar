BEGIN TRANSACTION;

INSERT INTO t_availability_type
(id, name, rating)
VALUES
    (1, 'free', 1),             -- Freilandanbau
    (2, 'protected', 2),        -- Geschuetzt durch Folie o.ae.
    (3, 'warehouse', 2),        -- Lagerware und Bestand
    (4, 'greenhouse_basic', 3), -- Unbeheizt oder nur minimal beheiztes Gewaechshaus
    (5, 'greenhouse_heated', 4); -- Beheiztes Gewaechshaus

INSERT INTO t_type
(id, name)
VALUES
    (1, 'fruit');

INSERT INTO t_product
(id, name_german, name_latin, image_url, fk_type)
VALUES
    (1, 'Apfel', 'Malus domestica', 'https://www.gartennatur.com/wp-content/uploads/akb-apfel-frucht.jpg', 1);

INSERT INTO t_availability
(fk_product, month_number, fk_availability_type)
VALUES
    (1, 1, 3),
    (1, 2, 3),
    (1, 3, 3),
    (1, 4, 3),
    (1, 5, 3),
    (1, 6, 3),
    (1, 7, 3),
    (1, 8, 3),
    (1, 8, 1),
    (1, 9, 1),
    (1, 10, 1),
    (1, 11, 1),
    (1, 11, 3),
    (1, 12, 3);

COMMIT;