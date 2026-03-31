<?php
$host = "localhost";
$db = "VendaFrutas";
$user = "root";
$pass = '';
$conn = new mysqli ($host, $user, $pass, $db);
if ($conn->conect_error) {
    die('Erro na conexão: ' . $conn->connect_error);
}
?>