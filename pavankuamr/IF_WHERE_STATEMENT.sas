/*IF STATEMENT*/

/*Continues processing only those observations that 
meets the condition*/

/*syntax: if expression;*/

data raw; 
   input region $ state $ month monyy5. 
         age expenses revenue; 
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
/*IT will exract southern region only*/
data a1;
set raw;
if region = 'Southern';
run;

/*IT will exract southern& Northern region only*/
data a2;
set raw;
if region in ('Southern','Northern');
run;

/*IT will exract except southern& Northern region only*/
data a3;
set raw;
if region not in ('Southern','Northern');
run;

data a4;
set raw;
if age = 10;
run;

data a5;
set raw;
/*if age ge 6;*/
/*if age gt 6;*/
/*if age lt 6;*/
if age le 6;
run;

/*IF- THEN STATEMENT*/
/*Executes a sas stmt for observations that meets specific condition*/
/*and it is useful to rename data values.*/

/*syntax: If expression then statement;*/

data a;
length sex $8.;
set sashelp.class;
run;

data a1;
set a;
if sex = 'M' then sex = 'Male';
run;

data a2;
set a;
if age ge 13 then sex = 'Male';
run;

data a3;
set raw;
/*if region in ('Eastern', 'SOUthern') then sex = 'Male';*/
if region in ('Eastern', 'Southern') then sex = 'Male';
run;

data a4;
set raw;
if region not in ('Eastern', 'Southern')
	then expenses = expenses+1000;
run;
/*IT-THEN -ELSE STMT*/

Executes a SAS Stmt for observation that meets specific coniditions
and it is useful to rename data values with less execution time.
compare with if-then stmt.

/*syntax:*/
/*if  expression then stmt;*/
/*else stmt;*/

data a5;
set a;
if sex  = 'M' then sex ='Male';
else sex='Female';
run;

data a6;
set a;
if age  in (14,15) then sex ='Male';
else sex='Female';
run;

data a8;
set raw;
if region ='Eastern' then region ='EAST';
else region='others';
run;

data a9;
set raw;
if region ='Eastern' then region ='EAST';
else
if region ='Northern' then region ='North';
else
if region ='Southern' then region ='South';
else
region='others';
run;

/*whenever execute this program first run without length stmt and */
/*check the output dataset. second time run with length stmt and*/
/*check the output dataset*/
/*in the below prog creates dept variable*/

data a10;
length dept $8.;
set raw;
if region ='Eastern' then dept = 'EAST';
else
if region ='Northern' then dept ='North';
else
if region ='Southern' then dept ='South';
else
dept='others';
run;

data a11;
/*length dept $8.;*/
set raw;
if region ='Eastern' then dept = 100;
else
if region ='Northern' then dept =200;
else
if region ='Southern' then dept =300;
else
dept=400;
run;

/*IF-THEN-ELSE output*/
/*executes a sas stmt for observations that meets specific*/
/*condition using this we can multiple datatasets at a */
/*time based on condition*/

/*syntax: if expression then output else output;*/


data reg1 reg2 reg3 reg4;
set raw;
if region ='Eastern' 
	then output reg1;
else
if region ='Southern'
		then output reg2;
else
if region ='Northern'
		then output reg3;
else output reg4;
run;

data minor major senior;
set sashelp.class;
if age = 11 
	then output minor;
else
if age in (12,13) 
		then output major;
else
if age > 13
		then output senior;
run;

/*IF-THEN-DELETE*/
/*Executes a sas stmt for observations that meets specific*/
/*condition using this we can delte observation*/

/*syntax: If expression then delete*/

data a;
set sashelp.class;
if age in (14,15) then delete;
run;


data a1;
set raw;
if region ='Southern' then delete;
run;

/*IF-THEN REMOVE*/
Executes a sas stmt for observations that meets specific
condition using this we can delte observation

Note:REmove stmt work with modify stmt

syntax: IF expression then remove

data a b c;
set sashelp.class;
run;

data a;
set a;
if age in (14,15) then delete;
run;

/*Execute this program and check the log*/
data b;
set b;
if age in (14,15) then remove;
run;

data b;
modify b;
if age in (14,15) then remove;
run;

data a b c;
modify a;
modify b;
modify c;
if age in (14,15) then remove a;
if age in (11,12) then remove b;
if age >12 then remove c;
run;
/*IF-THEN DO---END*/
Executes a sas stmt for observations that meets specific
condition using this we can create new variable or 
calculatins

/*Syntax: */
/*It exepression then do; stmts; end;*/

data raw1;
set raw;
if region='Eastern' then do;
hike=expenses*.10;
new_expenses=hike+expenses;
end;
run;

data raw2;
set raw;
if region='Plains' then rating='excellent';
if region='Eastern' then rating='good';
if region='Southern' then rating='avg';
if region='Northern' then rating='poor';
run;

data raw3;
set raw2;
if rating='good' then do;
hike=expenses*.10;
new_expenses=hike+expenses;
end;
if rating='avg' then do;
hike=expenses*.08;
new_expenses=hike+expenses;
end;
if rating='poor' then do;
hike=expenses*.05;
new_expenses=hike+expenses;
end;
if rating='excellent' then do;
hike=expenses*.15;
new_expenses=hike+expenses;
end;
run;


*************************************;
/*WHERE STATEMENT*/
*************************************;
/*select observation from sas dataset when it meets*/
/*condition*/

/*syntax: where expression;*/

/*execute this program and check the log clearly*/
data a;
set sashelp.class;
if age = 15;
run;

/*execute this program and check the log clearly*/
data a2;
set sashelp.class;
where age = 15;
run;

data a3;
set raw;
where region  = 'Eastern';
run;

data a4;
set raw;
/*where region  <> 'Eastern';*/
where region  ne 'Eastern';
run;

data a4;
set raw;
where month eq '01MAR78'd;
run;

data a4;
set sashelp.class;
/*where age eq 14;*/
/*where age ne 14;*/
/*where age lt 14;*/
/*where age le 14;*/
/*where age gt 14;*/
where age ge 14;
run;


/*WHERE AND*/
/*syntax: where expression and expression and;*/
data a;
set raw;
where expenses > 7800;
run;

/*It will extract the data from 7801 to 9999*/
data a;
set raw;
where expenses > 7800 and expenses < 10000;
run;

/*first It will extract month and then extract the expenses*/
data a1;
set raw;
where month = '01MAR78'd and expenses > 8000;
run;

data a2;
set raw;
where month = '01MAR78'd
	and age >10 
	and expenses > 8000;
run;

data a3;
set raw;
where month in ('01MAR78'd,'01FEB78'd)
	and age >10 
	and expenses > 8000;
run;

/*WHERE BETWEEN*/

/*Syntax: Where varname between value1 and Values2*/

data wb;
set raw;
where expenses between 7800 and 10000;
run;

data wb_1;
set sashelp.class;
where age between 12 and 15;
run;

data wb_1;
set raw;
where month between '01FEB78'd and '01MAR78'd;
run;

/*WHERE SAME AND*/
/*Syntax: Where same and varname expression;*/
data ws_2;
set raw;
where expenses >= 7800;
where same and expenses le 10000;
run;

/*The below examples ws_31 & ws_32 having the same data*/
data ws_31;
set raw;
where age >= 5;
where same and age le 8;
run;

data ws_32;
set raw;
where age >= 5 and age le 8;
run;

data ws_4;
set raw;
where month >= '01FEB78'd;
where same and month le '01MAR78'd;
run;

/*WHERE IN*/
/*When we have multiple values in condition while selecting */
/*observations*/
data ws_2;
set raw;
where expenses in (7800,8000,6000,3000);
run;

data ws_3;
set raw;
where expenses not in (7800,8000,6000,3000);
run;

data ws_4;
set raw;
where region in ('Eastern','Northern');
run;

data ws_4;
set raw;
where region not in ('Eastern','Northern');
run;

/*WHERE LIKE*/
/*Like operator is useful to select the observation with*/
/*particular poistion of letter in a variable value.*/
/*First execute this and check the log*/

/*IF any value start with e, it will extract the data for those only*/
data wl;
set raw;
where region like 'e%';
run;

/*IF any value start with E, it will extract the data for those only*/
data wl;
set raw;
where region like 'E%';
run;

/*IF any value start with S, it will extract the data for those*/
/*only*/
data w2;
set raw;
where region like 'S%';
run;

/*IF any value end with n, it will extract the data for those only*/
data w3;
set raw;
where region like '%n';
run;

/*IF any value end with A, it will extract the data for those only*/
data w4;
set raw;
where state like '%A';
run;

/*IF any value between o it will extract those records */
data w5;
set raw;
where region like '%o%';
run;

/*IF any value between er it will extract those records */
data w5;
set raw;
where region like '%er%';
run;

data w3;
set raw;
/*where expenses like '7%';*/
where expenses like '%8%';
run;

/*Note: like oprator it will work for only char variable*/


/*WHERE CONTAINS*/
/*select the data whereever that letter is there in*/
/*variable. But letter is case sensitive*/

data a;
input id name $ loc $;
datalines;
100 Jagan hyd
200 swati bang
300 vijaya che
400 Suresh che
500 Lucky bang
600 ramesh che
700 kumar che
800 Sandhya bang
900 kumar1 che
;
run;

/*It will extrat the data whereever a is there*/
data wc;
set a;
where name contains 'a';
run;

/*It will extrat the data whereever ma is there*/
data wc1;
set a;
where name contains 'ma';
run;

data wc2;
set a;
where name contains 'u';
run;

/*execute this program check the outut dataset*/
data wc3;
set a;
/*where name contains 'S';*/
where name ? 'S';
run;

data wc3;
set a;
where name contains 's';
run;

data wc3;
set a;
where name ? 's';
run;

/*WHERE SOUND*/
/*Select the data only when sound is same*/
data a;
input id name $;
datalines;
100 maneesha
200 manisha
300 smith
400 smit
500 weak
300 week
220 color
230 colour
;
run;

/*first execute this program and check the log & dataset*/
data b;
set a;
/*where name = 'week';*/
where name = 'weak';
run;

/*first execute this program and check the log & dataset*/
data b;
set a;
where name = *'weak';
run;

data b;
set a;
where name = *'maneesha';
run;

/*WHERE NULL*/
/*select observation when it contains missing values.*/

data a;
set raw;
if region in ('Southern') then region = ' ';
run;

data new;
set a;
/*where region is null;*/
where region is missing;
run;


/*DIFF b/W IF & WHERE statement*/
If:
1.If works in only datastep.(except in proc report it works
with compute statement).
2.If we can use while reading the data from datalines, 
external files & existing datasets
3.If works with arithemetic, logical comparison operators
But cann't work with expressions.
4.If works after PDV

WHERE
1.Where stmt works in both datastep & Proc step.
2.Where we can use only when we are reading from existing
datasets.
3.where works with arithemetic, logical, comparison and
expressions also.
4. But where works before PDV
























