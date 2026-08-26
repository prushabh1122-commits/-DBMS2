SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(30) := 'Manush Mistry';

    v_m1 NUMBER := 80;
    v_m2 NUMBER := 75;
    v_m3 NUMBER := 68;
    v_m4 NUMBER := 82;
    v_m5 NUMBER := 77;

    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(5);
    v_result VARCHAR2(30);

BEGIN
    -- Calculate total and percentage
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + v_m5;
    v_percentage := v_total / 5;

    -- Grade
    IF v_percentage >= 90 THEN
        v_grade := 'A+';
    ELSIF v_percentage >= 80 THEN
        v_grade := 'A';
    ELSIF v_percentage >= 70 THEN
        v_grade := 'B';
    ELSIF v_percentage >= 60 THEN
        v_grade := 'C';
    ELSIF v_percentage >= 50 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'FAIL';
    END IF;

    -- Check detained
    IF v_m1 < 35 THEN
        v_result := 'DETAINED - Subject 1';
    ELSIF v_m2 < 35 THEN
        v_result := 'DETAINED - Subject 2';
    ELSIF v_m3 < 35 THEN
        v_result := 'DETAINED - Subject 3';
    ELSIF v_m4 < 35 THEN
        v_result := 'DETAINED - Subject 4';
    ELSIF v_m5 < 35 THEN
        v_result := 'DETAINED - Subject 5';
    ELSE
        -- All subjects passed
        IF v_percentage >= 75 THEN
            v_result := 'Distinction';
        ELSIF v_percentage >= 60 THEN
            v_result := 'First';
        ELSIF v_percentage >= 50 THEN
            v_result := 'Second';
        ELSE
            v_result := 'Pass';
        END IF;
    END IF;

    -- Print Report Card
    DBMS_OUTPUT.PUT_LINE('==============================');
    DBMS_OUTPUT.PUT_LINE('       REPORT CARD');
    DBMS_OUTPUT.PUT_LINE('==============================');
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Subject 1: ' || v_m1);
    DBMS_OUTPUT.PUT_LINE('Subject 2: ' || v_m2);
    DBMS_OUTPUT.PUT_LINE('Subject 3: ' || v_m3);
    DBMS_OUTPUT.PUT_LINE('Subject 4: ' || v_m4);
    DBMS_OUTPUT.PUT_LINE('Subject 5: ' || v_m5);
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
    DBMS_OUTPUT.PUT_LINE('==============================');

END;
/