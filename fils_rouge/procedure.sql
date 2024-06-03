-- Active: 1715778719442@@127.0.0.1@3306@village_green
CREATE PROCEDURE commandeNonRemise()

BEGIN
SELECT C.*
FROM commande C
JOIN utilisateur U on U.`Id_utilisateur`=C.`Id_utilisateur`
WHERE U.reduction=NULL and C.etat_livraison='En cours de livraison';
END


CREATE PROCEDURE delaisMoyenLivraison()

BEGIN
SELECT AVG(DATEDIFF(commande.date_commande, commande.date_facturation))
FROM commande
WHERE commande.date_commande is NOT NULL AND commande.date_facturation is NOT NULL;
END