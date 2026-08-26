SET SERVEROUTPUT ON;

DECLARE
    -- Part A: GST Variables
    c_gst_rate CONSTANT NUMBER := 18;
    v_base_price NUMBER := 1000;
    v_cgst NUMBER;
    v_sgst NUMBER;
    v_total NUMBER;

    -- Part B: City Variable
    v_city VARCHAR2(50) := NULL;

BEGIN
    -- Calculate GST
    v_cgst := v_base_price * 9 / 100;
    v_sgst := v_base_price * 9 / 100;
    v_total := v_base_price + v_cgst + v_sgst;

    DBMS_OUTPUT.PUT_LINE('--- GST DETAILS ---');
    DBMS_OUTPUT.PUT_LINE('Base Price: ' || v_base_price);
    DBMS_OUTPUT.PUT_LINE('CGST Amount (9%): ' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('SGST Amount (9%): ' || v_sgst);
    DBMS_OUTPUT.PUT_LINE('Total Amount: ' || v_total);

    -- NVL Example
    DBMS_OUTPUT.PUT_LINE('--- NVL EXAMPLE ---');
    DBMS_OUTPUT.PUT_LINE('City: ' || NVL(v_city, 'Ahmedabad'));

    -- NVL2 Example
    DBMS_OUTPUT.PUT_LINE('--- NVL2 EXAMPLE ---');
    DBMS_OUTPUT.PUT_LINE(
        NVL2(v_city, 'City Known: ' || v_city, 'City Unknown')
    );

END;
/