/*PROC RANK*/
/*THe rank procedure calculate ranks for one or more 
numeric variables in SAS dataset.*/

/*SYNTAX*/
PROC RANK data=a out=b;
by variables;
var variables;
ranks new-variables;
run;

/*BY: calculate a separate set of ranks for each by
group*/
/*VAr: specify the variable to print ranks*/
/*RANKS: Identify a variable that contain the ranks*/


/*NOTE: IF WE WON'T USE OUT= SYS CREATES DATASETS LIKE 
DATA1, DATA2 ETC*/

data a; 
   input loc gain; 
   cards; 
1 7.2 
1 7.9 
1 7.6 
1 6.3 
1 8.4 
1 8.1 
2 8.1 
2 7.3 
2 7.7 
2 7.7 
; 
run;

/*It will create the out dataset as data1*/
proc rank data=a;
var gain;
run;

proc rank data=a out=a1;
var gain;
run;

/*It will create the output dataset as a1 and cretes 
new variable or rank*/
proc rank data=a out=a1;
var gain;
ranks new;
run;

/*EXAMPLE 2*/
data relay; 
   input name $ sex $ m1 m2 fly free; 
   cards; 
Sue     F 35.1 36.7 28.3 36.1 
Karen   F 34.6 32.6 26.9 26.2 
Jan     F 31.3 33.9 27.1 31.2 
Andrea  F 28.6 34.1 29.1 30.3 
Carol   F 32.9 32.2 26.6 24.0 
Ellen   F 27.8 32.5 27.8 27.0 
Jim     M 26.3 27.6 23.5 22.4 
Mike    M 29.0 24.0 27.9 25.4 
Sam     M 27.2 33.8 25.2 24.1 
Clayton M 27.0 29.2 23.0 21.9 
; 
run;

proc rank data=relay out=re1;
var m1 m2;
ranks rank_m1 rank_m2;
run;

proc rank data=relay out=re2;
var m1 m2 fly free;
ranks rm1 rm2 rfly rfree;
run;

proc sort data=relay;
by sex;
run;

/*It will give the rank by gender wise*/
proc rank data=relay out=re2;
by sex;
var m1 m2 fly free;
ranks rm1 rm2 rfly rfree;
/*where sex = 'M';*/
run;

proc print data=re2;
by sex;
run;

/*It will print ranks based on heighest marks*/
/*Rank give Highest to lowest*/
proc rank data=relay out=re3 descending;
var m1 m2 fly free;
ranks rm1 rm2 rfly rfree;
run;

proc rank data=relay out=re4 descending;
by sex;
var m1 m2 fly free;
ranks rm1 rm2 rfly rfree;
run;

proc print data=re4;
by sex;
run;


