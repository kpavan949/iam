/*PROC CONTENTS*/
/*Proc contents gives descriptive information for all*/
/*variables found in sas dataset such as type,length,*/
/*postion, format, informat and lable.*/
/**/
/*Using this procedure we can see descption information*/
/*of dataset.*/
/*It is useful for document purpose(documenting sas */
/*datasets stored in library)*/

/*Syntax:*/

Proc contents <options>;
run;

data raw; 
   input region $ state $ month monyy5. 
         headcnt expenses revenue; 
   format month date9.; 
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

/*Data: Specify the input dataset*/
proc contents data=raw;
run;

proc contents data=sashelp.class;
run;

/*sashelp libname*/
/*voption is dataset*/
proc contents data=sashelp.Voption;
run;

/*out: specify the output dataset.It creates description information*/
/*postion in o/p dataset.*/

proc contents data=raw out=test;
run;

proc contents data=sashelp.class out=test1;
run;

/*Noprint: Suppress the pritning of the output.*/

proc contents data=sashelp.class out=test2 noprint  ;
run;

/*Position:*/
/*Default variables in the dataset are printed out an*/
/*alphabetic order. when this position specified, a*/
/*second list of variables is o/p according to their */
/*position in the dataset*/

proc contents data=raw out=test position;
run;

/*Varnum: Print a list of the variables by their logical*/
/*position in the dataset*/

proc contents data=raw out=test varnum;
run;

/*Short*/
/*Print out only name of variable in sas dataset.*/

proc contents data=raw out=test short;
run;

/*Default it prints list of variables in alphabetic order, But*/
/*need to print in both alphabetic and dataset order.*/

proc contents data=raw out=test short position;
run;

proc contents data=raw out=test  short varnum ;
run;

/*Centiles: Print centiles information for indexed
variables*/

/*Simple index*/
PRoc sql;
create index region on raw(region);
quit;

proc contents data=raw out=test centiles;
run;

proc contents data=sashelp.class centiles;
run;

data new;
set sashelp.class;
run;

/*Composite Index*/
PRoc sql;
create index name2 on new(name,age,sex);
quit;

proc contents data=new centiles;
run;

/*IMPORTANT INTERVIEW QUESTIONS*/
/*Out2: Sepcify the name of an o/p dataset to contain
information about indexes intergrity constraints*/

proc contents data=raw out=nn out2=nn1;
run;


/*IMPORTANT INTERVIEW QUESTIONS*/
/*Data=_all_; prints descriptor information for all the datasets*/
/*in library.*/

proc contents data=work._all_;
run;

/*NODS: Suppress the printing of individual files. 
Nods can use with only _ALL_*/

proc contents data=work._all_ nods;
run;

/*FMTLEN: Prints the length of variables informat or
format*/

proc contents data=raw;
run;

data g1;
attrib name length = $15. label='empname'
	sal informat=dollar. format=dollar. label='Salary'
	dob informat=date9. format=date7. label='dateofbirth'
	doj informat=datetime. format=datetime. label='dateofjoining';
input id name $ age gender $ SAL dob doj;
cards;
100 jagan 34 m $30,000 10jan1980 01jan1985:10:30:10
200 alekya 23 f $40,000	20mar1998 20mar1998:23:12:23
;
run;

proc contents data=g1 ;
run;

proc contents data=g1 fmtlen;
run;

/*Directory: Prints a list of the sas files in SAS
libary.*/
proc contents data=raw directory;
run;

proc contents data=sashelp.class directory;
run;

What is proc contents?
how to find out the indexed variables?
what is _ALL_ in procents?
what is varnum & poistion?
what is the simple index and composite index?
I don't want to print the data in output window?












