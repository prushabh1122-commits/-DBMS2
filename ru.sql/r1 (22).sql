SET SERVEROUTPUT ON;

DECLARE
    v_qty NUMBER := 5;
    v_price NUMBER := 100;
    v_coupon NUMBER := NULL;

    v_gross NUMBER;
    v_discount NUMBER;
    v_taxable NUMBER;
    v_cgst NUMBER;
    v_sgst NUMBER;
    v_total NUMBER;

BEGIN
    v_gross := v_qty * v_price;

    v_discount := v_gross * NVL(v_coupon, 0) / 100;
    v_taxable := v_gross - v_discount;

    v_cgst := v_taxable * 9 / 100;
    v_sgst := v_taxable * 9 / 100;

    v_total := ROUND(v_taxable + v_cgst + v_sgst);

    DBMS_OUTPUT.PUT_LINE('--- KIRANA STORE BILL ---');
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_qty);
    DBMS_OUTPUT.PUT_LINE('Price: Rs. ' || v_price);
    DBMS_OUTPUT.PUT_LINE('Gross: Rs. ' || v_gross);
    DBMS_OUTPUT.PUT_LINE('Discount: Rs. ' || v_discount);
    DBMS_OUTPUT.PUT_LINE('Taxable: Rs. ' || v_taxable);
    DBMS_OUTPUT.PUT_LINE('CGST: Rs. ' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('SGST: Rs. ' || v_sgst);
    DBMS_OUTPUT.PUT_LINE(
        NVL2(v_coupon, 'Coupon applied: ' || v_coupon || '%', 'No coupon')
    );
    DBMS_OUTPUT.PUT_LINE('Final Total: Rs. ' || v_total);

END;
/