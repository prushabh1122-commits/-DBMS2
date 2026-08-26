SET SERVEROUTPUT ON;

DECLARE
    v_n NUMBER := 2;
    v_last_day DATE;
    v_next_monday DATE;
    v_days_left NUMBER;

BEGIN
    -- Last day of current month
    v_last_day := LAST_DAY(SYSDATE);

    -- Next Monday
    v_next_monday := NEXT_DAY(SYSDATE, 'MONDAY');

    -- Days left in month
    v_days_left := TRUNC(v_last_day - SYSDATE);

    -- Print output
    DBMS_OUTPUT.PUT_LINE('Today: ' ||
        TO_CHAR(SYSDATE, 'Day, DD "th" Month YYYY'));

    DBMS_OUTPUT.PUT_LINE('Date after ' || v_n || ' months: ' ||
        TO_CHAR(ADD_MONTHS(SYSDATE, v_n), 'DD-MM-YYYY'));

    DBMS_OUTPUT.PUT_LINE('Last day of current month: ' ||
        TO_CHAR(v_last_day, 'DD-MM-YYYY'));

    DBMS_OUTPUT.PUT_LINE('Next Monday: ' ||
        TO_CHAR(v_next_monday, 'DD-MM-YYYY'));

    DBMS_OUTPUT.PUT_LINE('Days left in this month: ' || v_days_left);

END;
/