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
delete from Emp_details where id=8;
--SA_Ques25

--Row level trigger execute in between statement level trigger
BEGIN
    INSERT into Emp_details values(seq_Emp_Details_id.NEXTVAL,'abc10');
    INSERT into Emp_details values(seq_Emp_Details_id.NEXTVAL,'abc11');
    commit;
end;
/

--o/p

/*
statement before insert 7
row before insert 8
row after insert 9
statement after insert 10
statement before insert 11
row before insert 12
row after insert 13
statement after insert 14
*/

CREATE SEQUENCE log_seq;

create or replace trigger Row_BF_Ins before
insert on Emp_Details for each ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('row before insert '||log_seq.NEXTVAL);
end;
/

create or replace trigger ST_BF_Ins  before
insert on Emp_Details
BEGIN
    DBMS_OUTPUT.PUT_LINE('statement before insert '||log_seq.NEXTVAL);
end;
/

create or replace trigger ST_AF_Ins  after
insert on Emp_Details
BEGIN
    DBMS_OUTPUT.PUT_LINE('statement after insert '||log_seq.NEXTVAL);
end;
/

create or replace trigger ROW_AF_Ins after
insert on Emp_Details for each ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('row after insert '||log_seq.NEXTVAL);
end;
/

---SA _Ques 56 and 57 contains
---56 if diff type of trigger like before or after is created on same table how many trigger we can create the order of execution.
--SA_Ans many trigger we can create but order of execution 1st statement trigger then for each row tigger
---57 if same type of trigger like before or after is created on same table how many trigger we can create the order of execution.
--SA_Ans many trigger we can create but order of execution is decided by oracle but can change the order of execution by writting  follows Trigger_1(this should after each row)