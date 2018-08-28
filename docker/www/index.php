<?php
$dsn = 'mysql:dbname=projeto_docker;host=mysql-local;port=3306';
$user = 'docker';
$password = 'docker';
try {
    $pdo = new PDO($dsn, $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $result = $pdo->query("SHOW TABLES LIKE 'contato'");
    $table = $result->fetchAll();
    if (!count($table)) {
        $pdo->exec(
            "CREATE TABLE contato(\n" .
            "    id INT AUTO_INCREMENT NOT NULL,\n" .
            "    firstName VARCHAR(250) NOT NULL,\n" .
            "    lastName VARCHAR(250) NOT NULL,\n" .
            "    email VARCHAR(250) NOT NULL,\n" .
            "    PRIMARY KEY (id)\n" .
            ")");
    }
    $statement = $pdo->prepare("INSERT INTO contato (firstName, lastName, email) VALUES (:firstName, :lastName, :email)");
    $statement->bindParam(':firstName', $firstName);
    $statement->bindParam(':lastName', $lastName);
    $statement->bindParam(':email', $email);
    // insert a row
    $firstName = "Anderson";
    $lastName = "Farias";
    $email = "john@email.com";
    $statement->execute();
    // insert another row
    $firstName = "Mary";
    $lastName = "Moe";
    $email = "mary@email.com";
    $statement->execute();
    // insert another row
    $firstName = "Julie";
    $lastName = "Dooley";
    $email = "julie@email.com";
    $statement->execute();
    echo '<pre>',
        json_encode(
            $pdo->query('SELECT id, firstName, lastName, email FROM contato')->fetchAll(PDO::FETCH_ASSOC),
                JSON_PRETTY_PRINT
        );
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
