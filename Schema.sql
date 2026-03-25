-- 1. Departments Table
CREATE TABLE Departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Doctors Table
CREATE TABLE Doctors (
    doctor_id SERIAL PRIMARY KEY,
    dept_id INT REFERENCES Departments(dept_id) ON DELETE RESTRICT,
    full_name VARCHAR(150) NOT NULL,
    license_number VARCHAR(50) NOT NULL UNIQUE,
    specialization VARCHAR(100)
);

-- 3. Patients Table
CREATE TABLE Patients (
    patient_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20) NOT NULL
);

-- 4. Appointments Table
CREATE TABLE Appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL REFERENCES Patients(patient_id),
    doctor_id INT NOT NULL REFERENCES Doctors(doctor_id),
    appointment_date TIMESTAMP NOT NULL,
    status VARCHAR(20) DEFAULT 'Scheduled' CHECK (status IN ('Scheduled', 'Completed', 'Cancelled', 'No-Show')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Medical_Records Table
CREATE TABLE Medical_Records (
    record_id SERIAL PRIMARY KEY,
    appointment_id INT UNIQUE NOT NULL REFERENCES Appointments(appointment_id),
    diagnosis TEXT NOT NULL,
    treatment_plan TEXT,
    prescription_notes TEXT,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);