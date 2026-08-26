SET SERVEROUTPUT ON;

DECLARE
    v_balance NUMBER := 22 * 500 + 5000;
    v_choice NUMBER := 1;
    v_amount NUMBER := 2000;

    v_txns NUMBER := 0;
    v_total_withdrawn NUMBER := 0;
    v_count NUMBER := 0;

BEGIN
    LOOP
        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE('--- ATM MENU ---');
        DBMS_OUTPUT.PUT_LINE('1. Withdraw');
        DBMS_OUTPUT.PUT_LINE('2. Balance');
        DBMS_OUTPUT.PUT_LINE('3. Exit');

        -- Simulate different choices
        IF v_count = 1 THEN
            v_choice := 1;
            v_amount := 2000;
        ELSIF v_count = 2 THEN
            v_choice := 1;
            v_amount := 1500;
        ELSIF v_count = 3 THEN
            v_choice := 2;
        ELSE
            v_choice := 3;
        END IF;

        -- Exit
        IF v_choice = 3 THEN
            DBMS_OUTPUT.PUT_LINE('ATM Exit.');
            EXIT;
        END IF;

        -- Withdrawal
        IF v_choice = 1 THEN

            IF v_amount <= 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Amount must be greater than 0');

            ELSIF MOD(v_amount, 100) != 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Amount must be multiple of 100');

            ELSIF v_amount > 10000 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Maximum withdrawal is Rs.10000');

            ELSIF v_amount > v_balance THEN
                DBMS_OUTPUT.PUT_LINE('Error: Insufficient balance');

            ELSE
                v_balance := v_balance - v_amount;
                v_txns := v_txns + 1;
                v_total_withdrawn := v_total_withdrawn + v_amount;

                DBMS_OUTPUT.PUT_LINE('--- TRANSACTION RECEIPT ---');
                DBMS_OUTPUT.PUT_LINE('Withdrawn: Rs. ' || v_amount);
                DBMS_OUTPUT.PUT_LINE('Balance: Rs. ' || v_balance);
            END IF;

        ELSIF v_choice = 2 THEN
            DBMS_OUTPUT.PUT_LINE('Current Balance: Rs. ' || v_balance);
        END IF;

        -- Exit if balance becomes zero
        IF v_balance = 0 THEN
            EXIT;
        END IF;

    END LOOP;

    -- Final Summary
    DBMS_OUTPUT.PUT_LINE('==============================');
    DBMS_OUTPUT.PUT_LINE('       FINAL SUMMARY');
    DBMS_OUTPUT.PUT_LINE('==============================');
    DBMS_OUTPUT.PUT_LINE('Transactions Done: ' || v_txns);
    DBMS_OUTPUT.PUT_LINE('Total Withdrawn: Rs. ' || v_total_withdrawn);
    DBMS_OUTPUT.PUT_LINE('Closing Balance: Rs. ' || v_balance);

END;
/