<?php
require_once '../autoloader.php';
require_once '../config/connect_database.php';

$message = "";

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $id = $_GET['id'];

    try {
        $sql = "DELETE FROM patient WHERE id = :id";
        $stmt = $conn->prepare($sql);

        $stmt->bindParam(':id', $id, PDO::PARAM_INT);

        if ($stmt->execute()) {
            $message = "Patient deleted successfully! - 
                        <div class='text-center'>
                            <a href='list.php' class='btn btn-primary'>Back to list</a>
                        </div>";
        } else {
            $message = "Failed to delete the patient.";
        }
    } catch (PDOException $e) {
        $message = "Error: " . $e->getMessage();
    }
} else {
    $message = "Invalid or missing patient ID.";
}

echo $message;

$conn = null;
