<?php
require_once '../autoloader.php';
require_once '../src/Service/PatientManagement.php';

use \Smarty\Smarty;

$smarty = new Smarty();
$message = "";
$patient = null;

$patientManagement = new PatientManagement($conn);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $mobile = $_POST['mobile'];
    $date_of_birth = $_POST['date_of_birth'];
    $doctor_name = $_POST['doctor_name'];
    $department = $_POST['department'];

    try {
        $message = $patientManagement->update($id, $name, $mobile, $date_of_birth, $doctor_name, $department);
    } catch (Exception $e) {
        $message = $e->getMessage();
    }
} elseif (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $id = $_GET['id'];

    try {
        $patient = $patientManagement->getById($id);

        if (!$patient) {
            $message = "Patient not found!";
        }
    } catch (Exception $e) {
        $message = $e->getMessage();
    }
} else {
    $message = "Invalid patient ID!";
}

$smarty->assign('message', $message);
$smarty->assign('patient', $patient);

$smarty->display('../templates/patient/edit.tpl');
