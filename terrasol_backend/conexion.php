<?php
$servername = "localhost";
$username = "ciisa_backend_v1_eva2_B";
$password = "l4cl4v3-c11s4";
$dbname = "ciisa_backend_v1_eva2_B";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
