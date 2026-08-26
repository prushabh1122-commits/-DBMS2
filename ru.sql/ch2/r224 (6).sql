SET SERVEROUTPUT ON;

DECLARE
    v_food NUMBER := 350;
    v_distance NUMBER := 5;
    v_rain VARCHAR2(1) := 'Y';
    v_base NUMBER;
    v_rain_charge NUMBER;
    v_final NUMBER;

BEGIN

    -- Base charge
    IF v_distance < 3 THEN
        v_base := 0;
    ELSIF v_distance <= 8 THEN
        v_base := 29;
    ELSIF v_distance <= 15 THEN
        v_base := 49;
    ELSE
        v_base := 79;
    END IF;

    -- Rain surcharge using CASE
    v_rain_charge := CASE
        WHEN v_rain = 'Y' THEN v_base * 20 / 100
        ELSE 0
    END;

    -- Discount
    IF v_food > 499 THEN
        v_final := 0;
    ELSE
        v_final := v_base + v_rain_charge;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Food Total: Rs. ' || v_food);
    DBMS_OUTPUT.PUT_LINE('Base Charge: Rs. ' || v_base);
    DBMS_OUTPUT.PUT_LINE('Rain Surcharge: Rs. ' || ROUND(v_rain_charge));
    DBMS_OUTPUT.PUT_LINE('Final Delivery: Rs. ' || ROUND(v_final));
    DBMS_OUTPUT.PUT_LINE('Grand Total: Rs. ' ||
                         (v_food + ROUND(v_final)));

END;
/