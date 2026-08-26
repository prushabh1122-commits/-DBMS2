SET SERVEROUTPUT ON;

DECLARE
    v_roll NUMBER := 22;

    v_n NUMBER;
    a NUMBER := 0;
    b NUMBER := 1;
    c NUMBER;

    v_num NUMBER;
    v_prime BOOLEAN;
    v_count NUMBER := 0;

    v_a NUMBER := 48;
    v_b NUMBER := 18;
    r NUMBER;

    v_perfect NUMBER := 6;
    v_sum NUMBER := 0;

BEGIN

    -- PART A: Fibonacci
    v_n := 5 + MOD(v_roll, 8);

    DBMS_OUTPUT.PUT_LINE('--- PART A: FIBONACCI ---');

    FOR i IN 1..v_n LOOP
        DBMS_OUTPUT.PUT_LINE(a);

        c := a + b;
        a := b;
        b := c;
    END LOOP;


    -- PART B: Check Nth Fibonacci number
    -- For N = 7, the 7th Fibonacci number is 8
    v_num := 8;
    v_prime := TRUE;

    v_count := 2;

    WHILE v_count <= v_num / 2 LOOP
        IF MOD(v_num, v_count) = 0 THEN
            v_prime := FALSE;
            EXIT;
        END IF;

        v_count := v_count + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('--- PART B ---');

    IF v_prime THEN
        DBMS_OUTPUT.PUT_LINE(v_num || ' is Prime');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num || ' is Not Prime');
    END IF;


    -- PART C: Primes from 1 to 100
    DBMS_OUTPUT.PUT_LINE('--- PART C: PRIMES 1 TO 100 ---');

    v_count := 0;

    FOR i IN 2..100 LOOP
        v_prime := TRUE;
        v_num := 2;

        WHILE v_num <= i / 2 LOOP
            IF MOD(i, v_num) = 0 THEN
                v_prime := FALSE;
                EXIT;
            END IF;

            v_num := v_num + 1;
        END LOOP;

        IF v_prime THEN
            DBMS_OUTPUT.PUT_LINE(i);
            v_count := v_count + 1;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Primes: ' || v_count);


    -- PART D: GCD using Euclidean Algorithm
    DBMS_OUTPUT.PUT_LINE('--- PART D: GCD ---');

    WHILE v_b != 0 LOOP
        r := MOD(v_a, v_b);
        v_a := v_b;
        v_b := r;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('GCD: ' || v_a);


    -- PART E: Perfect Number
    DBMS_OUTPUT.PUT_LINE('--- PART E: PERFECT NUMBER ---');

    FOR i IN 1..v_perfect / 2 LOOP
        IF MOD(v_perfect, i) = 0 THEN
            v_sum := v_sum + i;
        END IF;
    END LOOP;

    IF v_sum = v_perfect THEN
        DBMS_OUTPUT.PUT_LINE(v_perfect || ' is a Perfect Number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_perfect || ' is Not a Perfect Number');
    END IF;

END;
/