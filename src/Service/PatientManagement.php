<?php

class PatientManagement
{
    private $conn;
    public const LIMIT = 3;
    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function getAll($page, $search): array
    {
        $limit = self::LIMIT;
        $offset = ($page - 1) * $limit;

        $total_sql = "SELECT COUNT(*) FROM patient WHERE name LIKE :search OR mobile LIKE :search OR department LIKE :search";
        $total_stmt = $this->conn->prepare($total_sql);
        $total_stmt->bindValue(':search', "%$search%", PDO::PARAM_STR);
        $total_stmt->execute();
        $total_records = $total_stmt->fetchColumn();
        $total_pages = $this->getTotalPage($total_records, $limit);

        $sql = "SELECT id, name, mobile AS mob, date_of_birth AS date, doctor_name AS doctor, department 
        FROM patient 
        WHERE name LIKE :search OR mobile LIKE :search OR department LIKE :search
        ORDER BY id DESC
        LIMIT :limit OFFSET :offset";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindValue(':search', "%$search%", PDO::PARAM_STR);
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        $patients = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return ['patients' => $patients, 'totalPages' => $total_pages];
    }

    private function getTotalPage($total_records, $limit)
    {
        return ceil($total_records / $limit);
    }

    public function add($name, $mobile, $date_of_birth, $doctor_name, $department): string
    {
        try {
            $sql = "INSERT INTO patient (name, mobile, date_of_birth, doctor_name, department) 
                    VALUES (:name, :mobile, :date_of_birth, :doctor_name, :department)";
            $stmt = $this->conn->prepare($sql);

            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':mobile', $mobile);
            $stmt->bindParam(':date_of_birth', $date_of_birth);
            $stmt->bindParam(':doctor_name', $doctor_name);
            $stmt->bindParam(':department', $department);

            $stmt->execute();

            return "Patient added successfully!";
        } catch (PDOException $e) {
            return "Error: " . $e->getMessage();
        }
    }

    public function getById($id)
    {
        try {
            $sql = "SELECT * FROM patient WHERE id = :id";
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            throw new Exception("Error fetching patient: " . $e->getMessage());
        }
    }

    public function update($id, $name, $mobile, $date_of_birth, $doctor_name, $department): string
    {
        try {
            $sql = "UPDATE patient SET 
                    name = :name, 
                    mobile = :mobile, 
                    date_of_birth = :date_of_birth, 
                    doctor_name = :doctor_name, 
                    department = :department 
                    WHERE id = :id";
            $stmt = $this->conn->prepare($sql);

            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':mobile', $mobile);
            $stmt->bindParam(':date_of_birth', $date_of_birth);
            $stmt->bindParam(':doctor_name', $doctor_name);
            $stmt->bindParam(':department', $department);

            $stmt->execute();

            return "Patient details updated successfully!";
        } catch (PDOException $e) {
            throw new Exception("Error updating patient: " . $e->getMessage());
        }
    }
}
