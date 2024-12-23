-- Query 4:

--From the doctors table, fetch the details of doctors who work in the same hospital but in different speciality.

--Table Structure:

--drop table doctors;
create table doctors
(
id int primary key,
name varchar(50) not null,
speciality varchar(100),
hospital varchar(50),
city varchar(50),
consultation_fee int
);

insert all
into doctors values(1, 'Dr. Shashank', 'Ayurveda', 'Apollo Hospital', 'Bangalore', 2500)
into doctors values(2, 'Dr. Abdul', 'Homeopathy', 'Fortis Hospital', 'Bangalore', 2000)
into doctors values(3, 'Dr. Shwetha', 'Homeopathy', 'KMC Hospital', 'Manipal', 1000)
into doctors values(4, 'Dr. Murphy', 'Dermatology', 'KMC Hospital', 'Manipal', 1500)
into doctors values(5, 'Dr. Farhana', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1700)
into doctors values(6, 'Dr. Maryam', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1500)
select * from dual;
commit;

select * from doctors;

--my solution
SELECT d1.name, d1.SPECIALITY, d1.HOSPITAL
FROM doctors d1
WHERE EXISTS (
    SELECT 1                        --exist returs true of false   so we can use true or false in place of 1
    FROM doctors d2
    WHERE d1.SPECIALITY = d2.SPECIALITY
    AND d1.HOSPITAL <> d2.HOSPITAL
    AND d1.id <> d2.id
);


--Solution:

select d1.name, d1.speciality,d1.hospital
from doctors d1
join doctors d2
on d1.hospital = d2.hospital and d1.speciality <> d2.speciality
and d1.id <> d2.id;



--Sub Question:

--Now find the doctors who work in same hospital irrespective of their speciality.

--Solution:

select d1.name, d1.speciality,d1.hospital
from doctors d1
join doctors d2
on d1.hospital = d2.hospital
and d1.id <> d2.id;
