---oracle plsql records and collections introduction to oracle collections---
---siva academy video 1----
--Composite datatypes
--collections are varray,nested array, associated array and records are %type and %rowtype
--type is using for defining record and %type is used to decalre datatype of the field
DECLARE
type v_array_type is varray(7) of varchar2(30);
v_day v_array_type:=v_array_type(null,null,null,null,null,null,null);
BEGIN
    v_day(1):='MONDAY';
    v_day(2):='TUESDAY';
    v_day(3):='WEDNESDAY';
    v_day(4):='THURSDAY';
    v_day(5):='FRIDAY';
    v_day(6):='SATURDAY';
    v_day(7):='SUNDAY';

    for i in 1 .. 7 
    loop
    DBMS_OUTPUT.PUT_LINE('v_day(' ||i|| ') :  ' ||v_day(i));
    end LOOP;
end;

---Record data type is useful when the operation not related with table--

DECLARE
type address_rec_type is record (emp_name VARCHAR2(100), ---record datatype
street VARCHAR2(100),
city VARCHAR2(100),
state VARCHAR2(100),
country VARCHAR2(100),
pin VARCHAR2(100));
lv_address address_rec_type;
BEGIN
    lv_address.emp_name:='Hrishikesh';
    lv_address.street:='R.R Nagar';
    lv_address.city:='Bangalore';
    DBMS_OUTPUT.PUT_LINE(lv_address.emp_name || ','|| lv_address.street);
end;
/

----Writing program of record using %rowtype

DECLARE
v_emp_rec emp%rowtype;
BEGIN
    select * into v_emp_rec from emp where empno=7839;

    DBMS_OUTPUT.PUT_LINE('Empno = '||v_emp_rec.empno);
    DBMS_OUTPUT.PUT_LINE('Salary = '||v_emp_rec.Sal);
    DBMS_OUTPUT.PUT_LINE('deptno = '||v_emp_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('comm = '||v_emp_rec.comm);
    DBMS_OUTPUT.PUT_LINE('job = '||v_emp_rec.job);
end;
/

---we can insert data directly from one table to another with the help of recod
create table emp_bkp as select * from emp where 1=2;
DECLARE
v_emp_rec emp%rowtype;
BEGIN
    select * into v_emp_rec from emp where empno=7839;

   insert into emp_bkp values v_emp_rec;
   commit;
end;
/
---we can update data directly in table with the help of record
DECLARE
v_emp_rec emp%rowtype;
BEGIN
    select * into v_emp_rec from emp where empno=7839;
    v_emp_rec.sal:=v_emp_rec.sal+100;
    v_emp_rec.deptno:='20';

    update emp set row=v_emp_rec
    where EMPNO=7839;
    commit;
end;
/

select * from emp where empno=7839;

---we can record as cursor varible name
DECLARE
cursor c1 is select empno,ENAME,job from emp;
v_emp_rec c1%rowtype;
BEGIN
    open c1;
    fetch c1 into v_emp_rec;
    close c1;
    DBMS_OUTPUT.PUT_LINE('Empno = '||v_emp_rec.empno);
    DBMS_OUTPUT.PUT_LINE('ENAME = '||v_emp_rec.ENAME);
    DBMS_OUTPUT.PUT_LINE('job = '||v_emp_rec.job);
end;
/
----enhance above code to fetch all data from table
DECLARE
CURSOR c1 IS 
SELECT empno, ENAME, job 
FROM emp;
v_emp_rec c1%ROWTYPE;
BEGIN
OPEN c1;
LOOP
FETCH c1 INTO v_emp_rec;
EXIT WHEN c1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Empno = ' || v_emp_rec.empno);
DBMS_OUTPUT.PUT_LINE('ENAME = ' || v_emp_rec.ENAME);
DBMS_OUTPUT.PUT_LINE('Job = ' || v_emp_rec.job);
END LOOP;
CLOSE c1;
END;
/

---If we don't want to take all columns from we can define type of record
DECLARE
type emp_rec_type is record(empname varchar2(100),
empsal number);
emp_rec emp_rec_type;
BEGIN
    emp_rec.empname:='Hrishikesh';
    emp_rec.empsal:=100;
    DBMS_OUTPUT.PUT_LINE('Empname = ' || emp_rec.empname);
    DBMS_OUTPUT.PUT_LINE('Salary = ' || emp_rec.empsal);
end;
/

---We can initialize the record variable using constructor
DECLARE
type emp_rec_type is record(empname varchar2(100),
empsal number);
emp_rec emp_rec_type:=emp_rec_type('Hrishikeh',200);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Empname = ' || emp_rec.empname);
    DBMS_OUTPUT.PUT_LINE('Salary = ' || emp_rec.empsal);
end;
/

---Generally if we don't initialize record variable value then it takes null value
---If we explicitly define not null:='ABC' we have to enter the value

-------------varray  --define-declare-initialize-assign-access-----
---it is mandatory to define size of varray and initialize during declaration(mandatory)--

DECLARE
type v_array_type is varray(7) of varchar2(30);
v_day v_array_type:=v_array_type(null,null,null,null,null,null,null);--it is same like constructor in java;
BEGIN
     v_day(1):='Monday';
     v_day(2):='Tuesday';
     v_day(3):='Wednesday';
     v_day(4):='Thursday';
     v_day(5):='Friday';
     v_day(6):='Saturday';
     v_day(7):='Sunday';

     for i in 1 .. v_day.last --last or count or limit we can use
     loop
     DBMS_OUTPUT.PUT_LINE('v_day('||i||')= '||v_day(i));
     end loop;
end;
/

---Exceptions in collections---
--Reference to uninitialized collection
--subscript beyond count
--subscript outside of limit

--when we initialize less no. of elements than assigning then we will get "subscript beyond count" exception in other words if we initialize one null then we assign two value to variable it will throw exception

DECLARE
type v_array_type is varray(7) of varchar2(30);
v_day v_array_type:=v_array_type(null);--it is same like constructor in java;
BEGIN
     v_day(1):='Monday';
     v_day(2):='Tuesday';
     for i in 1 .. v_day.last --last or count or limit we can use
     loop
     DBMS_OUTPUT.PUT_LINE('v_day('||i||')= '||v_day(i));
     end loop;
end;
/
--it will throw an exception of "Subscript beyond count"
--if we don't initailize during declare section then we need to use extend keyword which allocate the memory
DECLARE
type v_array_type is varray(7) of varchar2(30);
v_day v_array_type:=v_array_type(null);--it is same like constructor in java;
BEGIN
     v_day(1):='Monday';
     v_day.extend;--by default it extent only one element but you can pass any no. of ele extend(n)
     v_day(2):='Tuesday';
     for i in 1 .. v_day.last --last or count or limit we can use
     loop
     DBMS_OUTPUT.PUT_LINE('v_day('||i||')= '||v_day(i));
     end loop;
end;
/
--above code we use extend to allocate memory

--below code will throw exception "Reference to uninitialized collection"
DECLARE
type v_array_type is varray(7) of varchar2(30);
v_day v_array_type;--here we haven't initialize constructor
BEGIN
     v_day.extend;--by default it extent only one element but you can pass any no. of ele extend(n)
     v_day(1):='Monday';
     for i in 1 .. v_day.last --last or count or limit we can use
     loop
     DBMS_OUTPUT.PUT_LINE('v_day('||i||')= '||v_day(i));
     end loop;
end;
/
---in below code when you extend more than array size then it will throw "Subscript outside of limit"
DECLARE
type v_array_type is varray(7) of varchar2(30);
v_day v_array_type:=v_array_type();--here we haven't initialize constructor
BEGIN
     v_day.extend(8);--by default it extent only one element but you can pass any no. of ele extend(n)
     v_day(1):='Monday';
     for i in 1 .. v_day.last --last or count or limit we can use
     loop
     DBMS_OUTPUT.PUT_LINE('v_day('||i||')= '||v_day(i));
     end loop;
end;
/
---collection methods like limit,count,first,last,trim(n),delete,extend(n),prior(n),next(n)

---limit gives the size of the varray, count will give the how many element actually initialize
--limit is only applicable for varray not nested table and associative array

--first will tell 1st subscript of varray which is 1
--last will tell the last initialized element
--trim() function will trim the last element
--trim(n) function will trim the last n elements
--delete will delete all elements from varray
--delete(n) is not there in varray
--prior(n) and next(n) will tell n-1 and n+1 respectively in varray because we can't delete any specific ele in varray

--Two dimentional array in collection----
--matrix addition--
--1 2 3    11 12 13  12 14 16
--4 5 6  + 14 15 16  18 20 22
--7 8 9    17 18 19  24 26 28

---practice by writting multiple time then you understand--
DECLARE
type matrix_ele_type is varray(3) of integer;
type matrix_type is VARRAY(3) of matrix_ele_type;
lv_matrix1 matrix_type:=matrix_type(null,null,null);
lv_matrix2 matrix_type:=matrix_type(null,null,null);
lv_matrix3_total matrix_type:=matrix_type(null,null,null);
lv_matrix_ele matrix_ele_type:=matrix_ele_type(null,null,null);
PROCEDURE print_array(pin_array matrix_type, pin_desc varchar2) as
BEGIN
    DBMS_OUTPUT.PUT_LINE('Printing the '||pin_desc||'...');
    for i in pin_array.first .. pin_array.last
    loop
       for j in pin_array(i).first .. pin_array(i).last
       loop
           DBMS_OUTPUT.PUT(pin_array(i)(j)||'  ');--here instead of putline we use put
       end loop;
               DBMS_OUTPUT.PUT_LINE(' ');
    end loop;
end;
BEGIN
    lv_matrix_ele:=matrix_ele_type(1,2,3);
    lv_matrix1(1):=lv_matrix_ele;
    lv_matrix_ele:=matrix_ele_type(4,5,6);
    lv_matrix1(2):=lv_matrix_ele;
    lv_matrix_ele:=matrix_ele_type(7,8,9);
    lv_matrix1(3):=lv_matrix_ele;
    
    print_array(lv_matrix1,'First Array');
    
    lv_matrix_ele:=matrix_ele_type(11,12,13);
    lv_matrix2(1):=lv_matrix_ele;
    lv_matrix_ele:=matrix_ele_type(14,15,16);
    lv_matrix2(2):=lv_matrix_ele;
    lv_matrix_ele:=matrix_ele_type(17,18,19);
    lv_matrix2(3):=lv_matrix_ele;
    
    print_array(lv_matrix2,'Second Array');
    
    for i in lv_matrix1.first..lv_matrix1.last loop
        for j in lv_matrix1(i).first..lv_matrix1(i).last LOOP
        lv_matrix_ele(j):=lv_matrix1(i)(j)+lv_matrix2(i)(j);
        end loop;
        lv_matrix3_total(i):=lv_matrix_ele;
        end loop;
        print_array(lv_matrix3_total,'Total Array');
end;
/ 

--Nested tables have no upper bound limit but varray has
--we can delete the element from middle in nested tables but in varray can't

type v_array_type is varray(7) of varchar2(30);--here in varray we define upper bound as 7
type v_nested_tab_type is table of varchar2(30);--here in nested table the upper limit is unlimited

--similar prog(weekdays prog) we have done in varray no need to do again
-- here in nested table delete we can pass the parameter delete(i)--it will delete the value at ith location,  delete(i) is not there in varray
--delete will delete whole nested table or varray

---exists will tell particular value is there or not

---Associative Arrays :- PLSQL Table or index by table is a set of key value pair

---data type of index can be either (varchar2,varchar,string or long) or pls_integer

DECLARE
    type v_asso_array_type is table of varchar2(30) index by varchar2(30);
    v_color_code v_asso_array_type;
BEGIN
    v_color_code('WHITE') := '000,000,000';
    v_color_code('BLACK') := '111,111,111';
    v_color_code('RED') := '111,100,110';
    v_color_code('GREEN') := '001,111,000';
    v_color_code('BLUE') := '111,111,000';
    v_color_code.delete('GREEN');--if we write other color which is not in list it won't throw an error

    dbms_output.put_line('v_color_code(WHITE): ' || v_color_code('WHITE'));
    dbms_output.put_line('v_color_code(BLACK): ' || v_color_code('BLACK'));
    dbms_output.put_line('v_color_code(GREEN): ' || v_color_code('BLUE'));
    ---collection methods
    dbms_output.put_line('v_color_code.first: ' || v_color_code.first);--since asso array assigned in asc order
    dbms_output.put_line('v_color_code.count: ' || v_color_code.count);
END;
/

---limit, trim(n) and extend(n) are not applicable for associative array


---MULTISET OPERATORS it works on collections of same type
--multiset union
--multiset intersect
--multiset except
--multiset union all ---if we don't write union all it works like union only
--multiset union distinct ---it shows unique value

---multiset intersect  ---common in both
---multiset intersect all
---multiset intersect distinct

---multiset except   -- it only shows data in set one but not in 2
--multiset except all
--multiset except distinct

--miltiset union distint ---it remove duplicate but not sort the output
--union in sql ---it remove duplicate and sort the output


--multiset union all ---if we don't write union all it works like union only
--multiset union distinct ---it shows unique value
DECLARE
type num_tab_type is table of number;
lv_num_list1 num_tab_type:=num_tab_type(1,1,2,2,3,4,5,8,8);
lv_num_list2 num_tab_type:=num_tab_type(9,1,1,2,6,7);
lv_num_list3 num_tab_type;
lv_num_list4 num_tab_type;
BEGIN
    lv_num_list3:=lv_num_list1 multiset union lv_num_list2;
    for i in 1.. lv_num_list3.count LOOP
    dbms_output.put_line(lv_num_list3(i));
    end loop;
    dbms_output.put_line('=====================');
    lv_num_list4:=lv_num_list1 multiset union distinct lv_num_list2;--here multiset union distinct shows distinct but not sorted
    for i in 1.. lv_num_list4.count LOOP
    dbms_output.put_line(lv_num_list4(i));
    end loop;
end;
/

---multiset intersect  ---common in both
---multiset intersect all
---multiset intersect distinct
DECLARE
type num_tab_type is table of number;
lv_num_list1 num_tab_type:=num_tab_type(1,1,2,2,3,4,5,8,8);
lv_num_list2 num_tab_type:=num_tab_type(9,1,1,2,6,7);
lv_num_list3 num_tab_type;
lv_num_list4 num_tab_type;
BEGIN
    lv_num_list3:=lv_num_list1 multiset intersect lv_num_list2;
    for i in 1.. lv_num_list3.count LOOP
    dbms_output.put_line(lv_num_list3(i));
    end loop;
    dbms_output.put_line('=====================');
    lv_num_list4:=lv_num_list1 multiset intersect distinct lv_num_list2;
    for i in 1.. lv_num_list4.count LOOP
    dbms_output.put_line(lv_num_list4(i));
    end loop;
end;
/
---multiset except   -- it only shows data in set one but not in 2
--multiset except all
--multiset except distinct
DECLARE
type num_tab_type is table of number;
lv_num_list1 num_tab_type:=num_tab_type(1,1,2,2,3,4,5,8,8);
lv_num_list2 num_tab_type:=num_tab_type(9,1,1,2,6,7);
lv_num_list3 num_tab_type;
lv_num_list4 num_tab_type;
BEGIN
    lv_num_list3:=lv_num_list1 multiset except lv_num_list2;
    for i in 1.. lv_num_list3.count LOOP
    dbms_output.put_line(lv_num_list3(i));
    end loop;
    dbms_output.put_line('=====================');
    lv_num_list4:=lv_num_list1 multiset except distinct lv_num_list2;
    for i in 1.. lv_num_list4.count LOOP
    dbms_output.put_line(lv_num_list4(i));
    end loop;
end;
/







