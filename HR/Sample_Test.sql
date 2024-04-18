DECLARE
a varchar2(10):=5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('There are ' || a || ' items in stock.');
end;

create table Movie_Directory
(Sr_No Number primary key,
Film_Name varchar2(100),
Film_Details clob,
image1 blob,
image2 blob,
image3 blob);

select * from MOVIE_DIRECTORY;



