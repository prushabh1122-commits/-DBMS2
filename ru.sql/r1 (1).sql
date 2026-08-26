SET SERVEROUTPUT ON;

DECLARE
    v_message VARCHAR2(100) := 'Welcome to PL/SQL!';
    v_roll_no NUMBER := 26;
    v_lucky_number NUMBER;
BEGIN
    -- Calculate lucky number
    v_lucky_number := MOD(v_roll_no, 7) + 1;

    -- Print name and roll number
    DBMS_OUTPUT.PUT_LINE('Name: Manushh');
    DBMS_OUTPUT.PUT_LINE('Roll Number: ' || v_roll_no);

    -- Print message
    DBMS_OUTPUT.PUT_LINE(v_message);

    -- Print lucky number
    DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || v_lucky_number);
END;
/