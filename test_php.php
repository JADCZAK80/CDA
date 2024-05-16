<?php
try 
{
    $db = new PDO("mysql:host=localhost;charset=utf8;dbname=test", "admin", "Afpa1234");

    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} 
catch (Exception $e) 
{
    echo 'Erreur : ' . $e->getMessage() . '<br />';
    echo 'N° : ' . $e->getCode();
    die('Fin du script');
}
$start_time = microtime(true);
// Préparation de la requête d'insertion
$stmt = $db->prepare("INSERT INTO test (id, prenom, nom) VALUES (?, ?, ?)");

// Boucle pour insérer 1000 lignes
for ($i = 0; $i < 1000; $i++) {
    // Génération de l'ID aléatoire (ici, on utilise simplement $i)
    $id = $i + 1; // Vous pouvez modifier cette partie si vous générez des ID différemment
    
    // Génération du nom aléatoire (par exemple, une chaîne aléatoire de longueur fixe)
    $nom = generateRandomString(8); // Vous pouvez définir votre propre fonction pour générer une chaîne aléatoire
    
    // Génération du prénom aléatoire
    $prenom = generateRandomString(6); // Vous pouvez définir votre propre fonction pour générer une chaîne aléatoire
    
    // Exécution de la requête avec les données actuelles de la boucle
    $stmt->execute([$id, $prenom, $nom]);
}

echo "1000 lignes insérées avec succès !";

// Fonction pour générer une chaîne aléatoire
function generateRandomString($length = 10) {
    $characters = 'abcdefghijklmnopqrstuvwxyz';
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString;
}
value )