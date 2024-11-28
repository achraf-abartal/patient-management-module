<?php

$host = 'mysql:host=localhost;dbname=patient_management_module;charset=utf8';
$username = 'root';
$password = '';

try {
    $conn = new PDO($host, $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
