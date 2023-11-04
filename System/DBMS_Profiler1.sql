@C:\Oracle19c\WINDOWS.X64_193000_db_home\rdbms\admin\proftab.sql --run default proftab.sql to evironment setup. It will create three tables
SELECT * FROM user_tables where table_name like '%PROF%';
SELECT * FROM PLSQL_PROFILER_RUNS;
SELECT * FROM PLSQL_PROFILER_DATA;
SELECT * FROM PLSQL_PROFILER_UNITS;

