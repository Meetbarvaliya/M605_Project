-- View complete patient clinical history (3-way JOIN) 
SELECT 
    p.full_name AS Patient,
    d.full_name AS Doctor,
    a.appointment_date,
    m.diagnosis,
    m.treatment_plan
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
LEFT JOIN Medical_Records m ON a.appointment_id = m.appointment_id
ORDER BY a.appointment_date DESC;