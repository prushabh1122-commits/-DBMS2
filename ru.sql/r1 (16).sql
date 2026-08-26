SET SERVEROUTPUT ON;

DECLARE
    v_amount NUMBER := 2700;

    n500 NUMBER;
    n200 NUMBER;
    n100 NUMBER;
    v_rem NUMBER;

BEGIN
    -- Rs.500 notes
    n500 := TRUNC(v_amount / 500);
    v_rem := MOD(v_amount, 500);

    -- Rs.200 notes
    n200 := TRUNC(v_rem / 200);
    v_rem := MOD(v_rem, 200);

    -- Rs.100 notes
    n100 := TRUNC(v_rem / 100);
    v_rem := MOD(v_rem, 100);

    -- Print note breakup
    DBMS_OUTPUT.PUT_LINE('--- ATM NOTE BREAKUP ---');
    DBMS_OUTPUT.PUT_LINE('Amount: Rs. ' || v_amount);
    DBMS_OUTPUT.PUT_LINE('Rs.500 Notes: ' || n500);
    DBMS_OUTPUT.PUT_LINE('Rs.200 Notes: ' || n200);
    DBMS_OUTPUT.PUT_LINE('Rs.100 Notes: ' || n100);
    DBMS_OUTPUT.PUT_LINE('Remaining Amount: Rs. ' || v_rem);

END;
/