SET SERVEROUTPUT ON;

DECLARE
    v_m1 NUMBER := 70;
    v_m2 NUMBER := 65;
    v_m3 NUMBER := 80;
    v_m4 NUMBER := 75;
    v_m5 NUMBER := NULL;

    v_total NUMBER;
    v_percentage NUMBER;
    v_passed BOOLEAN;

BEGIN
    -- NVL changes NULL marks to 0
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + NVL(v_m5, 0);

    v_percentage := (v_total / 500) * 100;

    v_passed := (v_percentage >= 40);

    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage);

    -- BOOLEAN cannot be directly printed using DBMS_OUTPUT.PUT_LINE
    -- So, use IF to convert BOOLEAN into text.
    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Result: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: FAIL');
    END IF;

END;
/