data a;
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 bang
500 shaym 34 60000 chen
600 vijaya 22 43000 delhi
;
run;

/*execute this program and check the log*/
data a1;
input id name $ age sal loc $;
datalines;
100 jagan mohan 34 50000 hyd
200 vijay kumar 23 60000 bang
500 shaym reddy 34 60000 chen
600 vijaya sri 22 43000 delhi
;
run;

/*COLUMN INPUT*/
The column number follow the variable name in the 
i/p stmt that number indicate where the variable
values are found in the i/p data records.
1. Spaces are not required between values.
2. Missing values can be left blank
3. character can have embedded spaces.
4. you can skip unwanted variables.


/*execute this program and check the log*/
data a;
input id 1-3 name $ 5-15 age 17-18 
	sal 20-24 loc $ 26-30;
datalines;
100 jagan mohan 34 50000 hyd
200 vijay kumar 23 60000 bang
500 shaym reddy 34 60000 chen
600 vijaya sri  22 43000 delhi
;
run;

/*data n;*/
/*infile 'F:\JAGAN Sas_class\data\ci.txt' truncover; */
/*input id 1-3 name $ 5-15 age 17-18 */
/*	sal 20-24 loc $ 26-30;*/
/*	run;*/

data a2;
input id 1-3 name $ 5-20 age 22-23 
	sal 25-29 loc $ 31-35;
datalines;
100 jagan mohanreddy 34 50000 hyd
200 vijay kumaryadav 23 60000 bang
500 shaym benarji    34 60000 chen
600 vijaya sri       22 43000 delhi
;
run;

data a3;
input id 1-3 name $ 5-17 age 19-20 
	sal 22-26 loc $ 28-32;
datalines;
100 jagan        34 50000 hyd
200 vijay kumary 23 60000 bang
500 shaym benarji34 60000 chen
600 vijaya sri   22 43000 delhi
;
run;

data a4;
input id 1-3 name $ 5-17 age 18-19 
	sal 21-25 loc $ 27-31;
datalines;
100 jagan        34 50000 hyd
200 vijay kumaryi23       bang
500              34 60000 chen
600 vijaya sri      43000 delhi
;
run;

/*output dataset created with based on input order*/
data a5;
input id 1-3 sal 21-25 loc $ 27-31
	name $ 5-16 age 18-19;
datalines;
100 jagan        34 50000 hyd
200 vijay kumary 23       bang
500              34 60000 chen
600 vijaya sri      43000 delhi
;
run;

/*the below example it will remove the unwanted 
variables*/
data a6;
input id 1-3 loc $ 27-31
	name $ 5-16 age 18-19;
datalines;
100 jagan        34 50000 hyd
200 vijay kumary 23       bang
500              34 60000 chen
600 vijaya sri      43000 delhi
;
run;

/*MULTIPLE I/P STATEMENT*/
we can write multiple i/p stmt or # form at modifier
to read the data when data is available in multiple
lines for one record.

/*Execute this program and check the output dataset*/
data a2;
input id 1-3 name $ 5-20 age 22-23 
	sal 25-29 loc $ 31-35;
datalines;
100 jagan mohanreddy
34 
50000 hyd
200 vijay kumaryadav
23
60000 bang
500 shaym benarji   
34
60000 chen
600 vijaya sri
22
43000 delhi
;
run;

data a2;
input id 1-3 name $ 5-20;
input age 1-2; 
input sal 1-5 loc $ 6-10;
datalines;
SAMEDATA
;
run;

/*the below example it will not read the age variable*/
data a3;
input id 1-3 name $ 5-20;
input ; 
input sal 1-5 loc $ 6-10;
datalines;
SAMEDATA
;
run;

data a3;
input id 1-3 name $ 5-20;
input ; 
input loc $ 1-10;
datalines;
SAMEDATA
;
run;

/*# Modifier*/
data a5;
input #1 id 1-3 name $ 5-20
		#2 age 1-2 
		#3 sal 1-5 loc $ 6-10;
datalines;
SAMEDATA
;
run;

data a6;
input #2 age 1-2 
		#3 sal 1-5 loc $ 6-10
		#1 id 1-3 name $ 5-20;
datalines;
SAMEDATA
;
run;

/*Spaces are not required between variable values*/
/*execute this program and check the output dataset */
data a8;
input id 1-3 name $1-13 age 14-15 
sal 16-20 loc $ 21-25;
datalines;
100jaganmohan3450000hyd
200vijaykumar23     bang
500          3460000chen
600vijaya sri4443000delhi
;
run;

data a8;
input id 1-3 name $ 4-13 age 14-15
	sal 16-20 loc $ 21-25;
	datalines;
same data
;
run;

/*FORMATTED INPUT*/

@ An informat follows with the variable name in the
input stmt. The informat give the datatype and the
fieldwidth of an i/p value.

data dd;
input @1 id 3. @5 name $10. 
	@16 loc $9. @26 age 2. @29 quali $5. ;
datalines;
100 jaganmohan hyderabad 34 MBA
200 anilkumar  chennai   30 btech
300 vijayasrik bangalore 30 MCA
;
run;

data dd1;
input @1 id 3. @4 name $10. 
	@14 loc $9. @23 age 2. @25 quali $5. ;
datalines;
100jaganmohanhyderabad34MBA
200anilkumar chennai  30btech
300vijayasrikbangalore30MCA
;
run;

/*the below program having column input and formated input*/
data dd21;
input @1 id 3. @4 name $10. @14 loc $9. @23 age 2.
	@25 quali $5. ;
/*input id 1-3 name $ 4-13 loc $ 14-22 age 23-24 
	quali $ 25-30;*/
datalines;
100jaganmohanhyderabad34MBA
200anilkumar chennai  30btech
300vijayasrikbangalore30MCA
;
run;

/*LIST INPUT*/
/*List input is 2 types*/

1. Simple list input: The variable names are simply 
listted in the i/p stmt. a $ follows the name of 
each character variable.

The i/p stmt can read data values  that are 
separated by blanks.

data dl;
input id name $ age sal loc $;
datalines;
100 jagan 34 40000 hyd
200 vijay 30 50000 chenai
300 sureshk 34 60000 bang
400 vijaya 32 43000 bombay
;
run;

/*Execute the both input statements and check the output datasets*/
data d3;
/*input id name $ age sal loc $;*/
input id name $11. age sal loc $;
datalines;
100 jaganmohan 34 40000 hyd
200 vijaykumar 30 50000 chenai
300 sureshkumar 34 60000 bang
400 vijayasrik 32 43000 bombay
;
run;


/*Modifier List input*/
/*first execute this program and check the log & dataset*/
data d3;
input id name $11. age sal loc $;
datalines;
100 jagan mohan 34 40000 hyd
200 vijay kumar 30 50000 chenai
300 suresh k 34 60000 bang
400 vijaya K 32 43000 bombay
;
run;

/*&: indicated that character values can have one more
single embeded blanks*/

/*in the below example after name variable values we 
need to give 2 spaces*/
data d3;
input id name &$12. age sal loc $;
datalines;
100 jagan mohan  34 40000 hyd
200 vijay kumar  30 50000 chenai
300 suresh kumar  34 60000 bang
400 vijaya   32 43000 bombay
;
run;

/*:Modifier*/
The : format modifier enables you to use list input
but also to specify an informat after a variable 
name  whether char or numeric. Sas read until it
encounters a blank column the defined length of the
variable or the end of the dataline. whichever
comes first

/*First executed the commented line and see the log & dset*/
data e;	
input id name $10. age sal loc $;
datalines;
100 jaganmohan 34 50000 hyd
200 vijay 23 60000 bang
500 shaymKumar 34 60000 chen
600 vijaya 22 43000 delhi
;
run;

data e2;	
input id name :$12. age sal loc $;
datalines;
100 jaganmohan 34 50000 hyd
200 vijay 23 60000 bang
500 shaymKumar 34 60000 chen
600 vijaya 22 43000 delhi
;
run;

/*~modifier*/
/*~ Reads delimiter with in quotated character values
as character and ratains the quotaiton marks*/

data e31;	
infile datalines dlm = ' ' dsd;
input id name $ age sal add ~$18. loc $;
/*input id name $ age sal address $ loc $;*/
datalines;
100 jagan 34 50000 "SR Nagar Hyderbad" hyd
200 vijay 23 60000 "JP Nagar  BANGALORE" bang
500 shaym 34 60000 "SRi Nagar  chennai" chen
600 vijay 22 43000 'devi Nagar delhi' delhi
;
run;

data e41;	
infile datalines dsd;
input id name $ age sal add ~$18. loc $;
/*input id name $ age sal add ~$22. loc $;*/
datalines;
100,jagan,34,50000,"SR Nagar  Hyderbad",hyd
200,vijay,23,60000,"JP Nagar  BANGALORE",bang
500,shaym,34,60000,"SRi Nagar  chennai",chen
600,vijay,22,43000,"devi Nagar  delhi",delhi
;
run;

data e4;	
infile datalines dsd;
/*input id name $ age sal add ~$18. loc $;*/
input id name :$14. age sal add ~$26. loc $;
datalines;
100,jagan mohan b,34,50000,"SR Nagar, Hyderbad",hyd
200,vijay kumar,23,60000,"JP Nagar, BANGALORE",bang
500,shaym k,34,60000,"SRi Nagar, chennai",chen
600,vijay,22,43000,"devi Nagar, delhi 24-1/7",delhi
;
run;

proc print;
run;

/*NAMEd INPUT*/

/*We specify the name of the variable follwed by an
equal symbol*/

data two;
input id= name = $22. age= sal= loc=$;
datalines;
id=100 name=jagan mohan age=34 sal=50000 loc=hyd
id=200 name=vijay kumar age=23 sal=60000 loc=bang
id=500 name=shaym reddy age=34 sal=60000 loc=chen
id=600 name=vijay asri  age=22 sal=43000 loc=delhi
;
run;


/*NULL INPUT*/
/*The i/p stmt with no arguments(variables) is 
called as null input.*/

data e2;	
input ;
datalines;
100 jaganmohan 34 50000 hyd
200 vijay 23 60000 bang
500 shaymKumar 34 60000 chen
600 vijaya 22 43000 delhi
;
run;

/*Note: when i/p stmt executes one record at a time 
is storing into input buffer. then PDV picks data
from i/p buffer and assign to corresponding variables.
So it's create zero variable dataset.*/

/*MIXED INPUT*/
/*WE can use the multiple input statements it's 
called as mixed i/p*/
data a5;
input id @5 name $ 12. age sal 21-25 loc $;
datalines;
100 jagan        34 50000 hyd
200 vijay kumary 23 65000 bang
500 Surya        34 60000 chen
600 vijaya sri   23 43000 delhi
;
run;

data a6;
input id @5 name $ 12. age sal 21-25 
		@27 loc $ 5.;
datalines;
100 jagan        34 50000 hyd
200 vijay kumary 23 65000 bang
500 Surya        34 60000 chen
600 vijaya sri   23 43000 delhi
;
run;




