SET SERVEROUTPUT ON;

DECLARE
    v_name       VARCHAR2(50) := 'rushabh';
    v_marks      NUMBER(5,2) := 382;
    v_percentage NUMBER(5,2);
    v_dob        DATE := DATE '2007-01-01';
    v_passed     BOOLEAN := TRUE;
BEGIN
    -- Calculate percentage
    v_percentage := (v_marks / 500) * 100;

    -- Print details
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || ROUND(v_percentage, 2));
    DBMS_OUTPUT.PUT_LINE('Today''s Date: ' || SYSDATE);

    -- Check pass or fail
    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Result: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: FAIL');
    END IF;
END;
/
