/*	PROC COMPARE*/
This procedure is used to give the full description to 
observation wise. By default it gives the details of 
unrelated values.

Syntax:-
PROC COMPARE BASE=DATASET COMPARE=DATASET <OPTIONS>;
BY VARIABLE<S>;
ID VARIABLE;
VAR VARIABLES<S>;
WITH VARIABLES<S>;	
RUN;

/*BASE - Specify the base data set	*/
/*COMPARE - Specify the comparison data set*/
/*OUT=DATASET - Create an output data set*/
/*VAR: Restrict the comparison to values of specific 
vars*/
/*with and var:Compare variables of diff names.*/
/*by: produce separate comparison for each by group*/

data one; 
   input student year state $ grade1 grade2; 
   label year='Year of Birth'; 
   format grade1 4.1; 
   cards; 
1000 1970 NC 85 87 
1042 1971 MD 92 92 
1095 1969 PA 78 72 
1187 1970 MA 87 94 
; 
run; 

data two; 
   input student year state $ grade1 grade2 major $; 
   label state='Home State'; 
   format grade1 5.2; 
   cards; 
1000 1970 NC 85 87 Math 
1042 1971 MA 92 92 History 
1095 1969 PA 79 73 Physics 
1187 1970 MD 87 74 Dance 
1204 1971 NC 82 96 French 
; 
run; 

data two_1; 
   input student year state $ grade1 grade2; 
   label year='Year of Birth'; 
   format grade1 4.1; 
   cards; 
1000 1970 NC 85 87 
1042 1971 MD 92 92 
1095 1969 PA 78 72 
1187 1970 MA 77 94 
; 
run; 

proc compare base=one compare=two_1; 
title 'comparing two data sets'; 
run; 

proc compare base=one compare=two out=three; 
title 'comparing two data sets'; 
run;

proc sort data=one;by student;run;
proc sort data=two;by student;run;

proc compare base=one compare=two out=three; 
id student;
run;

proc compare base=one compare=two_1 out=three; 
id student;
run;

PROC SORT DATA=ONE;
BY YEAR STATE;
RUN;

PROC SORT DATA=TWO;
BY YEAR STATE;
RUN;

PROC COMPARE BASE=ONE COMPARE=TWO ; 
BY YEAR STATE;
TITLE 'COMPARING TWO DATA SETS: BASED ON BY VARIABLE'; 
RUN; 

PROC COMPARE BASE=ONE COMPARE=TWO ; 
VAR GRADE1; 
WITH GRADE2; 
TITLE 'COMPARING VARIABLES WITH DIFFERENT VARIABLES'; 
RUN; 

PROC COMPARE BASE=ONE COMPARE=TWO ; 
VAR GRADE1 GRADE1 GRADE2; 
WITH GRADE1 GRADE2 GRADE2; 
TITLE 'COMPARING VARIABLES WITH DIFFERENT VARIABLES'; 
RUN; 

PROC COMPARE BASE=ONE COMPARE=TWO ; 
VAR GRADE1 GRADE2 GRADE2; 
WITH GRADE1 GRADE1 GRADE2; 
TITLE 'COMPARING VARIABLES WITH DIFFERENT VARIABLES'; 
RUN; 

/*OUTALL - Write an observation for each value in the 
BASE= and COMPARE= data sets*/
proc compare base=one compare=two out=three outall; 
title 'comparing two data sets'; 
run;

/*OUTBASE - Write an observation for each observation
in the BASE= data set*/
proc compare base=one compare=two out=three2 outbase; 
title 'comparing two data sets'; 
run;

/*OUTCOMP - Write an observation for each observation
in the COMPARE= data set*/
proc compare base=one compare=two out=three3 outcomp; 
title 'comparing two data sets'; 
run; 

/*OUTDIFF - Write an observation that contains the 
differences for each pair of matching observations*/
proc compare base=one compare=two out=three4 outdiff; 
title 'comparing two data sets'; 
run; 







/**/
/*/*OUTNOEQUAL - Suppress the writing of observations when all values are equal*/*/
/*proc compare base=one compare=two out=three outnoequal; */
/*title 'comparing two data sets'; */
/*run; */
/**/
/*PROC COMPARE BASE=ONE COMPARE=TWO PRINTALL; */
/*TITLE 'COMPARING TWO DATA SETS'; */
/*RUN;   */

