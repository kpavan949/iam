/*First program*/
data test;
input id name $ age loc $ gender $;
datalines;
100 jagan 34 hyd m
200 mohan 32 bang m
300 vijaya 30 che f
;
run;

proc sort data=test out=test2;
by age;
run;

data 
	test1;
	input id
		name $
		age 
		loc $
		gender $;
datalines;
100 jagan 34 hyd m
200 mohan 32 bang m
300 vijaya 30 che f
;
run;

proc sort data=test out=test2;
by age;
run;


data test3;input id name $ age loc $ gender $;datalines;
100 jagan 34 hyd m
200 mohan 32 bang m
300 vijaya 30 che f
;run;

DATA TEST;
INPUT ID NAME $ AGE LOC $ GENDER $;
DATALINES;
100 jagan 34 hyd m
200 mohan 32 bang m
300 vijaya 30 che f
;
run;



/*Rules of SAS program*/
/*1.Every stmt end with semicolon*/
/*2. Every step (Proc &data step) end with run stmt.*/
/*3. Single stmt we can write in multiple lines or multiple stmts*/
/*	we can write in single line.*/
/*4. Sas program is not case sensitive*/


/*RULES OF SASNAMES*/
1.Name must be less than or equal 32 chars.
2.Must start with alphabets or underscore
3.Sasname should contain alphabets, numeric and 
underscore(_). but not allow special characters.

/*datasetname allow*/
1. test 2._test 3.test_ 4. test_9 5. upto32chars

/*datasetname not allow*/
1.9test 2. test$ 3.morethan 32 chars



/*data test_;*/
data testtesttesttesttesttesttesttestt;
input id name $ age loc $ gender $;
datalines;
100 jagan 34 hyd m
200 mohan 32 bang m
300 vijaya 30 che f
;
run;













