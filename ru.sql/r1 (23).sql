SET SERVEROUTPUT ON;

DECLARE
    -- Bug 1: Use := instead of =
    -- Bug 2: VARCHAR2(5) was too small for the value
    v_name VARCHAR2(20) := 'Manush Mistry';

    -- Bug 3: CONSTANT must be given a value at declaration
    v_bonus CONSTANT NUMBER := 2500;

    v_sal NUMBER := 25000;
    v_first_name VARCHAR2(30);  -- Bug 4: Missing semicolon fixed

BEGIN

    -- Bug 5: SELECT inside PL/SQL needs INTO
    SELECT first_name
    INTO v_first_name
    FROM employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('Bonus: ' || v_bonus);

END;
/