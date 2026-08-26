SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := '  manush  MISTRY  ';
    v_name VARCHAR2(50) := '  pankti  PATEL  ';
    v_name VARCHAR2(50) := '  rahul  SHARMA  ';
     v_name VARCHAR2(50) := '  priya  SHAH  ';
    v_name VARCHAR2(50) := '  jay  PATEL  ';

    v_clean VARCHAR2(50);
    v_first VARCHAR2(20);
    v_last VARCHAR2(20);
    v_email VARCHAR2(50);

BEGIN
    v_clean := TRIM(v_name);

    v_clean := REPLACE(v_clean, '  ', ' ');
    v_clean := REPLACE(v_clean, '  ', ' ');

    v_clean := INITCAP(v_clean);

    v_first := SUBSTR(v_clean, 1, INSTR(v_clean, ' ') - 1);
    v_last := SUBSTR(v_clean, INSTR(v_clean, ' ') + 1);

    v_email := LOWER(v_first || '.' || v_last || '@ljku.edu.in');

    DBMS_OUTPUT.PUT_LINE('Cleaned Name: ' || v_clean);
    DBMS_OUTPUT.PUT_LINE('First Name: ' || v_first);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || v_last);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);
    DBMS_OUTPUT.PUT_LINE('Length Before: ' || LENGTH(v_name));
    DBMS_OUTPUT.PUT_LINE('Length After: ' || LENGTH(v_clean));

END;
/