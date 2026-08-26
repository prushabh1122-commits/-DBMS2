SET SERVEROUTPUT ON;

DECLARE
    v_attendance NUMBER := 51;
    v_theory NUMBER := 31;
    v_practical NUMBER := 13;
    v_assignment NUMBER := 8;

    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(5);
    v_result VARCHAR2(30);
    v_remark VARCHAR2(50);

BEGIN

    -- Check result
    IF v_attendance < 40 THEN
        v_result := 'DETAINED';
        v_total := 0;
        v_percentage := 0;
        v_grade := 'F';

    ELSIF v_theory < 28 THEN
        v_result := 'FAIL in Theory';
        v_total := v_theory + v_practical + LEAST(v_assignment, 10);
        v_percentage := v_total / 1.2;
        v_grade := 'F';

    ELSIF v_practical < 12 THEN
        v_result := 'FAIL in Practical';
        v_total := v_theory + v_practical + LEAST(v_assignment, 10);
        v_percentage := v_total / 1.2;
        v_grade := 'F';

    ELSE
        v_total := v_theory + v_practical + LEAST(v_assignment, 10);
        v_percentage := v_total / 1.2;

        -- Grade using CASE
        v_grade := CASE
            WHEN v_percentage >= 75 THEN 'A+'
            WHEN v_percentage >= 60 THEN 'A'
            WHEN v_percentage >= 50 THEN 'B'
            WHEN v_percentage >= 40 THEN 'C'
            ELSE 'D'
        END;

        v_result := 'PASS';

    END IF;

    -- Remark
    IF v_result = 'PASS' THEN
        IF v_percentage >= 75 THEN
            v_remark := 'Excellent Performance';
        ELSIF v_percentage >= 60 THEN
            v_remark := 'Very Good Performance';
        ELSE
            v_remark := 'Keep Improving';
        END IF;
    ELSE
        v_remark := 'Needs Improvement';
    END IF;

    -- Print Marksheet
    DBMS_OUTPUT.PUT_LINE('================================');
    DBMS_OUTPUT.PUT_LINE('       LJICA SEMESTER RESULT');
    DBMS_OUTPUT.PUT_LINE('================================');

    DBMS_OUTPUT.PUT_LINE('Attendance: ' || v_attendance || '%');
    DBMS_OUTPUT.PUT_LINE('Theory Marks: ' || v_theory || '/70');
    DBMS_OUTPUT.PUT_LINE('Practical Marks: ' || v_practical || '/30');
    DBMS_OUTPUT.PUT_LINE('Assignment Marks: ' ||
                         LEAST(v_assignment, 10) || '/10');

    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || ROUND(v_percentage, 2) || '%');
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
    DBMS_OUTPUT.PUT_LINE('Remark: ' || v_remark);

    DBMS_OUTPUT.PUT_LINE('================================');

END;
/