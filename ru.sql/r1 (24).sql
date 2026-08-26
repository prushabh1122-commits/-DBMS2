SET SERVEROUTPUT ON;

DECLARE
    v_salary NUMBER := 25000;
    v_existing_emi NUMBER := 0;
    v_loan NUMBER := 250000;
    v_rate NUMBER := 9;
    v_months NUMBER := 120;

    v_r NUMBER;
    v_emi NUMBER;
    v_foir NUMBER;
    v_max_loan NUMBER;
    v_approved NUMBER;

BEGIN
    -- Monthly rate
    v_r := v_rate / 12 / 100;

    -- FOIR limit = 40% salary
    v_foir := v_salary * 40 / 100;

    -- Maximum loan = 60 times monthly salary
    v_max_loan := v_salary * 60;

    -- EMI calculation
    v_emi := v_loan * v_r * POWER(1 + v_r, v_months)
             / (POWER(1 + v_r, v_months) - 1);

    -- Check salary
    IF v_salary < 25000 THEN
        v_approved := 0;

    ELSE
        -- Check maximum loan
        IF v_loan > v_max_loan THEN
            v_loan := v_max_loan;

            v_emi := v_loan * v_r * POWER(1 + v_r, v_months)
                     / (POWER(1 + v_r, v_months) - 1);
        END IF;

        -- Reduce loan until EMI fits FOIR
        WHILE v_emi + v_existing_emi > v_foir
        LOOP
            v_loan := v_loan - 10000;

            IF v_loan <= 0 THEN
                v_loan := 0;
                EXIT;
            END IF;

            v_emi := v_loan * v_r * POWER(1 + v_r, v_months)
                     / (POWER(1 + v_r, v_months) - 1);
        END LOOP;

        v_approved := v_loan;
    END IF;

    -- Print result
    DBMS_OUTPUT.PUT_LINE('==============================');
    DBMS_OUTPUT.PUT_LINE('       HDFC/SBI LOAN PORTAL');
    DBMS_OUTPUT.PUT_LINE('==============================');

    DBMS_OUTPUT.PUT_LINE('Monthly Salary: Rs. ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Existing EMI: Rs. ' || v_existing_emi);
    DBMS_OUTPUT.PUT_LINE('Requested Loan: Rs. ' || v_loan);
    DBMS_OUTPUT.PUT_LINE('Calculated EMI: Rs. ' || ROUND(v_emi));
    DBMS_OUTPUT.PUT_LINE('FOIR Limit: Rs. ' || ROUND(v_foir));
    DBMS_OUTPUT.PUT_LINE('Approved Amount: Rs. ' || v_approved);

    -- Decision using CASE
    DBMS_OUTPUT.PUT_LINE(
        'Decision: ' ||
        CASE
            WHEN v_approved = 0 THEN 'REJECTED'
            WHEN v_approved < v_loan THEN 'CONDITIONAL'
            ELSE 'APPROVED'
        END
    );

    DBMS_OUTPUT.PUT_LINE('Monthly Cost: Rs. ' ||
                         ROUND(v_emi + v_existing_emi));

    DBMS_OUTPUT.PUT_LINE('==============================');

END;
/ 