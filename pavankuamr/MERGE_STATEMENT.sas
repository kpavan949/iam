
proc sort data=a1;by id name;run;
proc sort data=a2;by id name;run;

/*Execute this program check the log & output dataset*/
data d;
merge a1 a2;
by id name;
run;
/*MERGE*/

/*Joins/combines observations from two or more sas datasets into*/
/*single observation in new dataset*/
/**/
/*1.Merge usually joins datasets with diff variables.*/
/*2.o/p dataset contains all the variables from all dtaasets.*/
/*3. uptp 100 datasets can merge in one steps.*/
/*4. obs are joining one to one without by stmt*/
/*5. obs are match merge with by stmt*/
/**/
/*Merge without by stmt: the no.of obs in the new dataset is equal*/
/*to the maximum no.of obs from original datasets*/

/*Same no.of observation from both datasets*/

/*syntax: Merge datasets;*/

data a;
input id name $ age loc $;
datalines;
100 jagan 34 bang
200 bharath 25 chen
300 praveen 24 delhi
;
run;

data b;
input id name $ sal qual $;
datalines;
100 jagan 34000 MBA
200 surya 25000 MCA
300 raghu 24000 MTECH
;
run;

data c;
set a b;
run;

data d;
merge a b;
run;

/*Diff no.of observations*/
/*second example*/
data a1;
input id name $ age loc $;
datalines;
100 jagan 34 bang
200 bharath 25 chen
300 praveen 24 delhi
600 vijaya 24 delhi
;
run;

data b1;
input id name $ sal qual $;
datalines;
100 jagan 34000 MBA
400 surya 25000 MCA
500 raghu 24000 MTECH
;
run;

data d1;
merge a1 b1;
run;

data c1;
input id name $ sal qual $;
datalines;
100 jagan 34000 MBA
400 surya 25000 MCA
;
run;

data cd1;
merge a1 c1;
run;


/*Match merge(merge with by stmt)*/
/*Combines obsevations from two or more sas datasets into single*/
/*obs in a dataset according to values of the common variables*/
/*from both datasets.*/

/*NOte: by variables should be key variables. Key variables are */
/*either char or numeric variables*/

/*Syntax: */
data datasetname;
merge datasets;
by variable(s);
run;

/*First example*/
data a1;
input id name $ age loc $;
datalines;
100 jagan 34 bang
200 bharath 25 chen
300 praveen 24 delhi
600 vijaya 24 delhi
;
run;

data b1;
input id name $ sal qual $;
datalines;
100 jagan 34000 MBA
400 surya 25000 MCA
500 raghu 24000 MTECH
;
run;

proc sort data=a1;by id;run;
proc sort data=b1;by id;run;

data d1;
merge a1 b1;
by id;
run;

/*With different length for name variable*/
data a2;
input id name $10. age loc $;
datalines;
100 jaganmohan 34 bang
200 bharathsri 25 chen
300 praveensri 24 delhi
600 vijayasrik 24 delhi
;
run;

proc sort data=a2;by id;run;
proc sort data=b1;by id;run;

data d1;
merge a2 b1;
by id;
run;

/*first execute without length stmt and then uncomment length stmt*/
/*and execute*/
data d3;
merge b1 a2;
by id;
run;

data d4;
length name $10.;
merge b1 a2;
by id;
run;

/*Note: then compare the d3 & d4 datasets for name variable*/

/*Thrid Example with different data types*/
data a1;
input id name $ age loc $;
datalines;
100 jagan 34 bang
200 bharath 25 chen
300 praveen 24 delhi
600 vijaya 24 delhi
;
run;

data b1;
input id $ name $ sal qual $;
datalines;
100 jagan 34000 MBA
400 surya 25000 MCA
500 raghu 24000 MTECH
;
run;

proc sort data=a1;by id;run;
proc sort data=b1;by id;run;

/*Execute this program and check the log*/
data d1;
merge a1 b1;
by id;
run;

/*b1 dataset id variable convert from char to numeric*/
data b1;
set b1;
x=input(id,3.);
run;

data b1(drop=id rename=(x=id));
set b1;
x=input(id,3.);
run;

/*Execute this program and check the log*/
data d1;
merge a1 b1;
by id;
run;


/**/
/*data b1;*/
/*retain id name sal qual;*/
/*set b1;*/
/*run;*/

/*MATCH MERGE TYPES*/
/*1.one to one 2.one to zero 3.Zero to one*/
/*4.many to many 5.one to many 6.many to one*/
/*7.few to many 8. many to few*/

data a1;
input id name $ age loc $;
datalines;
100 jagan 34 bang
200 bharath 25 chen
300 praveen 24 delhi
600 vijaya 24 delhi
;
run;

data a2;
input id name $ sal loc $;
datalines;
100 jagan 3400 bang
200 bharath 2500 chen
300 praveen 2400 delhi
500 vijaya 2400 delhi
;
run;

proc sort data=a1;by id; run;
proc sort data=a2;by id; run;

data c;
merge a1 a2;
by id;
run;

/*Note:In the above example performs 1 to 1 , 0 to 1 and 1*/
/*to 0 merging*/
/*1. in above example 100,200& 300 id's performs one to */
/*one mergring because of it will present in both datasets*/
/**/
/*2. 600 id performs one to zero merging. 600 present in */
/*first dataset and it's not present second dataset.*/
/**/
/*3. 500 id performs zero to one merging. 500 present in */
/*second dataset and it's not present first dataset.*/

**********************************;
/*MANY TO MANY MERGE*/
**********************************;
/*Within  a group many observation from secon dataset 
merge with many obsevations in first dataset.*/

data a1;
input id name $ age loc $;
datalines;
100 jagan 34 bang
100 bharath 25 chen
100 praveen 24 delhi
100 vijaya 24 delhi
;
run;

data a2;
input id name $ sal loc $;
datalines;
100 jagan 3400 bang
100 bharath1 2500 chen
100 praveen1 2400 delhi
100 vijaya1 24000 delhi
;
run;

proc sort data=a1;by id;run;
proc sort data=a2;by id;run;

/*Execute this program check the log & output dataset*/
data c;
merge a1 a2;
by id;
run;

/*Note: This many to many merge is dangerous and unrealiable sometimes.*/
/*So we need to take care and choose some additional by variables*/
/*to merge properly*/

proc sort data=a1;by id name;run;
proc sort data=a2;by id name;run;

/*Execute this program check the log & output dataset*/
data d;
merge a1 a2;
by id name;
run;

****************************;
/*One to many or many to one*/
****************************;
one to many: within a group many observation from second dataset
mege with one obsevation in first dataset

many to one: within a group one observation from second dataset
mege with many obsevation in first dataset

data a5;
input id name $ age loc $;
datalines;
100 jagan 34 bang
200 bharath 25 chen
;
run;

data a6;
input id name $ sal loc1 $;
datalines;
100 jagan1 3400 bang
100 bharath1 2500 chen
100 praveen1 2400 delhi
200 vijaya1 2400 delhi
200 rahul1 2400 delhi
;
run;

proc sort data=a5 by id;run;
proc sort data=a6 by id;run;

data otom;
merge a5 a6;
by id;
run;

proc sort data=a5; by id name;run;
proc sort data=a6; by id name;run;

data otom1;
merge a5 a6;
by id name;
run;

data mtoo1;
merge a6 a5;
by id name;
run;

***************************************;
/*FEW to many or many to few*/
***************************************;
Few to many : Within a group many observation from second dataset 
merge with few observations in first dataset

many to Few : Within a group few observation from second dataset 
merge with many observations in first dataset

data a3;
input id name $ age loc $;
datalines;
100 jagan 34 bang
100 bharath 25 chen
100 praveen 24 delhi
;
run;

data a4;
input id name $ age loc $;
datalines;
100 jagan1 34 bang
100 bharath1 25 chen
100 praveen1 24 delhi
100 vijaya1 24 delhi
100 rahul1 24 delhi
;
run;

proc sort data=a3;by id;run;
proc sort data=a4;by id;run;

data fm;
merge a3 a4;
by id;
run;

Note: This few to many  or many to few merge also is dangerous 
like many to many and unrealiable sometimes. So we need to take
care and choose some additional by variables to merge properly

proc sort data=a3;by id name;run;
proc sort data=a4;by id name;run;

data a41;
input id name $ age loc $;
datalines;
100 jagan 34 bang
100 bharath1 25 chen
100 praveen1 24 delhi
100 vijaya 24 delhi
100 rahul1 24 delhi
;
run;
proc sort data=a41;by id name;run;

/*Execute this program check the log & output dataset*/
/*few to many*/
data ftom1;
merge a3 a4;
by id name;
run;

/*many to few*/
data mtof;
merge a4 a3;
by id name;
run;

/*few to many */
data ftom1;
merge a3 a41;
by id name;
run;

**********************************;
	/*UPDATE*/
**********************************;
To apply the changes in one dataset with information of another
dset
To perform update we need two datasets.
1. Master dset: contain original information.
2. Trasaction dset: contains changing infotmation.

Before  performing update both datasets should be in sorting order


data a4;
infile datalines dsd;
input id name $ age loc $;
datalines;
100,jagan,34,bang
200,bharath,25,chen
300,praveen,,delhi
400,,,bombay
500,rahul,,delhi
;
run;

data a5;
infile datalines dsd;
input id name $ age loc $;
datalines;
100,jagan1,34,bang
200,bharath1,,chen
300,,,delhi
400,suresh,,
500,,34,delhi
;
run;

proc sort data=a4;by id;run;
proc sort data=a5;by id;run;

data mer;
merge a4 a5;
by id;
run;

data up;
update a4 a5;
by id;
run;
/*compare the Mer & up datasets*/

/*WHAT is the diff b/w merge & Update*/
/*Note: If transaction dataset having any missing values then o/p */
/*dataset contain missing values when we perfrom merge. But wehn we */
/*perform update, o/p dataset contains original values.*/

/*MODIFY*/

Replaces and appends observation in an existing sas dataset but
does not create an additional dset.

Note: Modify stmt is not required a new dataset with data stmt.

When we perfrom modify we can't add any new observations/variables
and we cann't delete any observation/variables.

data a4;
infile datalines dsd;
input id name $ age loc $;
datalines;
100,jagan,34,bang
200,bharath,25,chen
300,praveen,,delhi
400,,,bombay
500,rahul,,delhi
;
run;

data a5;
infile datalines dsd;
input id name $ age loc $;
datalines;
100,jagan1,34,bang
200,bharath1,,chen
300,,,delhi
400,suresh,,
500,,34,delhi
;
run;

proc sort data=a4;by id;run;
proc sort data=a5;by id;run;

/*It will not create the qualification variable in o/p dset*/
data a4;
modify a4 a5;
by id;
quali='MBA';
run;


data a;
set sashelp.class;
run;

/*It will update the height values for age 11,14,15 only*/
data a;
modify a;
if age  in (14,15,11) then height=80;
run;

/*Difference b/w update  & modify*/
Both are useful to update transaction information into master dset.

update creates a new dset and can add/delete rows/columns. But 
modify updates information in master dataset. It can't add/delete
rows/columns












