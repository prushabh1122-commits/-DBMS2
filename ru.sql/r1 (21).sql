SET SERVEROUTPUT ON;

-- Create table
CREATE TABLE employees (
    employee_id NUMBER,
    first_name VARCHAR2(30),
    last_name VARCHAR2(30),
    job_id VARCHAR2(20),
    salary NUMBER
);

-- Insert employee
INSERT INTO employees
VALUES (100, 'rushabh', 'ambani', 'IT_PROG', 50000);

COMMIT;


-- Salary Slip
DECLARE
    v_emp employees%ROWTYPE;

    v_da NUMBER;
    v_hra NUMBER;
    v_pf NUMBER;
    v_net NUMBER;

BEGIN
    -- Fetch employee
    SELECT *
    INTO v_emp
    FROM employees
    WHERE employee_id = 100;

    -- Calculate
    v_da := v_emp.salary * 40 / 100;
    v_hra := v_emp.salary * 20 / 100;
    v_pf := v_emp.salary * 12 / 100;

    v_net := v_emp.salary + v_da + v_hra - v_pf;

    -- Print
    DBMS_OUTPUT.PUT_LINE('==============================');
    DBMS_OUTPUT.PUT_LINE('        LJ COMPANY');
    DBMS_OUTPUT.PUT_LINE('        SALARY SLIP');
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'Month YYYY'));
    DBMS_OUTPUT.PUT_LINE('==============================');

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' ||
        v_emp.first_name || ' ' || v_emp.last_name);

    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_emp.employee_id);
    DBMS_OUTPUT.PUT_LINE('Job: ' || v_emp.job_id);

    DBMS_OUTPUT.PUT_LINE('------------------------------');

    DBMS_OUTPUT.PUT_LINE('Basic Salary: Rs. ' ||
        TO_CHAR(v_emp.salary, '99,99,999.99'));

    DBMS_OUTPUT.PUT_LINE('DA (40%): Rs. ' ||
        TO_CHAR(v_da, '99,99,999.99'));

    DBMS_OUTPUT.PUT_LINE('HRA (20%): Rs. ' ||
        TO_CHAR(v_hra, '99,99,999.99'));

    DBMS_OUTPUT.PUT_LINE('PF (12%): Rs. ' ||
        TO_CHAR(v_pf, '99,99,999.99'));

    DBMS_OUTPUT.PUT_LINE('------------------------------');

    DBMS_OUTPUT.PUT_LINE('Net Pay: Rs. ' ||
        TO_CHAR(v_net, '99,99,999.99'));

    DBMS_OUTPUT.PUT_LINE('==============================');

END;
/
