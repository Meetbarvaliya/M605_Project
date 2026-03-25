-- Function to update appointment status automatically
CREATE OR REPLACE FUNCTION fn_AutoLinkRecord()
RETURNS TRIGGER AS $$
BEGIN
    -- When a medical record is created, the appointment is officially "Completed" 
    UPDATE Appointments 
    SET status = 'Completed' 
    WHERE appointment_id = NEW.appointment_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_AfterMedicalRecordInsert
AFTER INSERT ON Medical_Records
FOR EACH ROW
EXECUTE FUNCTION fn_AutoLinkRecord();