<?php
require_once '../autoloader.php';
require_once '../src/Service/PatientManagement.php';

$patientManagement = new PatientManagement($conn);

use \Smarty\Smarty;

$smarty = new Smarty();

$page = isset($_GET['page']) && is_numeric($_GET['page']) ? $_GET['page'] : 1;
$search = $_GET['search'] ?? '';

$result = $patientManagement->getAll($page, $search);
$patients = $result['patients'];
$total_pages = $result['totalPages'];

$smarty->assign('patients', $patients);
$smarty->assign('total_pages', $total_pages);
$smarty->assign('current_page', $page);
$smarty->assign('search', $search);

$smarty->display('../templates/patient/list.tpl');
