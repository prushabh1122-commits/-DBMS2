SET SERVEROUTPUT ON;

DECLARE
    v_units NUMBER := 100;
    c_rate CONSTANT NUMBER := 5;
    c_fixed CONSTANT NUMBER := 70;

    v_energy_charge NUMBER;
    v_total NUMBER;

BEGIN
    -- Calculate electricity charges
    v_energy_charge := v_units * c_rate;
    v_total := v_energy_charge + c_fixed;

    -- Print Electricity Bill
    DBMS_OUTPUT.PUT_LINE('--- TORRENT POWER BILL ---');
    DBMS_OUTPUT.PUT_LINE('Consumer Name: Manush');
    DBMS_OUTPUT.PUT_LINE('Units Consumed: ' || v_units);
    DBMS_OUTPUT.PUT_LINE('Energy Charge: Rs. ' || v_energy_charge);
    DBMS_OUTPUT.PUT_LINE('Fixed Charge: Rs. ' || c_fixed);
    DBMS_OUTPUT.PUT_LINE('Total Bill: Rs. ' || v_total);

END;
/