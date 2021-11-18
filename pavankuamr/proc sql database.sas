libname foldername 'path';

libname tt 'D:\test';

libname foldername database user=scott password=tiger;

libname new oracle user=scott password=tiger;

proc sql;
connect to databasename (user=scott password=tiger);
execute(create table tablename (eid nmbur,ename 
	varchar(20),sal number))
	by oracle ;
execute(insert into tablename value(100,'jagan',2000))
	by oracle;
execute(insert into tablename value(200,'jagan',3000))
	by oracle;
disconnect from databasename;
quit;

proc sql;
connect to oracle (user=scott password=tiger);
execute(create table kiran(eid number,ename 
	varchar(20),
	sal number)) by oracle ;
execute(insert into kiran values(100,'jagan',2000))
	by oracle;
execute(insert into kiran values(200,'jagan',3000))
	by oracle;
disconnect from oracle;
quit;

/*syntax:*/
proc sql;
connect to databasename (user=scott password=tiger);
create table dataset as 
       select * from connection to databasename 
		(select * from table name);
disconnect from databasename;
quit;

/*create table in database*/
proc sql;
connect to oracle (user=scott password=tiger);
create table new.veera as 
       select * from connection to oracle
	(select * from emp);
disconnect from oracle;
quit;

/*create table in d drive*/
proc sql;
connect to oracle (user=scott password=tiger);
create table tt.ds2 as 
       select * from connection to oracle
	(select * from emp);
disconnect from oracle;
quit;

proc sql;
connect to oracle (user=scott password=tiger);
create table ds2 as 
       select * from connection to oracle
	(select * from dept);
disconnect from oracle;
quit;

proc sql;
connect to oracle (user=scott password=tiger);
create table ds1 as 
       select * from connection to oracle
	(select * from emp 
             where job in ('CLERK','MANAGER')
             AND SAL>2000
             and deptno in (10,20));
disconnect from oracle;
quit;



proc sql;
connect to oracle (user=scott password=tiger);
create table ds1_1 as 
       select * from connection to oracle
	(select empno,ename,job,mgr,sal,deptno from emp 
             where job in ('CLERK','MANAGER')
             AND SAL>2000
             and deptno in (10,20));
disconnect from oracle;
quit;


/*create the table in oracle database*/
data new.class;
set sashelp.class;
run;

data new;
set sashelp.class;
run;

/*export the dataset to oracle database*/
proc dbload data=new dbms=oracle;
user=scott; password=tiger;
table=jawahar;
load;run;

libname new oracle user=scott password=tiger port=8081
		server='servername' schema='schema1';

proc sql;
connect to oracle (user=scott password=tiger
	server='servername' schema='schemaname' port=8081);
create table ds1 as 
    select * from connection to oracle
	(select * from emp 
             where job in ('CLERK','MANAGER')
             AND SAL>2000
             and deptno in (10,20));
disconnect from oracle;
quit;




