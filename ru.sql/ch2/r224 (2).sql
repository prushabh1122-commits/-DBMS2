SET SERVEROUTPUT ON;

DECLARE
    v_salary NUMBER := 1200000;

    v_standard_deduction NUMBER := 75000;
    v_taxable NUMBER;
    v_tax NUMBER := 0;
    v_tds NUMBER;
    v_monthly_salary NUMBER;
    v_take_home NUMBER;

BEGIN
    -- Taxable income
    v_taxable := v_salary - v_standard_deduction;

    -- Calculate tax using SEARCHED CASE
    v_tax := CASE
        WHEN v_taxable <= 300000 THEN 0
        WHEN v_taxable <= 700000 THEN
            (v_taxable - 300000) * 5 / 100
        WHEN v_taxable <= 1000000 THEN
            20000 + (v_taxable - 700000) * 10 / 100
        WHEN v_taxable <= 1200000 THEN
            50000 + (v_taxable - 1000000) * 15 / 100
        WHEN v_taxable <= 1500000 THEN
            80000 + (v_taxable - 1200000) * 20 / 100
        ELSE
            140000 + (v_taxable - 1500000) * 30 / 100
    END;

    -- Monthly TDS
    v_tds := v_tax / 12;

    -- Monthly salary
    v_monthly_salary := v_salary / 12;

    -- Take-home salary
    v_take_home := v_monthly_salary - v_tds;

    -- Print breakdown
    DBMS_OUTPUT.PUT_LINE('--- NEW TAX REGIME 2024-25 ---');
    DBMS_OUTPUT.PUT_LINE('Gross Salary: Rs. ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Standard Deduction: Rs. ' ||
                         v_standard_deduction);
    DBMS_OUTPUT.PUT_LINE('Taxable Income: Rs. ' || v_taxable);
    DBMS_OUTPUT.PUT_LINE('Total Tax: Rs. ' || v_tax);
    DBMS_OUTPUT.PUT_LINE('Monthly TDS: Rs. ' || ROUND(v_tds, 2));
    DBMS_OUTPUT.PUT_LINE('Monthly Salary: Rs. ' ||
                         ROUND(v_monthly_salary, 2));
    DBMS_OUTPUT.PUT_LINE('Take-Home Monthly: Rs. ' ||
                         ROUND(v_take_home, 2));

    IF v_tax = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No tax this year - save more with PPF/ELSS!');
    END IF;

END;
/