CREATE View article_fournisseur
AS
SELECT article.*, fournisseur.*
FROM article
JOIN fournit on fournit.`Id_article`=article.`Id_article`
JOIN fournisseur ON fournit.numéro_fournisseur=fournit.numéro_fournisseur;

CREATE View article_rubrique
AS
SELECT a.`Id_article`, a.image as "article_image", a.libelle as "article_libelle", a.libelle_court as "article_libelle_court", a.`prix_HT`as "article_prixHT",
s.`Id_sous_rubrique`, s.image as "sous_rubrique_image", s.libelle as "sous_rubrique_libelle", s.libelle_court as "sous_rubrique_libelle_court",
r.`Id_Rubrique` , r.image as "rubrique_image", r.libelle as "rubrique_libelle", r.libelle_court as "rubrique_libelle_court"
FROM article a
JOIN sous_rubrique s ON a.`Id_sous_rubrique`=s.`Id_sous_rubrique`
JOIN rubrique r on r.`Id_Rubrique`=s.`Id_Rubrique`;