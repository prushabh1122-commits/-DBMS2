| Cursor Attribute | Cursor Not Opened  | Result            |
| ---------------- | ------------------ | ----------------- |
| `%FOUND`         | Used before `OPEN` | ORA-01001 error   |
| `%NOTFOUND`      | Used before `OPEN` | ORA-01001 error   |
| `%ROWCOUNT`      | Used before `OPEN` | ORA-01001 error   |
| `%ISOPEN`        | Used before `OPEN` | Returns **FALSE** |


--%found
CURSOR c1 IS SELECT * FROM employee;

IF c1%FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Record found');
END IF;

--%not found
CURSOR c1 IS SELECT * FROM employee;

IF c1%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record');
END IF;


--%row count
CURSOR c1 IS SELECT * FROM employee;

DBMS_OUTPUT.PUT_LINE(c1%ROWCOUNT);


--%isopen
CURSOR c1 IS SELECT * FROM employee;

IF c1%ISOPEN THEN
    DBMS_OUTPUT.PUT_LINE('Cursor is Open');
ELSE
    DBMS_OUTPUT.PUT_LINE('Cursor is Closed');
END IF;