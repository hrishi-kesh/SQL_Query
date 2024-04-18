---Siva Academy Ques14 can we use out inout parameter inside function
---yes we can but while calling we need to call in expression inside plsql block

create or replace function func_square_cube(
    in_num in number,
    out_num out number
) return number
as
begin
out_num:=in_num*in_num*in_num;
return in_num*in_num;
end;
/

DECLARE
lv_square number;
lv_cube number;
BEGIN
    lv_square:=func_square_cube(2,lv_cube);
    DBMS_OUTPUT.PUT_LINE('The square of the number is ' || lv_square);
    DBMS_OUTPUT.PUT_LINE('The cube of the number is '
    ||lv_cube);
end;
/
