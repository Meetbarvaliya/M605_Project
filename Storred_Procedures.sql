-- Procedure to safely book an appointment
CREATE OR REPLACE PROCEDURE sp_BookAppointment(
    p_patient_id INT,
    p_doctor_id INT,
    p_date TIMESTAMP
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Transactions ensure the appointment isn't lost if the system hangs 
    INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status)
    VALUES (p_patient_id, p_doctor_id, p_date, 'Scheduled');
    
    COMMIT;
END;
$$;