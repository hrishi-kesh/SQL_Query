--1.0--------OTP Generation and Validation---------

create table Otp_Details(email varchar2(50) primary key,OTP number, otp_gen_time timestamp,otp_exp_time timestamp);

create or replace procedure Otp_Generation(p_email in varchar2,p_otp out number)
IS
BEGIN
p_otp:=trunc(dbms_random.value(100000,999999));

insert into Otp_Details values(p_email,p_otp,SYSTIMESTAMP,SYSTIMESTAMP+1/(24*60));
commit;
end Otp_Generation;
/

DECLARE
p_otp number;
BEGIN
Otp_Generation('abc1@gmail.com',p_otp);
end;
/

select * from OTP_DETAILS;
delete from OTP_DETAILS where ROWNUM=1;
commit;

create or replace procedure otp_validation(p_email in varchar2,p_otp in number,p_msg out varchar2)
IS
l_count number;
BEGIN
     select count(email) into l_count from Otp_Details where otp=p_otp and email=p_email and systimestamp between OTP_GEN_TIME and OTP_EXP_TIME;
     if l_count=1
     then p_msg:='OTP validated successfully';
     ELSE
     p_msg:='OTP not validated successfully';
     end if;
end otp_validation;
/

DECLARE
p_msg varchar2(50);
BEGIN
otp_validation('abc1@gmail.com',487492,p_msg);
DBMS_OUTPUT.PUT_LINE(p_msg);
end;
/

select * from OTP_DETAILS;

---------------------------To automate the above code to take email and otp automatically for validation---
---modify the 2nd procedure like that---

-- Create the otp_validation procedure
CREATE OR REPLACE PROCEDURE otp_validation(p_msg OUT VARCHAR2)
IS
    l_count NUMBER;
    l_email VARCHAR2(50);
    l_otp NUMBER;
BEGIN
    -- Fetch the latest email and OTP
    SELECT email, otp INTO l_email, l_otp
    FROM Otp_Details
    WHERE systimestamp BETWEEN otp_gen_time AND otp_exp_time
    AND ROWNUM = 1
    ORDER BY otp_gen_time DESC;

    -- Validate the OTP
    SELECT COUNT(email) INTO l_count
    FROM Otp_Details
    WHERE otp = l_otp AND email = l_email AND systimestamp BETWEEN otp_gen_time AND otp_exp_time;

    IF l_count = 1 THEN
        p_msg := 'OTP validated successfully';
    ELSE
        p_msg := 'OTP not validated successfully';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_msg := 'No valid OTP found';
    WHEN OTHERS THEN
        p_msg := 'An error occurred: ' || SQLERRM;
END otp_validation;
/

-- Test the otp_validation procedure
DECLARE
    p_msg VARCHAR2(50);
BEGIN
    otp_validation(p_msg);
    DBMS_OUTPUT.PUT_LINE(p_msg);
END;
/


---




