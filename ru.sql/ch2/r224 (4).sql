SET SERVEROUTPUT ON;

DECLARE
    v_roll NUMBER := 22;
    v_num NUMBER;
    v_height NUMBER;

BEGIN

    -- Part A: Multiplication table
    v_num := MOD(v_roll, 9) + 2;

    DBMS_OUTPUT.PUT_LINE('--- PART A ---');

    FOR i IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE(v_num || ' x ' || i || ' = ' || v_num * i);
    END LOOP;


    -- Part B: Tables 2, 3, 4, 5
    DBMS_OUTPUT.PUT_LINE('--- PART B ---');

    FOR n IN 2..5 LOOP
        FOR i IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(
                LPAD(n || ' x ' || i || ' = ' || n * i, 15)
            );
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;


    -- Part C: Star triangle
    v_height := 5 + MOD(v_roll, 5);

    DBMS_OUTPUT.PUT_LINE('--- PART C ---');

    FOR i IN 1..v_height LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD('*', i, '*'));
    END LOOP;


    -- Part D: Number pyramid
    DBMS_OUTPUT.PUT_LINE('--- PART D ---');

    FOR i IN 1..6 LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT(j);
        END LOOP;

        DBMS_OUTPUT.NEW_LINE;
    END LOOP;


    -- Part E: Reverse triangle
    DBMS_OUTPUT.PUT_LINE('--- PART E ---');

    FOR i IN REVERSE 1..v_height LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD('*', i, '*'));
    END LOOP;

END;
/