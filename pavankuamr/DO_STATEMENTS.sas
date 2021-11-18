/*DO STATEMENT*/

/*1. Do-End*/
/*2. do-Iteration*/
/*3. Do while*/
/*4. Do until*/

/*DO: If condition is statify then do statment execute.*/
/*syntax: */
/*if expression then	do;*/
/*		stmts;*/
/*		end;*/

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

data raw1;
set raw;
if region='Eastern' then do;
hike=expenses*.10;
new_expenses=hike+expenses;
end;
run;

data raw11;
set raw;
if region='Eastern' then do;
expenses=expenses+1000;
revenue=revenue+10000;
end;
run;

data raw2;
set raw;
if region='Eastern' then do;
hike=expenses*0.10;
new_expenses=hike+expenses;
end;
if region='Southern' then do;
hike=expenses*0.15;
new_expenses=hike+expenses;
end;
run;

data raw3;
set raw;
if age in (3, 5, 10) then do;
hike=expenses*0.15;
new_expenses=hike+expenses;
end;
run;

data raw4;
set raw;
if age in (3, 5, 10) and 
	region in ('Eastern','Southern') then do;
hike=expenses*.15;
new_expenses=hike+expenses;
end;
run;

/*The below example if condition is satisfy it will 
change the value in existing variable */
data raw5;
set raw;
if age in (3, 5, 10) and 
	region in ('Eastern','Southern') 
	and expenses > 7500 
	then do;
	STATE='VA';
	capital='INDIA';
	end;
run;

/*DO _ITERATION*/
/*The iteration do loop executes the stmts b/w Do and 
ENd repetitively based on the value of index variable.*/

/*Syntax:*/
/*	Do index-var= start to stop;*/
/*	stmts;*/
/*	end;*/

data a;
do i = 1 to 10;
end;
run;

/*It will print the i value is 16*/
data a1;
do i = 3 to 15;
end;
run;

/*It will print the i value is 152*/
data a2;
do i = 5 to 151;
end;
run;

/*It will print the i value 1 to 10*/
data a3;
do i = 1 to 10;
output;
end;
run;

/*execute this program and check the output dataset*/
data a4;
do i = 1 to 10;
output;
end;
stop;
run;

/*execute this program and check the output dataset*/
/*It will print the i value is 1*/
data a5;
do i = 1 to 10;
output;
stop;
end;
run;

data a6;
do i = 3 to 1500;
output;
end;
stop;
run;

data a7;
do i = 5 to 15;
output;
end;
stop;
run;

data a8;
do i = 10 to 15;
output;
end;
stop;
run;

data a9;
do i = 1,2,3,4,5;
output;
end;
stop;
run;

/*dates*/
data ad;
do i = '01feb2018'd to '20mar2018'd;
end;
format i date9.;
run;

data ad;
do i = '01feb2018'd to '20mar2018'd;
output;
end;
format i ddmmyy8.;
run;

/*IT will print 20mar2018 only*/
data ad2;
do i = '01feb2018'd ,'10mar2018'd,'12mar2018'd,'20mar2018'd;
end;
format i date9.;
run;

/*IT will print 01feb to 10mar ,12mar and 20mar2018 around 40 recs*/
data ad3;
do i = '01feb2018'd to '10mar2018'd,'12mar2018'd,'20mar2018'd;
output;
end;
format i date9.;
run;

/*IT will print 01feb,10mar,12mar and 20mar2018 only 4 records*/
data ad3;
do i = '01feb2018'd ,'10mar2018'd,'12mar2018'd,'20mar2018'd;
output;
end;
format i date9.;
run;

data ad4;
do i = '01feb2018'd ,'10mar2018'd,'12mar2018'd,'20mar2018'd;
output;
stop;
end;
format i date9.;
run;


/*The Iterative do statement use the by stmt*/
data ab;
do i = 1 to 10 by 1;
output;
end;
run;

/*it will print the i value is every second record*/
data ab1;
do i = 1 to 10 by 2;
output;
end;
run;

/*it will print the i values in reverse order*/
data ab2;
do i = 10 to 1 by -1;
output;
end;
run;

/*it will print the i values in reverse order and every 3 record*/
data ab3;
/*do i = 10 to 1 by -2;*/
do i = 10 to 1 by -3;
output;
end;
run;

data ab3;
/*do i = 10 to 1 by -2;*/
/*do i = 60 to 1 by -5;*/
do i = 60 to 1 by -.5;
/*do i = 60 to 1 by 2;*/
/*do i = 10 to 1 by 2;*/
output;
end;
run;

/*IT will create 3 variables(i,var & var2)*/
data ab5;
do i = 1 to 10 by 0.5;
	var=i+1;
	var2=i**2;
output;
end;
run;

data a;
set sashelp.class;
run;

/*it will extract only b/w 11 to 13 age only and create the dataset*/
/*with only one variable*/
data n;
set a;
 do i = 11 to 13;
/* do i = 11, 13;*/
 if age = i then output;
 end;
keep age;
run;

/*It will create two new variables, var2 having square values*/
data a1;
do i = 1 to 10;
	var = i+1;
	var2 = i**2;
	output;
	end;
run;

/*It will create two new variables, var2 having multiply with */
/*5 values*/
data a2;
do i = 1 to 10;
	var = i+0;
	var2 = i*5;
	output;
	end;
run;

/*IT will pritn only one record*/
data a3;
balance = 2000;
do i = 1 to 6;
	balance=balance+1000;
	end;
	run;

/*IT will print only one record*/
data a4;
balance = 2000;
do i = 1 to 6;
	balance=balance+1000;
	output;
	stop;
	end;
	run;

/*IT will print 6 records( 1 to 6)*/	
data a14;
balance = 2000;
do i = 1 to 6;
	balance=balance+1000;
	output;
	end;
	stop;
	run;

/*IT will print only one record*/	
data a5;
balance = 18000;
do i = 1 to 6;
	balance=balance - 1000;
	end;
	run;

/*IT will print 5 records*/	
data a2;
k=5;
do i = 1 to k;
	var = i+0;
	var2 = i*2;
	output;
	end;
run;

/*IT will print 5 record*/	
data a21;
k=5;
do i = k-4 to k;
	var = i+0;
	var2 = i*2;
	output;
	end;
run;

/*IT will print the i values in log window and print 6 records*/
data a2;
k=5;
j=6;
do i = k-4 to j;
	var = i+0;
	var2 = i*2;
	put i=;
	output;
	end;
run;

data a5;
balance = 18000;
do i = 1 to 6;
	balance=balance - 1000;
	output;
	end;
	run;

data loan;
balance = 300000;
do i = 1 to 30 by 1;
balance=balance - 10000;
output;
end;
run;

data loan2;
balance = 300000;
payments= 0;
/*do i = 1 to 48 by 1;*/
/*do i = 48 to 1 by -1;*/
do i = 60 to 1 by -0.51;
balance=balance - 5000;
payments=payments+1;
output;
end;
run;

data loan2;
balance = 300000;
payments= 0;
do i = 60 to 0.5 by -0.5;
balance=balance - 2500;
payments=payments+1;
output;
end;
run;
/*DO-WHILE*/

/*Execute stmts in do loop repetitively while condition is ture.*/

/*Syntax:*/
/*	Do while(expression)*/
/*		stmts;*/
/*		end;*/

data a;
x=0;
/*do while (x < 10);*/
do while (x le 15);
x=x+1;
put x=;
output;
end;
run;

/*execute this program and check the log the x value will be print
before calculating*/
data a1;
x=0;
do i = 1 to 10 by 0.5 while (x < 15.5);
put x=;
x=i**2;
output;
end;
run;

data a1;
x=0;
do i = 1 to 10 by 0.5 while (x < 10);
put x = ;/*x value it will be print in log wind0w*/
x=i+2;
output;
end;
run;

/*execute this program and check the log*/
data a6;
balance = 30000;
payments= 0;
do while (balance gt 0);
balance=balance - 5000;
payments=payments+1;
output;
end;
run;

data a8;
balance = 30000;
payments= 0;
/*do while (balance > 0);*/
do while (balance > 2000);
balance=balance - 500;
payments=payments+1;
output;
end;
run;


/*DO-UNTIL*/
/*Execute stmts in do loop repetitively until condition is ture.*/

/*Syntax:*/
/*	Do until(expression)*/
/*		stmts;*/
/*		end;*/

data a;
x=0;
/*do until (x ge 10);*/
do until (x >= 15);
put x=;
x=x+1;
output;
end;
run;

/*execute this program and check the log the x value will be print
before calculating*/
data a1;
x=0;
do i = 1 to 10 by 0.5 until (x ge 20);
/*do i = 1 to 10 by 0.5 while (x le 20);*/
put x=;
x=i**2;
output;
end;
run;

data a1;
x=0;
do i = 1 to 10 by 0.5 until (x ge 16);
put x = ;/*x value it will be print in log wind0w*/
x=i**2;
output;
end;
run;

/*execute this program and check the log*/
data a6;
balance = 30000;
payments= 0;
do until (balance <= 0);
/*do while (balance gt 0);*/
balance=balance - 1500;
payments=payments+1;
output;
end;
run;

data a8;
balance = 30000;
payments= 0;
/*do until (balance le 0);*/
do until (balance <= 15000);
balance=balance - 500;
payments=payments+1;
output;
end;
run;








