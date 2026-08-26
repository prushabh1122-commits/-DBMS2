SET SERVEROUTPUT ON;

DECLARE
    <<bank>>
    v_bank VARCHAR2(30) := 'LJ Bank';
    v_total_deposit NUMBER := 0;

BEGIN

    DECLARE
        <<branch>>
        v_branch VARCHAR2(30) := 'Ahmedabad';
        v_deposit NUMBER := 5000;

    BEGIN
        -- Add deposit to bank level
        bank.v_total_deposit := bank.v_total_deposit + v_deposit;

        DECLARE
            <<counter>>
            v_token NUMBER := 101;

        BEGIN
            -- Inner block can read both outer levels
            DBMS_OUTPUT.PUT_LINE('Bank: ' || bank.v_bank);
            DBMS_OUTPUT.PUT_LINE('Branch: ' || branch.v_branch);
            DBMS_OUTPUT.PUT_LINE('Token: ' || v_token);
        END;

        -- Uncomment this line to see the error:
        -- DBMS_OUTPUT.PUT_LINE('Token: ' || v_token);
        -- Error: PLS-00201: identifier 'V_TOKEN' must be declared

    END;

    -- Print total deposit at bank level
    DBMS_OUTPUT.PUT_LINE('Total Deposit: Rs. ' || bank.v_total_deposit);

END;
/