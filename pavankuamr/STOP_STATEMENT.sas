/*STOP STATEMENT*/
/*stop execution of the current datastep.*/
/*syntax: stop;*/

/*point : we can use this option for selecting particular observation*/
/*from dataset*/
 
data emp;
infile datalines;
stop;
input id name $ dept $ sal;
datalines;
100 jagan ece 4000
200 surya comp 5000
300 vijaya it 6000
;
run;

/*Note: when i/p or set stmt executes data should  read into*/
/*input buffer but we are using the stop stmt, so it */
/*won't read into i/p buffer. So PDV cann't assign data */
/*to variables. that's why we are getting dataset with */
/*zero observation.*/

data a1;
x=8;
set sashelp.class point=x;
output;
stop;
run;

/*Note: the above program, when it's read nth observation it's give*/
/*into output and it's stop to read other observations so*/
/*it's reduce execution time*/

/*Execute this program also*/
data a2;
x=5;
set sashelp.class point=x;
output;
/*stop;*/
run;

data a3;
do x = 2,5,8,9,15;
set sashelp.class point=x;
output;
end;
stop;
run;

data qc;
set sashelp.class;
if _n_ in (2,5,8,9,15);
run;

proc sql;
create table qc1 as
select * from sashelp.class where 
	monotonic() in (2,5,8,9,15);
quit;

/*Note: the above program, when it's read 2,5 & 9th observation it's */
/*give into output and it's stop to read other observations so it's */
/*reduce execution time*/

data a5;
do x = 5 to 15;
set sashelp.class point=x;
output;
end;
stop;
run;

/*Note: the above program, when it's read 5 to 15 observations it's */
/*give into output and it's stop to read other observations so it's */
/*reduce execution time*/

data a6;
do x = 2,5,9;
set sashelp.class point=x;
output;
stop;
end;
run;

/*NOTE: WHEN IT's read 2 nd observation it's give into */
/*output and its stop to read other observations*/

data a8;
do x = 9 to 14;
set sashelp.class point=x;
output;
stop;
end;
run;

/*NOTE: WHEN IT's read 9th observation it's give into output and its*/
/*stop to read other observations*/

data a8;
do x = 2 to 5,9 to 14;
set sashelp.class point=x;
output;
end;
stop;
run;
