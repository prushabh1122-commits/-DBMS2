SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'rushabh';
    v_dob DATE := TO_DATE('15-05-2007', 'DD-MM-YYYY');
    v_roll NUMBER := 22;

    v_pnr VARCHAR2(30);
    v_journey DATE;
    v_fare NUMBER;
    v_age NUMBER;
    v_final_fare NUMBER;

BEGIN
    -- Generate PNR
    v_pnr := 'GJ' || TO_CHAR(SYSDATE, 'YYMM') ||
             LPAD(v_roll, 4, '0');

    -- Journey date
    v_journey := SYSDATE + (MOD(v_roll, 30) + 1);

    -- Base fare
    v_fare := v_roll * 50 + 200;

    -- Calculate age
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    -- Senior citizen concession
    IF v_age >= 60 THEN
        v_final_fare := v_fare * 60 / 100;
    ELSE
        v_final_fare := v_fare;
    END IF;

    -- Print ticket
    DBMS_OUTPUT.PUT_LINE('================================');
    DBMS_OUTPUT.PUT_LINE('       IRCTC RAILWAY TICKET');
    DBMS_OUTPUT.PUT_LINE('================================');

    DBMS_OUTPUT.PUT_LINE(RPAD('Passenger', 15) || v_name);
    DBMS_OUTPUT.PUT_LINE(RPAD('PNR', 15) || v_pnr);
    DBMS_OUTPUT.PUT_LINE(RPAD('Roll No', 15) || LPAD(v_roll, 4, '0'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Age', 15) || v_age);
    DBMS_OUTPUT.PUT_LINE(RPAD('Journey Date', 15) ||
                         TO_CHAR(v_journey, 'Day, DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Fare', 15) ||
                         'Rs. ' || TO_CHAR(v_fare, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Final Fare', 15) ||
                         'Rs. ' || TO_CHAR(v_final_fare, '99,999.00'));

    DBMS_OUTPUT.PUT_LINE('================================');

END;
/
