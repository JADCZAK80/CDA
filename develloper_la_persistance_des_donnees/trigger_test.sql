-- Active: 1715778719442@@127.0.0.1@3306@hotel2

drop trigger insert_reservation2;

CREATE TRIGGER insert_reservation2 BEFORE INSERT ON reservation
FOR EACH ROW
BEGIN
    DECLARE hotel_count INT;

    -- Obtenir l'ID de l'hôtel associé à la nouvelle réservation
    DECLARE hotel_id INT;
    SELECT cha_hot_id INTO hotel_id
    FROM chambre
    WHERE cha_id = NEW.res_cha_id;

    -- Compter le nombre de réservations pour cet hôtel
    SELECT COUNT(*) INTO hotel_count
    FROM reservation
    WHERE res_cha_id IN (SELECT cha_id FROM chambre WHERE cha_hot_id = hotel_id);

    -- Vérifier si le nombre de réservations pour cet hôtel dépasse 10
    IF hotel_count >= 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Nombre de réservation maximal pour l\'hôtel atteint';
    END IF;
END;


insert into station (sta_nom, sta_altitude) values ('test', 100);