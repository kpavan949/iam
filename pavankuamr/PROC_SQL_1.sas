libname sascl "F:\JAGAN Sas_class\data";

/*Syntax: */
/*Create table tablename(var datatype, var2 datatype--- varn datatype);*/
PROC SQL;
CREATE TABLE EMP(EID NUM, ENAME CHAR(10), SAL NUM);
quit;

/*Create in sascl library*/
PROC SQL;
CREATE TABLE sascl.EMP(EID NUM, NAME CHAR(10), SAL NUM);
QUIT;

/*INSERT THE VALUES INTO TABLES*/
/*INSERT INTO STMT:*/
/*INSERT THE DATA INTO EXISTED TABLE USING "VALUES" OR "SET" CLAUSE .*/

/*VALUES CLAUSE:*/
/*--------------*/
/*INSERT THE DATA DEPENDING ON POSITION OF THE VARIABLES .*/

/*syn:Insert into tablename values(var1,var2,var3);*/

/*SET CLAUSE:*/
/*-----------*/
/*INSERT THE DATA DEPENDING ON VARIABLE NAMES .*/

/*Insert into tablename set var=value,var2=value,-----varn=value;*/

PROC SQL;
INSERT INTO EMP VALUES(100,'JAGAN',25000)
                VALUES(102,'MOHAN',20000);
QUIT;

/*Insert the blank values*/
PROC SQL;
INSERT INTO EMP VALUES(103,'JAGAN1',25000)
                VALUES(.,'',20000);
QUIT;

/*EG:(SET):*/
PROC SQL;
INSERT INTO EMP SET EID=1034,ENAME='Prasad',SAL=28000
                SET ENAME='Suresh',EID=104,SAL=200000
				SET SAL=20000,ENAME='Swati',EID=1040;
QUIT;

/*Example 2*/
/*CREATE TABLE  with date and format*/
PROC SQL;
CREATE TABLE EMP1(EID NUM format=comma14.,NAME CHAR(10),
	SAL NUM format=dollar10.2,dob num format=date9.);

QUIT;

PROC SQL;
INSERT INTO EMP1 values (1031245,'VIJAYA',25000,'23jul2018'd)
             values(10312459,'JAGAN',4000,'29jul2018'd);
QUIT;

PROC SQL;
INSERT INTO EMP1 
	SET EID=1031245123,NAME='SURESH',SAL=25000,DOB='23jul2018'd
    SET NAME='RAHUL',SAL=40000,DOB='29jul2018'd,EID=1031245122;
QUIT;

/*CREATE THE TABLE AND INSERT THE VALUES in SAME QUERY*/
PROC SQL;
CREATE TABLE MEDI(PID NUM, SDATE NUM format=worddate.,
				STIME NUM format=time5.,
				DOB NUM format=datetime.);
INSERT INTO MEDI 
	VALUES(101,'13JAN2010'D, '14:23:45'T, '17FEB2005:10:23:45'dt)
	VALUES(102,'01JUL2007'D, '12:21:40'T, '12MAY2006:11:21:35'DT);
QUIT;

/*ALTER STATMENT*/

/*ADDING THE NEW VARIABLE*/
/*SYN:*/
/*ALTER TABLE TABLENAME ADD VARNAME dATATYPE,-- varname-n datatype;*/

PROC SQL;
alter table emp add gender char(10),address char(30);
run;

/*DROP THE VARIABLES:*/
/*SYN: ALTER TABLE TABLENAME DROP var1,var2;*/

/*Single variable drop*/
PROC SQL;
alter table emp drop gender;
run;

/*multiple variables drop*/
PROC SQL;
alter table emp drop gender,address;
quit;

data a b c;
set sashelp.class;
run;

/*DELETE*/
/*DELETE THE DATA:*/
/*SYN: DELETE FROM <TABLENAME> <CONDITIONAL CLAUSE>;*/
proc sql;
delete from a where age gt 14;
quit;

/*I want to remove age group 12,13*/
proc sql;
delete from a where age in (12,13);
quit;

/*IT will remove the Carol record*/
proc sql;
/*delete from a where name = 'Carol';*/
delete from a where name in ('Carol','Alfred','James');
quit;

/*IT will remove all records from a dataset*/
proc sql;
delete from a;
run;
/*DROP*/
/*DROP the table*/
/*SYN: DROP TABLE <TABLENAME>;*/

PROC SQL;
drop table a;
quit;

/*I want to remove the multiple tables*/
proc sql;
drop table b,c;
quit;

/*********************************************/
/*DESCRIBE STMT:*/
/*DISPLAY THE TABLE STRUCTURE IN LOG WINDOW.*/
/*STRUCTURE: TABLENAME, VARIABLE NAME, DATATYPES,*/
/*           LENGTH, INFORMAT, FORMATS, INDEX etc*/

/*Syn: Describe table tablename*/
data raw; 
   input region $ state $ month date7. headcnt expenses comma10.
		revenue; 
   format month date9. expenses comma10.; 
   cards; 
Eastern  VA 12FEB78  10  7800 15500 
Southern FL 13MAR78   9  9800 13500 
; 
run;

data a;
set sashelp.class;
run;
 
PROC SQL;
DESCRIBE TABLE raw;
QUIT;

/*I WANT TO KNOW MULTIPLE TABLE STRUCTUTE		   */
PROC SQL;
DESCRIBE TABLE raw,a;
QUIT;

/*UPDATE*/
/*Syntax: update tablename set value condition;*/

/*IT will update the height values for age group 11 & 12*/
Proc sql;
update a set height=height+10 where age in (11,12);
quit;

/*IT will update the weight values for Carol*/
Proc sql;
update a set weight=weight+10 where name='Carol';
quit;


/*ORDER BY CLUASE*/
/*To report the data in sorting order depending on */
/*variable name or var position.*/
/*Note: By default it will sort the data in 
Asceding order*/

/*numeric ---  0 to 9*/
/*alphabets-  A to Z*/

/*Syn: Order by var, var2 ;*/
proc sql;
select * from sashelp.class 
	order by name;
quit;

/*In this example sort the data based on age and 
create the a1 dset*/
proc sql;
create table a1 as
select * from sashelp.class 
	order by age;
quit;

/*In this example sort the data based on age,height and create the
a2 dset*/
proc sql;
create table a2 as
select * from sashelp.class 
	order by age,height;
quit;

proc sql;
select * from sashelp.class 
/*	order by age,sex;*/
	order by sex,age;
quit;

/*In this example age var sort in descending order 
and gender var
sort in ascending order*/
proc sql;
select * from sashelp.class 
	order by age desc,sex;
/*	order by sex desc,age;*/
quit;

data raw; 
   input region $ state $ month monyy5. 
         headcnt expenses revenue; 
   format month monyy5.; 
   cards; 
Eastern  VA FEB78  10  7800 15500 
Southern FL MAR78   9  9800 13500 
Southern GA JAN78   5  2000  8000 
Northern MA MAR78   3  1500  1000 
Southern FL FEB78  10  8500 11000 
Northern NY MAR78   5  6000  5000 
Eastern  VA MAR78  11  8200 16600 
Plains   NM MAR78   2  1350   500 
Southern FL JAN78  10  8000 10000 
Northern NY FEB78   4  3000  4000 
Southern GA FEB78   7  1200  6000 
; 
run;

/*IT will sort the data based on region & month*/
/*1 means it will take first variable from dataset*/
/*3 means it will take third variable from dataset*/
proc sql;
select * from raw 
	order by 1,3;
	quit;

/*IT will sort the data based on region,stae & month*/
proc sql;
select * from raw 
/*	order by 1,2,3;*/
	order by 3,2,1;
	quit;

/*IT will sort the data based on region,stae & month*/
/*3 desc  means month var is sorting in descending order*/
/*2 desc  means state var is sorting in descending order*/
proc sql;
select * from raw 
/*	order by 3 desc,2,1;*/
	order by 3 desc,2 desc,1;
	quit;

/*IT will sort the data based on region,stae & month and create the
	suresh_m data*/
proc sql;
create table suresh_m as
select * from raw 
	order by 3 desc,2 desc,1;
	quit;

proc sql;
create table suresh_m2 as
select region,state,month from raw 
	order by 3 desc,2 desc,1;
quit;

/*GROUP BY CLAUSE*/

/*the group by stmt is using with aggregate functions*/
/*(count,max,min,sum,avg) to group the data by one */
/*or more variables*/

/*I want to know region count*/

/*	Syn: GROUP BY VAR1, var2;*/

proc sql;
select count(*) as reg_cnt from raw;
	quit;

/*IT will give the count by region wise*/
proc sql;
select region, count(*) as reg_cnt from raw
	group by region;
	quit;

/*IT will give the count by region & state wise*/
proc sql;
select region, state, count(*) as reg_cnt from raw
	group by region,state;
	quit;

/*IT will give the sum for expenses by region & state wise*/	
proc sql;
select region, state, sum(expenses) as tot_cnt
		from raw
group by region,state;
quit;

/*IT will give the max of expenses by region wise*/	
proc sql;
select region, max(expenses) as tot_cnt from raw
group by region;
	quit;

/*IT will give the max of expenses by region & state wise*/	
proc sql;
select region, state, max(expenses) as max_Exp
	from raw
	group by region,state;
	quit;

proc sql;
select region, state, min(expenses) as min_exp from raw
	group by region,state;
	quit;

proc sql;
create table suresh_mi as
select region, state, 
				count(*) as rec_cnt,
				mAX(expenses) as max_cnt,
				min(expenses) as min_cnt,
				sum(expenses) as tot_cnt,
				avg(expenses) as avg_cnt	
			from raw
	group by region,state;
	quit;

/*EXAMPLE 2*/
proc sql;
select sex, max(age)
	as max_age from sashelp.class
	group by sex;
	quit;

proc sql;
select sex, min(age)
	as min_age from sashelp.class
	group by sex;
	quit;

proc sql;
select sex, count(*) as rec_cnt from sashelp.class
	group by sex;
	quit;

proc sql;
select sex, age, count(*) as rec_cnt from sashelp.class
	group by sex,age;
	quit;

proc sql;
select sex as gender, age, max(height) as max_ht,
				min(weight) as min_wt	
		from sashelp.class
	group by sex,age;
	quit;

/*HAVING CLAUSE*/
/*The having clause was added to sql because the
where keyword could not*/
/*be used with aggreagate functions.*/
/*	Syn: Having condition(aggegate var name) */

PROC SQL;
select region, sum(expenses) as tot_exp from raw
	where expenses > 3500
	group by region;
	quit;

PROC SQL;
select region, sum(expenses) as tot_exp from raw
	group by region
	where tot_exp > 9500;
	quit;

PROC SQL;
select region, sum(expenses) as tot_exp from raw
	group by region
	having tot_exp > 11000;
	quit;

PROC SQL;
select region,state, sum(expenses) as tot_cnt from raw
	group by region,state
	having tot_cnt > 5000;
	quit;

proc sql;
select age, count(*) as no_cnt from sashelp.class
	group by age
	having no_cnt > 3;
	quit;

/*DATASET OPTIONS*/
proc sql;
create table new(keep=region state expenses) as
select * from raw; 
quit;

proc sql;
create table new1(drop=region state expenses) as
select * from raw; 
quit;

proc sql;
create table new(where =(region = 'Eastern')) as
select * from raw; 
quit;

proc sql;
create table new1 as
select * from raw
	where region = 'Eastern'; 
quit;

proc sql;
create table new(rename =(region = region_row)) as
select * from raw; 
quit;

/*WHERE CLAUSE*/
/*The where clause is used to filter the records. The where cluase is*/
/*used to extract only those records  based on specific condition.*/

/*Simple Where*/

/*where condition*/
proc sql;
select * from raw where region = 'Eastern';
quit;

proc sql;
/*select * from raw where region <> 'Eastern';*/
select * from raw where region ne 'Eastern';
quit;

proc sql;
select * from raw where expenses > 5000;
quit;

/*WHERE_IN*/
proc sql;
/*select * from raw where region in ('eastern','Southern');*/
select * from raw where 
	region in ('Eastern','Southern');
quit;

proc sql;
select * from raw 
	where region not in ('Eastern','Southern');
quit;

proc sql;
select * from sashelp.class 
		where age in (11,15,16);
quit;

proc sql;
select * from sashelp.class 
	where age not in (11,15,16);
quit;


/*WHERE BETWEEN*/
proc sql;
select * from raw 
	where expenses between 3000 and 10500;
quit;

/*IT will extract the data from 01feb78 to 01mar78*/
proc sql;
select * from raw 
	where month between '01FEB78'd and '01MAR78'd;
	quit;

/*IT will extract the data for age from 14 to 16(14,15,16)*/
proc sql;
select name, age, sex from sashelp.class 
	where age between 14 and 16;
quit;

/*WHERE AND*/
proc sql;
create table one as
/*select * from raw where region ='Southern';*/
select * from raw where 
		region ='Southern' and state='FL';
quit;

proc sql;
create table one_1 as
select * from raw 
	where region ='Southern' and
	state='FL' and
	month='01FEB78'd;
quit;

proc sql;
select * from raw 
	where region in ('Southern','Northern') and
	state in ('FL','NY')	
	and	month = '01FEB78'd and
	expenses > 5000;
quit;

/*Note:1. First it will extraxt Southren and Northren data
2.then it will extract the FL & NY state data
3.finally it will extract the 01feb78 data
4.then it will get the data expense gt 5000*/

/*WHERE like*/
Proc sql;
select * from raw where region like 'e%';
quit;

Proc sql;
select * from raw where region like 'E%';
quit;

Proc sql;
select * from raw where region like '%er%';
quit;

Proc sql;
select * from raw where region like '%th%';
quit;

Proc sql;
/*select * from raw where region like '%S';*/
select * from raw where region like '%s';
quit;

Proc sql;
select * from raw 
	where region like '%n' and
		state in ('FL','NY') and
		headcnt ge 9;
quit;

/*WHERE Contains*/

proc sql;
select * from raw where region contains 'o';
quit;

proc sql;
select * from raw where region contains 'S';
quit;

proc sql;
select * from raw where region contains 's';
quit;

proc sql;
select * from raw where region ? 's';
quit;

/*Note: instead of contains we can use '?' symbol*/

proc sql;
select * from raw where region contains 'ns';
quit;

proc sql;
/*select * from raw1 where upcase(region) like 'S%';*/
select * from raw 
		where upcase(region) = 'SOUTHERN';
quit;

proc sql;
select * from raw where upcase(region)
		like '_____ER%';
/*		contains 'NS';*/
/*		like '____NS%';*/
quit;

/*WHERE SOUND*/
data a;
input id name $ loc $;
datalines;
300 color che
400 colour che
500 stansys bang
600 stansys che
700 stansis che
800 stansas bang
900 week che
900 weak che
900 praveen che
900 praveena che
1900 advice che
1200 advise che
;
run;

proc sql;
select * from a where name=*'week';
run;
quit;

proc sql;
select * from a where name=*'color';
run;

proc sql;
select * from a where name=*'praveen';
quit;

/*CASE WHEN*/

/*Select result values that satisfy specified 
conditions.*/
/**/

/*Syn: Case when condition then '(var-value)'*/
/*	when condition then '(var-value)'*/
/*	when condition then '(var-value)'*/
/*	else '(var-value)' end as 'Varname'*/

proc sort data=sashelp.class out=new;by  age ;run;

/*IT will create the new variable name as NEW_HT*/
PROC SQL;
select *,case when age >14 then height+20
		else height+10 end as new_ht
		from new;
	quit;

proc sql;
create table new_grp as
select *,case when
			sex = 'M' and age < 13 then 'M_Junior'
	when sex = 'M' and age > 13 then 'M_senior'
	when sex = 'F' and age < 13 then 'F_Junior'
	when sex = 'F' and age > 13 then 'F_senior'
	else 'others' end as new_group
	from new;
	quit;

/*CREATE MULTIPLE VARIABLES*/
proc sort data=raw ;by region;run;
proc sql;
select *,case when region='Eastern' then 'East'
			when region='Northern' then 'North'
			else 'others' end as new_region,

		case when expenses > 6000 then expenses+1000
		else expenses+2000 end as new_exp,

		case when headcnt < 5 then headcnt+10
		else headcnt+8 end as new_hcnt
		from raw;
		quit;


/*The above example it creates the 3 new variables(new_region,
new_Exp & new_cnt)*/
proc sql;
create table ctr as
select *, case when region = 'Eastern' then 'East'
		when region like '%the%' then 'NORTHE-EAST'
		else 'others' end as new_reg,

		case when state = 'FL' then 'US_STATE'
		when state in ('VA','MA','GA') then 'Uk-STATE'
		else 'INDIA' end as Country

		from raw;
	quit;

/*The above example it creates two new variaables(new_reg,country)*/
/*but they are using diff operators(like, in)*/

	**********************************;

		/*FUNCTIONS*/
	**********************************;

/*MONOTONIC()*/

/*The monotonic() fn is quite similar to the internal variable _N_*/
/*in datastep.  we can use it to select the records according to*/
/*their row numbers.*/

/*It will extract 5th obsevation*/

PROC sql;
select * from raw where monotonic() =5;
quit;

data nn;
set raw;
if _n_ =5;
run;

/*It will extract 2,5,8,9 obsevations*/
PROC sql;
select * from raw where monotonic() in (2,5,8,9);
quit;

/*It will extract 5 to 9 obsevations*/
PROC sql;
select * from raw where monotonic() in (5:9);
quit;

/*or*/
data nn;
set raw;
if _n_ in (5:9);
run;

/*It will extract 2 to 3 and 6 to 9 obsevations*/
PROC sql;
select * from raw where monotonic() in (2:3,6:9);
quit;


/*FUNCTIONS*/
Data a;
input var;
datalines;
3.44
5.68
-4.25
;
run;

/*integer,ceil, floor, abs,round& range function*/
proc sql;
select var, int(var) as i_var,ceil(var) as c_var, 
		floor(var) as f_var,abs(var) as a_var,
		round(var) as r_var,range(var) as r_var from a;
	quit;

/*	mean,max,min&sum*/
proc sql;
select mean(var) as m_var,sum(var) as sum_var, 
		min(var) as min_var,max(var) as max_var 
			from a;
	quit;

data a;
input m1 m2 m3;
datalines;
12 23 34
23 43 33
22 44 66
;
run;

data a1;
set a;
s=sum(m1,m2,m3);
m=mean(m1,m2,m3);
ma=max(m1,m2,m3);
mi=min(m1,m2,m3);
run;

proc sql;
select mean(m1) as me, sum(m2) as sum, max(m3) as max from
	a;
	quit;
.
/*CHAR FUNCTIONS*/
/*	TRIM,  STRIP & CONCAT*/
data a;
var1="      Jagan      ";
var2="   MBA     ";
run;

proc sql;
create table n as
select *,trim(var1) as t_value, 
	strip(var2) as s_value from a;
quit;

proc sql;
create table n as
select *, trim(var1) || trim(var2) as t_value, 
		strip(var1) || strip(var2) as s_value from a;
quit;

/*UPCASE, LOWCASE, PROPERCASE*/
data a;
var1="Jagan";
var2="MBA Hyd";
run;

data a1;
set a;
vv=propcase(var2);
vv1=propcase(var2,'/');
run;

proc sql;
select *,lowcase(var1) as lcase,upcase(var2) as ucase,
	propcase(var2) as p_case,	
	propcase(var2,'/') as p_case2 from a;
	quit;
/*or*/
proc sql;
select *,lower(var1) as lcase,upper(var2) as ucase,
	propcase(var2) as p_case from a;
	quit;

/*SUBSTR*/
data a;
var="Stansys sas hyd";
run;

proc sql;
select *,substr(var,9) as var2,substr(var,9,3) as var3
	from a;
quit;

/*	CAT, CATT, CATS & CATX function*/
data a;
var1="   Jagan    ";
var2="   MBA hyd    ";
run;

proc sql;
create table n as
select *,cat(var1,var2) as cat,
	catt(var1,var2) as cat_T
	from a;
	quit;

proc sql;
create table tt as
select *,cat(var1,var2) as cat,
	catt(var1,var2) as cat_T,
	cats(var1,var2) as cat_s,
	catx("|",var1,var2) as cat_x
	from a;
	quit;

/*COMPRESS*/

data a;
var1="Last Bech      123   Hyderabad";
var2="Stansys Sas HYD";
var3="Vijaya@#$ 1234";
run;

proc sql;
create table n1 as
select *,compress(var1) as v1,
compress(var1,'abc') as v2,
compress(var1,'abc','d') as v3,
compress(var1,,'a') as v4,
compress(var1,,'as') as v5,
compress(var1,,'l') as v6,
compress(var1,,'u') as v7,
compress(var1,'a') as v8,
compress(var2,'swati') as v9,
compress(var3,,'a') as v10,
compress(var3,,'kd') as v11,
compress(var3,'@') as v12,
compress(var3,,'p') as v13
from a;
quit;

/*COMPBL*/
data a;
var1="nag      123   HYD";
var2="Rahul                  MBA";
run;

proc sql;
select *,compbl(var1) as v1,
compbl(var2) as v2 from a;
quit;

/*INDEX*/
data a;
var="jagan mba hyderabdad and working in bang";
run;

proc sql;
select *,index(var,"in") as v1,
		index(var,"an") as v2,	
		index(var,"a") as v3 from a;
quit;

/*INDEXC*/
data a;
var="jagan mba";
run;

proc sql;
select *,indexc(var,"mba") as v1,
indexc(var,"g","a","n") as v2,
index(var,"mba") as v3 from a;
quit;

/*INDEXW*/
data a3;
var="jagan mba hyderabdad and working in bang";
var1="stansys sas srnagr";
run;

proc sql;
select *,indexw(var,"in") as v1,
indexw(var,"mba") as v2,
	index(var,"in") as v3,
	indexw(var,"hyd") as v4 from a;
quit;

/*TRNAWORD, LENGTH , QUOTE, DEQUOTE, REPEAT */
data a;
a="SR Nagar Road";
c="Mr Vijaya";
run;

proc sql;
create table n2 as 
select *,tranwrd(a,"Road","Colony") as v1,
	tranwrd(c,"Mr","Miss") as v2,
	length(a) as lth,
	quote(a) as quote,
repeat('Hi',3) as repeat from a;
quit;

/*DATE FUNCTIONS*/
data a1;
a=10;
run;

proc sql;
select *, date() format=mmddyy10. as t_date from a1;
quit;

proc sql;
/*create table new as*/
select *,date() format=date9. as t_date,
		today() format=date7. as curr_date from a1;
quit;

proc sql;
/*create table new as*/
select *,
		month(date())as month,
		day(date()) as day,
		year(today()) as year 
		from a1;

quit;

proc sql;
/*create table new as*/
select *,
		month('23feb2015'd)as month,
		day('28dec2016'd) as day,
		year('23mar2015'd) as year,
		week('23mar2015'd) as week_no  
		from a1;
quit;

/*MDY FUcntion*/
proc sql;
select *,mdy(10,29,2015) as f_date,
		mdy(2,29,2015) as s_date,
		mdy(2,29,2016) as t_date from a;
		quit;
	
data a;
a='01jan2015'd;/*SAS START DATE*/
/*a='01jan1960'd;*/
b='31jan2016'd;
b1='31jan2018'd;
c=datetime();
d=dhms(today(),12,23,34);
format A DATE9. B DATE9. B1 DATE9. c datetime. d datetime.;
run;


proc sql;
/*CREATE TABLE NN AS*/
select *,
intck('days',a,b) as d_diff,
intck('week',a,b) as WK_diff,
intck('month',a,b1) as M_diff,
intck('qtr',a,b1) as Q_diff,
intck('semiyear',a,b1) as SY_diff,
intck('year',a,b1) as YR_diff,

intck('hour',c,d) as HR_diff,
intck('minute',c,d) as MS_diff,
intck('second',c,d) as SECdiff 
FROM A;
QUIT;

data a1;
a='23dec2015'd;
format a date9. ;
run;

PROC SQL;
/*CREATE TABLE N2 AS*/
SELECT *,
intnx('days',a,8) format=date7. AS one,
intnx('days',a,-8) format=date7. AS one_1,
intnx('month',a,12) format=date7. AS one_2,
intnx('month',a,-2) format=date7. AS one_3,
intnx('month',a,-12,'B') format=date7. AS one_4,
intnx('month',a,-12,'E') format=date7. AS one_5,
intnx('month',a,-12,'M') format=date7. AS one_6,
intnx('month',a,-3,'M') format=date7. AS one_7,
intnx('qtr',a,-2) format=date7. AS one_8,
intnx('week',a,-1) format=date7. AS one_9,
intnx('week',a,-1,'E') format=date7. AS one_10,
intnx('week',a,-1,'B') format=date7. AS one_10_1,
intnx('year',a,-1,'E') format=date7. AS one_11,
intnx('year',a,-1,'B') format=date7. AS one_12
from a1;
quit;

/*data a1;*/
/*a='23jan2016'd;*/
/*format a date9. ;*/
/*run;*/

/*PROC SQL;*/
/*SELECT *,*/
/*intnx('month',a,1,'M') format=date7. AS one_3*/
/*from a1;*/
/*quit;*/
/*UNION ALL, UNION, INTERSECT & EXCEPT*/

/*Union all;*/
/*adding the table one by one in sequencial order*/
/*Columns in each select stmt must also be in the same order*/
/*The columns must also have the same data type.*/

/*UNION:*/
/*adding the table one by one in sorting order*/
/*Columns in each select stmt must also be in the same order*/
/*The columns must also have the same data type.*/

/*Intersect: */
/*Reporting common observation from both tables.*/
/*Columns in each select stmt must also be in the same order*/
/*The columns must also have the same data type.*/

/*Except: */
/*Reporting the data without common from required tables*/
/*Columns in each select stmt must also be in the same order*/
/*The columns must also have the same data type.*/


data a;
input id name $ age sal;
datalines;
100 jagan 34 34000
400 suresh 32 23000
300 purna 23 22000
200 vijaya 30 32000
800 purna 23 22000
100 jagan2 34 34000
;
run;


data b;
input id name $ age sal;
datalines;
600 shyam 34 34000
200 vijaya 30 32000
100 jagan 34 34000
100 jagan1 34 34000
400 suresh 32 23000
500 bharath 23 22000
100 bharath 23 22000
;
run;

proc sql;
create table new_un_all as
select * from a
union all
select * from b;
quit;

/*UNION*/
/*IT will display the data in sorting order and without duplicate*/
/*observations*/

proc sql;
create table an_union as
select * from a
union
select * from b;
quit;


/*IT will display the common obervation from both tables*/
proc sql;
select * from a
intersect
select * from b;
quit;

/*IT will display the which records are present in a
table only*/
proc sql;
/*create table test as*/
select * from a
except
select * from b;
quit;

/*IT will display the which records present in b table only*/
proc sql;
select * from b
except
select * from a;
quit;

/*JOINS:*/
data first;
input id name $ age sal;
datalines;
100 jagan 34 50000
300 vijaya 30 43000
200 rahul 23 30000
400 swati 22 20000
;
run;

data second;
input id loc $ bonus qual $;
datalines;
100 bang 50000 mba
500 he 43000 mba
600 hyd 30000 btech
400 bombay 20000 mform
800 chenna 25000 mform
;
run;

/*sortring the data based on id variable*/
proc sort data=first out=a1;by id;run;
proc sort data=second out=a2;by id;run;

/*Left join*/
/*It will extract the all information from left side table and */
/*matching information from right side table*/

data d_lj;
merge a1(in=a) a2(in=b);
by id;
if a;
run;

proc sql;
create table sq_lj as
select sw.*,vij.* from first sw left join second vij
	on sw.id=vij.id;
quit;


proc sql;
create table sq_lj2 as
select first.*,second.* from first left join second
	on first.id=second.id;
quit;

/*Note: fisrt a means, for first table give the alias name as 'a'*/
/*second b means, for two table give the alias name as 'b'*/
/*a.* means it will come all the variables from 'a' table*/
/*b.* means it will come all the variables from 'b' table*/

/*RIGHT join*/
/*It will extract the all information from right side table and */
/*matching information from left side table*/

data d_rj;
merge a1(in=a) a2(in=b);
by id;
if b;/*Right join*/
run;

proc sql;
create table sq_rj as
select b.*,a.* from first a right join second b
	on a.id=b.id;
quit;


/*inner join*/
/*It will extract the matching information from both tables*/

data d_inj;
merge a1(in=a) a2(in=b);
by id;
if a and b;/*inner join*/
run;

proc sql;
create table sq_ij as
select a.*,b.* from first a inner join second b
	on a.id=b.id;
quit;

/*FULL JOIN*/
/*It will extract all informatin from both tables*/

data d_fj;
merge a1(in=a) a2(in=b);
by id;
if a or b;/*full join*/
run;

proc sql;
create table sq_fj as
select coalesce(a.id,b.id) as id,
	a.*, b.* 
	from first a full join second b
	on a.id=b.id;
quit;

/*execute this check the output dataset*/
/*proc sql;*/
/*create table sq_fj_1 as*/
/*select a.*, b.* */
/*	from one a full join two b*/
/*	on a.id=b.id;*/
/*quit;*/


/*MULTIPLE tables:*/
data first;
input id name $ age sal;
datalines;
100 jagan 34 50000
300 vijaya 30 43000
200 rahul 23 30000
400 swati 22 20000
;
run;

data second;
input id loc $ bonus qual $;
datalines;
100 bang 50000 mba
500 he 43000 mba
600 hyd 30000 btech
400 bombay 20000 mform
800 chenna 25000 mform
;
run;

data third;
input id loc1 $ bonus1 qual1 $;
datalines;
100 bang 50000 mba
500 he 43000 mba
600 hyd 30000 btech
400 bombay 20000 mform
800 chenna 25000 mform
;
run;

/*sortring the data based on id variable*/
proc sort data=first out=a1;by id;run;
proc sort data=second out=a2;by id;run;
proc sort data=third out=a3;by id;run;


proc sql;
create table sq_lfj2 as
select a.*,b.*,c.* from first a left join second b
	on a.id=b.id 
left join third c
	on b.id=c.id;
quit;


data d_lj;
merge a1(in=a) a2(in=b) a3(in=c);
by id;
if a;
run;



