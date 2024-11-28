<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Patient</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../public/css/style.css">
</head>
<body>
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
    <h1 class="mb-4">Add New Patient</h1>
    <div class="text-center">
        <a href="list.php" class="btn btn-primary">Back to list</a>
    </div>
    {if $message}
        <div class="alert alert-info">
            {$message}
        </div>
    {/if}
    <form method="POST" action="add.php" class="shadow p-4 rounded">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" id="name" name="name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="mobile" class="form-label">Mobile</label>
            <input type="text" id="mobile" name="mobile" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="date_of_birth" class="form-label">Date of Birth</label>
            <input type="date" id="date_of_birth" name="date_of_birth" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="doctor_name" class="form-label">Doctor Name</label>
            <input type="text" id="doctor_name" name="doctor_name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="department" class="form-label">Department</label>
            <input type="text" id="department" name="department" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Patient</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
