-- Speed up doctor lookups within departments
CREATE INDEX idx_doctors_dept ON Doctors(dept_id);

-- Optimize appointment scheduling checks and history retrieval
CREATE INDEX idx_appointments_date ON Appointments(appointment_date);
CREATE INDEX idx_appointments_patient ON Appointments(patient_id);

-- Fast patient search by phone (common in reception desks)
CREATE INDEX idx_patients_phone ON Patients(phone_number);