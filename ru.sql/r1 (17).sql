SET SERVEROUTPUT ON;

DECLARE
    v_p NUMBER := 500000;
    v_rate NUMBER := 9;
    v_years NUMBER := 5;

    r NUMBER;
    n NUMBER;
    v_emi NUMBER;
    v_total NUMBER;
    v_interest NUMBER;

BEGIN
    r := v_rate / 12 / 100;
    n := v_years * 12;

    v_emi := v_p * r * POWER(1+r,n) /
             (POWER(1+r,n)-1);

    v_total := v_emi * n;
    v_interest := v_total - v_p;

    DBMS_OUTPUT.PUT_LINE('--- SBI HOME LOAN ---');
    DBMS_OUTPUT.PUT_LINE('Principal: Rs. ' ||
        TO_CHAR(v_p, '99,99,999.99'));

    DBMS_OUTPUT.PUT_LINE('EMI: Rs. ' ||
        TO_CHAR(v_emi, '99,99,999.99'));

    DBMS_OUTPUT.PUT_LINE('Total Payment: Rs. ' ||
        TO_CHAR(v_total, '99,99,999.99'));

    DBMS_OUTPUT.PUT_LINE('Total Interest: Rs. ' ||
        TO_CHAR(v_interest, '99,99,999.99'));

END;
/