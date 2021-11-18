/*STATEMENTS*/

/*Keet statement*/
/*specifies the variables to include in o/p sas datasets*/

/*syntax: Keep variable list*/

/*keep option*/

data new;
input id name $ age loc $ sal;
datalines;
100 jagan 34 hyde 50000
200 mohan 30 bang 60000
300 kumar 40 che 60000
;
run;

/*keep options*/
data test(keep=id name age) test_1(keep=id loc sal);
set new;
run;

/*statement*/
data test_2 test_3;
set new;
keep id name age;
run;

data test_4 test_5;
keep id name age;
set new;
run;

/*second example*/
data a(keep=name age height) b(keep=name sex weight);
set sashelp.class;
run;

data one two;
set sashelp.class;
keep name age weight;
run;

/*Difference b/w keep option & Keep statement*/
/*1.the keep stmt applies to all sas dataset that are created within*/
/*th same datastep and can appear any where in the step. The Keep*/
/*option should specify for each dataset that created with in the */
/*same data step and appears as a dataset option.*/
/**/
/*2.the keep stmt cann't be used in sas proc steps. the keep option*/
/*can be use in proc steps.*/
/**/
/*3. the keep stmt works before PDV but keep option work after PDV.*/


/*DROP STATEMET*/
/*excludes variables from o/p sas datasets*/
data new;
input id name $ age loc $ sal;
datalines;
100 jagan 34 hyde 50000
200 mohan 30 bang 60000
300 kumar 40 che 60000
;
run;

/*THE BELOW EXAMPLE USING THE DROP OPTIONS*/
data test_8(drop=id name age) test_9(drop=id loc sal);
set new;
run;

/*statement*/
data test_21 test_31;
set new;
drop id name age;
run;

data test_4 test_5;
drop id name;
set new;
run;

/*Difference b/w drop option & drop statement*/
/*1.the drop stmt applies to all sas dataset that are created within*/
/*th same datastep and can appear any where in the step. The drop*/
/*option should specify for each dataset that created with in the */
/*same data step and appears as a dataset option.*/
/**/
/*2.the drop stmt cann't be used in sas proc steps. the drop option*/
/*can be use in proc steps.*/
/**/
/*3. the drop stmt works before PDV but drop option works after PDV.*/


/*RENAME STATEMENT*/
/*Rename variables permanently in SAS datasets*/
/*Syntax: rename oldvarname1=newvarname oldvarnamen=newvarnamen ;*/
data a1(rename=(id=employee_NO name=emp_name)) 
	a2(rename=(id=eno name=employe_name));
set new;
run;

/*statement*/
data a3 a4;
set new;
rename id=emp_no name=emp_name;
run;

/*Difference b/w rename option & rename statement*/
/*1.the rename stmt applies to all sas dataset that are created within*/
/*th same datastep and can appear any where in the step. The rename*/
/*option should specify for each dataset that created with in the */
/*same data step and appears as a dataset option.*/
/**/
/*2.the rename stmt cann't be used in sas proc steps. the rename */
/*option can be use in proc steps. WE can change the variable name*/
/*in proc datasets proc with modify stmt, but we are unable to create new*/
/*dataset.*/
/**/
/*3. the rename stmt works before PDV but rename option works after PDV.*/

proc datasets library=work;
modify a;/*A is datasetname here*/
rename name=emp_name;
run;

/*WHERE STATEMENT*/
/*Select observations from sas dataset when it meets condition*/
/*syntax: where variablename condition;*/
data a1(where=(sex='M')) 
	a2(where=(age >= 15))
	a3(where=(sex='M' and age >= 15));
set sashelp.class;
run;

/*statement*/
data a3 a4 a5 a6;
set sashelp.class;
where age >= 14;
run;

data a8 a9 a10;
set sashelp.class;
where age >= 14 and height ge 60.0;
run;

/*execute this program and check the log*/
data a3 a4 a5 a6;
where age >= 14;
set sashelp.class;
run;

/*Difference b/w WHERE option & WHERE statement*/
/*1.the where stmt applies to all sas dataset that are created within*/
/*the same datastep and can appear after i/p or set stmt. The where*/
/*option should specify for each dataset that created with in the */
/*same data step and appears as a dataset option.*/
/**/
/*2.the WHERE stmt can be used in both steps(PROC & DATA step). the */
/*where option can be use in proc steps.*/
/**/
/*3. the WHERE stmt works before PDV but WHERE option works after*/
/*PDV.*/

PROC print data=sashelp.class;
where age ge 14;
run;

/*sorting the data in ascending order */
proc sort data=sashelp.class out=t;
where sex = 'M';
by age;
run;

/*sorting the data in descending order */
proc sort data=sashelp.class out=t1;
where sex = 'F';
by descending name ;
run;

******************************;
/*REMOVE STATEMENT*/
/*Delete an observation from a sas dataset.*/
/*Syntax: remove datasetname;*/
/*Note: Remove stmt works only with a modify stmt*/

data a;
set sashelp.class;
run;

/*execute this program and check the log*/
data b;
set a;
if age =14 then remove;
run;

/*execute this program and check the log it's given error*/
data c;
modify a;
if age =14 then remove;
run;

data a;
modify a;
if age =14 then remove;
run;

/*example 2*/
data a1 a2 a3;
set sashelp.class;
run;

/*execute this and check the log*/
data a1 a2 a3;
modify a1 a2 a3;
if age =13 then remove;
run;

/*I want remove the age =13 from all datasets*/
data a1 a2 a3;
modify a1;
modify a2;
modify a3;
if age =13 then remove;
run;

/*example 3*/
data d1 d2 d3;
set sashelp.class;
run;

data d1 d2 d3;
modify d1;
modify d2;
modify d3;
if age =13 then remove d1;
if age =14 then remove d2;
if age in (11,12) then remove d3;
run;

/*DELETE STATEMENT*/

/*Delete an observation from a sas dataset.*/

data b1;
set sashelp.class;
run;

data b2;
set b1;
if age=14 then delete;
run;

data b21 b3 b4;
set b1;
if age=13 then delete;
run;


/*Note: When delete executes the current observation is not written*/
/*to a dataset, and sas returns immediately to the begining of the */
/*datastep for the next iteration.*/

/*SUM STATEMENT*/
/*syntax: variable+var2+var3+---+var4*/
/*adds the result of an expression to an accumulator variable.*/
data a;
a=10;
b=25;
c=45;
d=38;
;
run;

data b;
set a;
total=a+b+c+d;
run;

/*execute this program check the dataset for total & total_2 var*/
data a;
a=10;
b=.;
c=36;
d=87;
total=a+b+c+d;
total_2=sum(a,b,c,d);
run;

/*Example 3*/
data stu;
infile datalines dsd missover; 
input id name $ m1 m2 m3;
datalines;
100,jagan,80,90,95
200,rahul,89,.,87
300,surya,45,78,98
400,bharat,45,,
;
run;

data stu1;
set stu;
t1=m1+m2+m3;
t2=sum(m1,m2,m3);
run;

/*Diff b/w sum stmt & Sum function*/
Sum stmt works with only  non missing values. But sum function 
works with missing values also.

Sum stmt adds the value into variables with non missing values. If
missing values are there after sum value(output) is missing. Sum
function return the sum of non missing value














