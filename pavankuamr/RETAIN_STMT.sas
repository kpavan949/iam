/*RETAIN*/

/*Retain stmt is a compilation stmt which is used to keep*/
/*the value of variable through the datastep execution.*/
/**/
/*Note: retain is useful to calculate cumulative totals*/

/*syntax: retain var-name intialvalues(0);*/
data emp;
input id name $ dept $ sal;
datalines;
100 jagan ece 4000
200 surya comp 5000
300 vijaya it 6000
400 bharath comp 6000
500 kiran it 8000
600 swati ece 6800
700 ramesh comp 5000
800 kumar it 9000
900 swati2 ece 8800
;
run;

data a1;
set emp;
retain totalsal 0;
totalsal+sal;
run;

data a2;
set emp;
retain totalsal 0;
totalsal=totalsal+sal;
run;


data a3;
set emp;
retain totalsal 0;
totalsal=sum(totalsal,sal);
run;

/*Sorting the data based on Dept variable*/
proc sort data=emp out=emp1;
by dept;
run;

/*The below example calculate the total sal by deptwise*/
data new;
set emp1;
by dept;
retain tsal 0;
if first.dept then tsal=sal;
else tsal+sal;
run;

/*The below example it will calculate the sal by deptwise and*/
/*display the first.id and & last.id values*/
data new1;
set emp1;
n_dt=first.dept;
l_dt=last.dept;
by dept;
retain tsal 0;
if first.dept then tsal=sal;
else tsal+sal;
run;


/*example2*/
data raw;
set sashelp.class;
run;

proc sort data=raw out=raw2;
by age;
run;

data new;
set raw2;
by age;
retain tht 0;
if first.age then tht=height;
else tht+height;
if age in (11,12,13);
fage=first.age;
lage=last.age;
run;

/*example 3*/
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

proc sort data=raw out=new;
by state;
run;

data new2;
set new;
by state;
retain totexp 0;
if first.state=1 then totexp=expenses;
else totexp+expenses;
run;
