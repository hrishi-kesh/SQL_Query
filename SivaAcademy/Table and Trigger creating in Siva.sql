------Table and Trigger creating in SivaTB tablespace having SivaDF datafile and SivaAcademy user--
---Datafile file C:\Oracle19c\oradata\ORCL\orclpdb  username SivaAcademy Pass is u know 
---but its service is orcl only

CREATE table Emp_Details(id number primary key,name varchar2(20));
create SEQUENCE seq_Emp_Details_id start with 1 nocache NOCYCLE;
INSERT into Emp_details values(seq_Emp_Details_id.NEXTVAL,'abc1');
INSERT into Emp_details values(seq_Emp_Details_id.NEXTVAL,'abc2');
INSERT into Emp_details values(seq_Emp_Details_id.NEXTVAL,'abc3');
INSERT into Emp_details values(seq_Emp_Details_id.NEXTVAL,'abc4');
INSERT into Emp_details values(seq_Emp_Details_id.NEXTVAL,'abc5');
commit;
select * from Emp_details;


create trigger Trigg_Emp_Details after
insert on Emp_Details for each ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('some rows got inserted');
end;
/


