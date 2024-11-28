<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Healthcare Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../public/css/style.css">
</head>
<body class="bg-light">
<div class="row container">
    <div class="col-3" id="sidebar">
        <div>
            <img src="../public/images/logo.png" alt="">
        </div>
        <div class="mt-5 nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a onclick="alert('only Patients tab works!')" class="nav-link">Dashboard</a>
            <a href="list.php" class="nav-link active">Patients</a>
            <a onclick="alert('only Patients tab works!')" class="nav-link">Doctor</a>
            <a onclick="alert('only Patients tab works!')" class="nav-link">Payment</a>
            <a onclick="alert('only Patients tab works!')" class="nav-link">E-Channeling</a>
        </div>
    </div>
    <div class="container mt-5 col-9">
        <h1 class="text-center mb-4">Healthcare Management System</h1>
        <div class="text-center">
            <a href="add.php" class="btn btn-primary">Add</a>
        </div>

        <form method="GET" action="list.php" class="mb-4">
            <div class="input-group">
                <input type="text" name="search" class="form-control"
                       placeholder="Search by name, mobile, or department"
                       value="{$search|escape}">
                <button class="btn btn-primary" type="submit">Search</button>
            </div>
        </form>

        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                <tr>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Date</th>
                    <th>Doctor</th>
                    <th>Department</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                {if $patients|@count > 0}
                    {foreach $patients as $patient}
                        <tr>
                            <td>{$patient.name|escape}</td>
                            <td>{$patient.mob|escape}</td>
                            <td>{$patient.date|date_format:"%Y-%m-%d"}</td>
                            <td>{$patient.doctor|escape}</td>
                            <td>{$patient.department|escape}</td>
                            <td>
                                <a href="edit.php?id={$patient.id}" class="btn btn-warning btn-sm">Edit</a>
                                <a href="delete.php?id={$patient.id}" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this patient?');">Delete</a>
                            </td>
                        </tr>
                    {/foreach}
                {else}
                    <tr>
                        <td colspan="6" class="text-center">No patients found</td>
                    </tr>
                {/if}
                </tbody>
            </table>
        </div>

        <nav>
            <ul class="pagination justify-content-center">
                {if $current_page > 1}
                    <li class="page-item">
                        <a class="page-link" href="?search={$search|escape}&page={$current_page - 1}">Previous</a>
                    </li>
                {/if}
                {section name=page loop=$total_pages+1 start=1}
                    <li class="page-item {if $current_page == $smarty.section.page.index}active{/if}">
                        <a class="page-link" href="?search={$search|escape}&page={$smarty.section.page.index}">
                            {$smarty.section.page.index}
                        </a>
                    </li>
                {/section}
                {if $current_page < $total_pages}
                    <li class="page-item">
                        <a class="page-link" href="?search={$search|escape}&page={$current_page + 1}">Next</a>
                    </li>
                {/if}
            </ul>
        </nav>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
