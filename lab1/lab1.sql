CREATE TABLE MyTable (
  id NUMBER,
  val NUMBER
);

select * from mytable

DECLARE
  n INTEGER := 10000;
BEGIN
  FOR i IN 1..n LOOP
    INSERT INTO MyTable (id, val)
    VALUES (i, ROUND(DBMS_RANDOM.VALUE(1, 100)));
  END LOOP;
  
  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('10 000 записей успешно добавлены.');
END;
/


CREATE OR REPLACE FUNCTION CheckEvenOddCount RETURN VARCHAR2 IS
  evenCount NUMBER := 0;
  oddCount NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO evenCount
  FROM MyTable
  WHERE MOD(val, 2) = 0;

  SELECT COUNT(*) INTO oddCount
  FROM MyTable
  WHERE MOD(val, 2) <> 0;

  IF evenCount > oddCount THEN
    RETURN 'TRUE';
  ELSIF evenCount < oddCount THEN
    RETURN 'FALSE';
  ELSE
    RETURN 'EQUAL';
  END IF;
END;
/

SELECT CheckEvenOddCount FROM dual;