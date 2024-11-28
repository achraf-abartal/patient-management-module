CREATE DATABASE patient_management_module;
use patient_management_module;
CREATE TABLE patient (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(255) NOT NULL,
      mobile VARCHAR(20) NOT NULL,
      date_of_birth DATETIME NOT NULL,
      doctor_name VARCHAR(255) NOT NULL,
      department VARCHAR(255) NOT NULL
);

INSERT INTO patient (name, mobile, date_of_birth, doctor_name, department) VALUES
('Achraf Abartal', '06 12 34 56 78', '1999-06-09', 'Dr. Fatima Benali', 'Pédiatrie'),
('Sara Amrani', '06 23 45 67 89', '1999-06-08', 'Dr. Mohammed El Idrissi', 'Cardiologie'),
('Youssef Boukhriss', '06 34 56 78 90', '2000-06-08', 'Dr. Salma Khattabi', 'Gynécologie'),
('Khadija Bennani', '06 45 67 89 01', '2001-06-10', 'Dr. Hassan El Ouafi', 'Orthopédie'),
('Mehdi El Alaoui', '06 56 78 90 12', '1999-06-10', 'Dr. Nadia Haouzi', 'Dermatologie'),
('Laila Bensalem', '06 67 89 01 23', '1999-06-09', 'Dr. Youssef Khatib', 'Neurologie'),
('Omar El Bakali', '06 78 90 12 34', '1999-11-06', 'Dr. Amina Idrissi', 'Médecine Interne'),
('Fatima Zahra Hajjami', '06 89 01 23 45', '2001-06-09', 'Dr. Rachid Malki', 'Ophtalmologie');
