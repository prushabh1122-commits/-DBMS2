SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'rushabh Patel';
    v_roll NUMBER := 22;
    v_dob DATE := TO_DATE('15-05-2007', 'DD-MM-YYYY');

    v_id VARCHAR2(30);
    v_age NUMBER;

BEGIN
    -- Convert name to uppercase
    v_name := UPPER(v_name);

    -- Generate Student ID
    v_id := 'LJICA' || TO_CHAR(v_dob, 'YYYY') || LPAD(v_roll, 3, '0');

    -- Calculate age
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    -- Print ID Card
    DBMS_OUTPUT.PUT_LINE('============================');
    DBMS_OUTPUT.PUT_LINE('   LJICA STUDENT ID CARD');
    DBMS_OUTPUT.PUT_LINE('============================');
    DBMS_OUTPUT.PUT_LINE('Name     : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Roll No  : ' || v_roll);
    DBMS_OUTPUT.PUT_LINE('DOB      : ' || TO_CHAR(v_dob, 'DD-MM-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Age      : ' || v_age);
    DBMS_OUTPUT.PUT_LINE('Student ID : ' || v_id);
    DBMS_OUTPUT.PUT_LINE('============================');

END;
/
