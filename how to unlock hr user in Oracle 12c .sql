Step 1: Get the Pluggable database name and service name.
As I just mentioned that the HR schema in Oracle 12c is placed in the user pluggable database thus to unlock it we need to get the name of the pluggable database. In order to do so first log on to your database as sys user

C:\>  sqlplus /  as  sysdba

In Oracle 12c when we do not specify any service, container or the name of any pluggable database then oracle by default connects us to the Root Container database which always has CBD$ROOT name. You can check whether you are connected to a Root CBD or any Pluggable Database by checking the value of con_name (Connection name) parameter.

SQL> SHOW  con_name;

how to unlock hr user in Oracle 12c by manish sharma

To find out the name of all the pluggable databases available in your system you can query v$pbds view.

SQL> SELECT  name,  con_id  FROM  v$pdbs;

Here in this query along with the name of all the available user PDBs I am also selecting their container ID (con_id) because by the help of the corresponding container id of the pluggable database we can easily find its associated net service. 

Here I have 2 pluggable databases available on my system.
PDB$SEED: First is PDB$SEED which has container id 2. This is our seed PDB which is a default pluggable database (PDB) used as a template for user-created PDBs by the system. The seed is always named PDB$SEED.
Second is PDBORCL which has container id 3. This pluggable database is the one that was created by me during the installation of oracle database 12c which has our sample HR schema.
how to unlock hr user in Oracle 12c by manish sharma

To find the name of the service we will use v$active_services view. In most of the cases oracle software creates database and its service with the same name.

SQL> SELECT  name  FROM  v$active_services  WHERE  con_id = 3;

This query will return the name of the service corresponding to the container id (con_id) 3 which is the container id of pluggable database pdborcl.

The result returned from this query in my case is “pdborcl” which is the name of the service for my pluggable database “PDBORCL”. Don’t get confused here as I have already mentioned that in most cases the oracle software creates database and its service with same name.

This pluggable database name and service name will be used for updating tnsname.ora file and configuring some network settings in it by making service entry for the pluggable database.

Question: How do we get to know which pluggable database from the list has the HR sample schema?
Answer: Generally the first pluggable database which is created during the creation of the container database (either at the time of Oracle Software installation or database creation using DBCA) consists the HR sample schema.
how to unlock hr user in Oracle 12c by manish sharma

Step 2: Update tnsname.ora file
In the second step we will update tnsname.ora file and make a TNS alias for our pluggable database. In simple words we will just make an entry for our pluggable database in tnsname.ora file so that while establishing a connection listener can find the proper service and can establish connection between client and database.

This step is required just to connect hassle free with HR user after unlocking it.

First open up your TNS file. This file normally resides in the ORACLE HOME\NETWORK\ADMIN directory.

Remember in my case the name of the pluggable database is “PDBORCL” and the service name is also “pdborcl”. I will use this information to add an entry in my tnsname.ora file. 

Before making any changes in the tnsname.ora file I would suggest you to make its duplicate copy as a backup.

PDBORCL =
  (DESCRIPTION =
   (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
   (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = pdborcl)
   )
  )

A sample entry will look like this. You can change the value for hostname and port number accordingly.

how to unlock hr user in Oracle 12c by manish sharma

Step3: Switch the container from CBD$ROOT to PDBORCL
As I mentioned at the starting of this blog that in Oracle database 12c the HR sample schema is the part of the pluggable database thus in order to unlock it we need to switch the container from Root CBD to Pluggable PDB (pdborcl). 

Moreover, to switch the container first you need to log on to your database using sys user again

C:\>  sqlplus  /  as  sysdba

After log in as sys you can use “Alter Session” DDL command to switch the container

SQL>  ALTER  SESSION  SET  CONTAINER  =  pdborcl;

You can use con_name parameter to verify whether you have successfully changed the container or not.

SQL>  SHOW  con_name;

how to unlock hr user in Oracle 12c by manish sharma

Step 4: Open the pluggable database PDBORCL
As we already know that to perform any DDL such as ALTER USER command, the database needs to be opened and by default pluggable database should be in MOUNT state.

You can check the present open mode of pluggable database using v$pdbs view.

SQL>  SELECT  name,  open_mode  FROM  v$pdbs;

Furthermore, if the pluggable database PDBORCL is in the MOUNT state then you can use ALTER PLUGGABLE DATABASE ddl command to open it.

SQL>  ALTER  PLUGGABLE  DATABASE  open;

how to unlock hr user in Oracle 12c by manish sharma

Step 5: Unlock the HR user
Now you are all set to unlock your HR user as we are done with all the necessary settings. Next in order to unlock your HR user you have to use ALTER USER DDL command

SQL> ALTER  USER  hr  IDENTIFIED  BY  hr  ACCOUNT  unlock;

Step 6: Log in to your database using HR user
Unlike the earlier versions of Oracle database, 12c requires you to provide service name along with the login credentials of the HR user. The service entry which we created in tnsname.ora file can be specified here using @ sign followed by the username and password in the connection string.

SQL>  conn  hr/hr  @pdborcl;

how to unlock hr user in Oracle 12c by manish sharma

Some Common Errors That You Can Encounter
ORA- 12154: TNS: could not resolve the connect identifier specified.
Cause: Either you forgot to add a service entry in your tnsname.ora file as mentioned in Step 2 or you have supplied the wrong value of the service parameters such as SERVICE_NAME, LOCALHOST etc.

Solution: Add a service entry for your pluggable database in your tnsname.ora file as shown in step 2 or check whether the value that you have specified for parameters are correct or not.

how to unlock hr user in Oracle 12c by manish sharma

ORA- 01033: ORACLE initialization or shutdown in progress.
Cause: Pluggable database either Not Open or in MOUNT mode. 

Solution:First check the open mode for your pluggable database using v$pdbs view

SQL>  SELECT  name,  open_mode  FROM  v$pdbs;

If your pluggable database is not open then do it using ALTER PLUGGABLE DATABASE ddl command as shown in step 4.

how to unlock hr user in Oracle 12c by manish sharma

That’s all guys in this section. I hope this article helps you with your Oracle Database 12c experience. Moreover kindly please share this on your social networking & help me reach out to more people. Thanks & have a great day!