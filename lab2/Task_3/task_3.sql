create or replace NONEDITIONABLE TRIGGER cascade_delete_stud_group
AFTER DELETE ON GROUPS
FOR EACH ROW
BEGIN
    DELETE FROM STUDENTS WHERE GROUP_ID = :OLD.ID;
END;