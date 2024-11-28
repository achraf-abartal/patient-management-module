<?php
require_once '../autoloader.php';
require_once '../src/Service/PatientManagement.php';

use \Smarty\Smarty;

$smarty = new Smarty();

$name = $mobile = $date_of_birth = $doctor_name = $department = $message = "";

$patientManagement = new PatientManagement($conn);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $mobile = $_POST['mobile'];
    $date_of_birth = $_POST['date_of_birth'];
    $doctor_name = $_POST['doctor_name'];
    $department = $_POST['department'];

    $message = $patientManagement->add($name, $mobile, $date_of_birth, $doctor_name, $department);
}

$smarty->assign('message', $message);

$smarty->display('../templates/patient/add.tpl');
