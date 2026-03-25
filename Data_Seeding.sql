-- Seeding Departments
INSERT INTO Departments (dept_name) VALUES ('General Medicine'), ('Pediatrics'), ('Orthopedics');

-- Seeding Doctors
INSERT INTO Doctors (dept_id, full_name, license_number, specialization) VALUES 
(1, 'Doctor 1', 'LIC-1001', 'Internal Medicine'),
(2, 'Doctor 2', 'LIC-1002', 'Child Care');

-- Seeding Patients
INSERT INTO Patients (full_name, date_of_birth, gender, phone_number) VALUES 
('Patient 1', '1990-05-15', 'M', '555-0101'),
('Patient 2', '1985-11-22', 'F', '555-0202');

-- Seeding Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES 
(1, 1, '2026-04-10 10:00:00', 'Completed'),
(2, 2, '2026-04-11 11:30:00', 'Scheduled');

-- Seeding Medical Records
INSERT INTO Medical_Records (appointment_id, diagnosis, treatment_plan) VALUES 
(1, 'Common Cold', 'Rest and hydration for 3 days.');