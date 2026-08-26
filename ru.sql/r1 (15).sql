SET SERVEROUTPUT ON;

DECLARE
    c_gst CONSTANT NUMBER := 18;
    v_plan_price NUMBER := 299;
    v_gst NUMBER;
    v_total NUMBER;
    v_validity DATE;

BEGIN
    -- Calculate GST and total
    v_gst := v_plan_price * c_gst / 100;
    v_total := v_plan_price + v_gst;

    -- Validity date
    v_validity := SYSDATE + 28;

    -- Print receipt
    DBMS_OUTPUT.PUT_LINE('==============================');
    DBMS_OUTPUT.PUT_LINE('       JIO RECHARGE RECEIPT');
    DBMS_OUTPUT.PUT_LINE('==============================');

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Plan Name', 20) || 'Jio Rs.299'
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Base Price', 20) ||
        TO_CHAR(v_plan_price, '99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('GST @18%', 20) ||
        TO_CHAR(v_gst, '99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Total Payable', 20) ||
        TO_CHAR(v_total, '99,999.99')
    );

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Validity Date', 20) ||
        TO_CHAR(v_validity, 'DD-MON-YYYY')
    );

    DBMS_OUTPUT.PUT_LINE('==============================');

END;
/