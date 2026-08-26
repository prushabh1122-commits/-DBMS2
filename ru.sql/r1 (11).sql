SET SERVEROUTPUT ON;

DECLARE
    v_celsius NUMBER := 37;
    v_fahrenheit NUMBER;
    v_kelvin NUMBER;
    v_f NUMBER := 98.6;
    v_c NUMBER;

BEGIN
    -- Celsius to Fahrenheit
    v_fahrenheit := v_celsius * 9 / 5 + 32;

    -- Celsius to Kelvin
    v_kelvin := v_celsius + 273.15;

    -- Fahrenheit to Celsius
    v_c := (v_f - 32) * 5 / 9;

    -- Print values
    DBMS_OUTPUT.PUT_LINE('Celsius: ' || v_celsius);
    DBMS_OUTPUT.PUT_LINE('Fahrenheit: ' || ROUND(v_fahrenheit, 1));
    DBMS_OUTPUT.PUT_LINE('Kelvin: ' || v_kelvin);
    DBMS_OUTPUT.PUT_LINE('98.6 Fahrenheit = ' || ROUND(v_c, 0) || ' Celsius');

END;
/