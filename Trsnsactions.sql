-- Atomic block to handle a patient visit completion
BEGIN;

    -- Update the specific appointment status
    UPDATE Appointments 
    SET status = 'Completed' 
    WHERE appointment_id = 1;

    -- Insert the clinical findings
    INSERT INTO Medical_Records (appointment_id, diagnosis, treatment_plan)
    VALUES (1, 'Seasonal Allergies', 'Antihistamines daily for 2 weeks');

COMMIT; -- Ensures both updates happen or none at all