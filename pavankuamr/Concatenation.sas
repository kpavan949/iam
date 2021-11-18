/*Combining datasets*/

/*1.Concatenation 2. Interleaving 3. Merge*/
/*4.Update   5. Modify*/
/**/

/*Concatenations:*/
Combinig two or more sas dataset into single SAS dataset
one after other using set statement.
/**/
1.the no.of observation in new dataset is equal to the
sum of the no.of observation from original datasets. 
2.the second dataset obseration followd by the first 
dataset observations.

/*Syntax: Set datasets;*/

/*IF original datasets contains same variables, the*/
/*variables in new dataset are same as the varibles in */
/*the original.*/

data dset1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
200 vijay 32 bang
300 surya 33 che
400 kiran 22 delhi
;
run;

data dset2;
input id name $ age loc $;
datalines;
500 swati 34 hyd
600 vijaya 32 bang
700 divya 33 che
800 lakshmi 22 delhi
900 alekya 22 delhi
;
run;

data ds1;
set dset1 dset2;
run;

data ds2;
set dset2 dset1;
run;

data dset3;
input id name $ age loc $;
datalines;
1500 swati 34 hyd
2600 vijaya 32 bang
1700 divya 33 che
1800 lakshmi 22 delhi
2900 alekya 22 delhi
;
run;

data ds3;
set dset2 dset1 dset3 ds1;
run;

/*EXAMPLE 2*/
If original DATASETS CONTAIN DIFF VARAIBLES, observation
from one dset having missig values for variables in new
daset

data dset1;
input id name $ age loc $ sex $;
datalines;
100 jagan 34 hyd m
200 vijay 32 bang m
300 surya 33 che m
400 kiran 22 delhi m
;
run;

data dset2;
input id name $ age loc $;
datalines;
500 swati 34 hyd
600 vijaya 32 bang
700 divya 33 che
800 lakshmi 22 delhi
900 alekya 22 delhi
;
run;

/*It will concatenate only two dsets*/
data new;
set dset1 dset2;
run;

data new1;
set dset2 dset1;
run;

data dset3;
input id name $ sal;
datalines;
500 swati 34000
600 vijaya 32000
700 divya 33000
800 lakshmi 22000
900 alekya 22000
;
run;

/*It will concatenate three dsets*/
data new;
set dset1 dset2 dset3;
run;

data new2;
set dset2 dset3 dset1;
run;

/*Differnt datatypes*/
/*IF orignal datasets contain diff data types for variables,*/
/*so concatenation won't happen*/

data dset1;
input id $ name $ age loc $ sex $;
datalines;
100 jagan 34 hyd m
200 vijay 32 bang m
300 surya 33 che m
400 kiran 22 delhi m
;
run;

data dset2;
input id name $ age sal loc $;
datalines;
500 swati 34 45000 hyd
600 vijaya 32 54000 bang
700 divya 33 53000 che
800 lakshmi 22 15000 delhi
900 alekya 22 5000 delhi
;
run;

/*Execute this program and check the log */
data ds9;
set dset1 dset2;
run;


/*Note:*/
/* It will give the error because of id var variable has
defined as char and numeric*/

/*So first we have to convert id from character to numeric
datatypeusing the input fucntion*/

/*Syntax: inPUT(varname,informat);*/


/*So first we have to convert id from numeric to character
datatype using the put fucntion*/

/*Syntax: PUT(varname,format);*/

/*Convert the data type and create the new variable*/
data dset_1;
set dset1;
id_1=input(id,3.);
run;

/*Convert the data type and create the new variable and
drop the old variable*/
data dset_1(drop=id);
set dset1;
id_1=input(id,3.);
run;

/*Convert the data type and create the new variable and
drop the old variable. and rename the variable name as 
old variable name*/
data dset_1(drop=id rename=(id_1=id));
set dset1;
id_1=input(id,3.);
run;

data ds9;
set dset_1 dset2;
run;

/*converting from numeric to char*/
data dset_2;
set dset2;
id_1=put(id,8.);
run;

data dset_2(drop=id);
set dset2;
id_1=put(id,8.);
run;

data dset_2(drop=id rename=(id11=id));
set dset2;
id11=put(id,8.);
run;

data ds10;
set dset1 dset_2;
run;

/*IF orinal datasets contain diff length for vairables concatenation done.*/
/*Note: The length for new dset variable is equal to the first dset variable*/
/*length in set stmt*/

data dset1;
input id name $ age loc $ sex $;
datalines;
100 jagan 34 hyd m
200 vijay 32 bang m
300 surya 33 che m
400 kiran 22 delhi m
;
run;

data dset2;
input id name $10. age loc $;
datalines;
500 swatikiran 34 hyd
600 vijayasrik 32 bang
700 divyasrikk 33 che
800 lakshmittt 22 delhi
900 alekyaraok 22 delhi
;
run;

/*Execute this program and check the log & output dset*/
data ds6;
set dset1 dset2;
run;

/*Execute this program and check the log & output dset*/
data ds61;
length name $10.;
set dset1 dset2;
run;

data ds62;
set dset2 dset1;
run;
/*Concatenation with options*/
data dset1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
200 vijay 32 bang
300 surya 33 che
400 kiran 22 delhi
;
run;

data dset2;
input id name $ age loc $;
datalines;
500 swati 34 hyd
600 vijaya 32 bang
700 divya 33 che
800 lakshmi 22 delhi
900 alekya 22 delhi
;
run;

/*KEEP OPTION*/
data d1;
set dset1(keep=id name) dset2;
run;

data d2;
set dset1(keep=id name) dset2(keep=age loc);
run;

data d3(keep=id name);
set dset1 dset2;
run;

/*DROP OPTION*/
data d1d;
set dset1(DROP=name) dset2;
run;

data d2;
set dset1(drop=name) dset2(drop=name);
run;

data d3(drop=id name);
set dset1 dset2;
run;


/*FIRST OBS & OBS OPTION*/
data d1d;
set dset1(firstobs=2 obs=3) dset2;
run;

data d2;
set dset1 dset2(obs=3);
run;

data d3;
set dset1(obs=2) dset2(obs=2);
run;

/*keep & drop*/
data new;
set dset1(keep=id name age) dset2(drop=loc);
run;

/*keep & RENAME*/
data new1;
set dset1(keep=id name age) dset2(rename=(id=emp_id));
run;

/*keep, drop & Rename*/
data new1(rename=(id=emp_no name=emp_name age=emp_Age));
set dset1(keep=id name age) dset2(drop=loc);
run;


******************************************;
/*Concatenation with multiple set stmts*/
******************************************;
combine obserations from 2 or more sas datasets into a one obs
using two or more set stmt.
The new dataset contains all variables from all i/p datasets

Syntax: set dataset1;
		set dataset2;
		set datasetn;


/*Both datasets contains same variables and same no.of obseratins*/
data dset1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
200 vijay 32 bang
300 surya 33 che
400 kiran 22 delhi
;
run;

data dset2;
input id name $ age loc $;
datalines;
500 swati 34 hyd
600 vijaya 32 bang
700 divya 33 che
800 lakshmi 22 delhi
;
run;

/*Execute this program and check the log and o/p dataset*/
data new;
set dset1 dset2;
run;

/*Execute this program and check the log and o/p dataset*/
data new1;
set dset1;
set dset2;
run;

data new2;
set dset2;
set dset1;
run;

/*Both datasets contains different variables and same no.of obs*/
data dset1;
input id name $ age loc $ sex $;
datalines;
100 jagan 34 hyd m
200 vijay 32 bang m
300 surya 33 che m
400 kiran 22 delhi m
;
run;

data new1;
set dset1;
set dset2;
run;

/*Both datasets contains same variables and diff no.of obs*/
data dset1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
200 vijay 32 bang
300 surya 33 che
400 kiran 22 delhi
500 kiran 22 delhi
600 kiran 22 delhi
;
run;

data new1;
set dset1;
set dset2;
run;

data new2;
set dset2;
set dset1;
run;

/*Both dataset contain diff variables and diff no.of observations*/
data ds1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
200 vijay 32 bang
300 surya 33 che
400 kiran 22 delhi
500 kiran 22 delhi
600 kiran 22 delhi
;
run;

data ds2;
input id name $ age loc $ sex $;
datalines;
500 jagan 34 hyd m
600 vijay 32 bang m
700 surya 33 che m
800 kiran 22 delhi m
;
run;
                                         
data new1;
set ds1;
set ds2;
run;

data new2;
set ds2;
set ds1;
run;

/*INTERLEAVING*/
Use the set stmt and by stmt to combine multiple datasets into
single datataset

The no.of observation in new dataset(output dset) is equal to sum
of the no.of observation from original datasets.

Note: To perform interleaving both dataset variables should be 
same, same data types, same length and should be sorting order

/*Syntax: */
	data new;
	set datasets;
	by vraibles;
	run;

data ds1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
100 vijay 32 bang
200 surya 33 che
200 kiran1 22 delhi
300 kiran2 22 delhi
100 kiran3 22 delhi
400 vijay 32 bang
;
run;

data ds2;
input id name $ age loc $;
datalines;
100 jagan1 34 hyd
100 vijay1 32 bang
300 surya1 33 che
200 kiran1 22 delhi
200 kiran2 22 delhi
400 kiran23 22 delhi
500 kiran3 22 delhi
;
run;

/*execute this program check the log & output dset*/
data new;
set ds1 ds2;
by id;
run;

proc sort data=ds1;by id;
run;

proc sort data=ds2;by id;
run;

data new;
set ds1 ds2;
by id;
run;

/*Execute this program and check the log & dataset*/
data ds;
set ds1 ds2;
by id;
n1=first.id;
n2=last.id;
run;

/*First.var: value is 1 for the first observation in the by group and*/
/*value 0 for all other obseration in by group.*/
/**/
/*last.var: value is 1 for the last observation in the by group and*/
/*value 0 for all other obseration in by group.*/


/*I want to know each customer first visit information*/
data ds_1;
set ds1 ds2;
by id;
if first.id=1;
run;

/*I want to know each customer information except first &last*/
data ds_2;
set ds1 ds2;
by id;
if first.id=0 and last.id=0;
run;

/*I want to know each customer last visting information*/
data ds_2;
set ds1 ds2;
by id;
if last.id=1;
run;

/*I want to know each customer who visitied only once*/
data ds_3;
set ds1 ds2;
by id;
if first.id=1 and last.id=1;
run;

/*I want to know each customer first visintg information except*/
/*who visited once*/

data ds_3;
set ds1 ds2;
by id;
if first.id=1 and last.id=0;
run;

/*I want to know each customer last visintg information except*/
/*who visited once*/

data ds_3;
set ds1 ds2;
by id;
if first.id=0 and last.id=1;
run;

/*I want to know each customer all visting information except last*/

data ds_3;
set ds1 ds2;
by id;
if first.id=1 or last.id=0;
run;

/*I want to know each customer all visting information except first*/
data ds_4;
set ds1 ds2;
by id;
if first.id=0 or last.id=1;
run;

/*IF you want extract any paricular record*/
data new;
set ds1 ds2;
retain cnt 1;
by id;
if first.id =1 then cnt=1;
else cnt+1;
/*if cnt=3;*/
if id=100 and cnt=3;
run;


proc sql;
select id,count(*) as id_cnt from ds
group by id;
quit;






















