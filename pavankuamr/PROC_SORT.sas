/*PROC SORT */
The sort procedure orders sas dataset observations by the values
of one or more characters or numeric variables;

Syntax:
PRoc sort data=dsetname options;
by var-1 descending var-2;
run;
/**/
/*data: specify the input dataset.*/
/*out : specify the output dataset and it contains the sorting data*/
/*dupout:specify the output dataset to which contains duplicate*/
/*	observations.*/
/*Reverse: REverse the collation order for char variable.*/
/*Nodupkey: Delete obs with duplicate based on by variables.*/
/*nodup or noduprec: delete duplicate obesrvations on based on by */
/*variables.*/
/*Sortsize: Specify the available memory*/
/*	n : in bytes (4 bytes)*/
/*	nm: in megabytes (4mb)*/
/*	nk: in kilobytes( 4k)*/
/*	ng: in gigabytes (4g)*/
/*TAGSORT: stores only the by variables and the obs numbers in */
/*temporary files. the by variables and the obs numbsrs are called*/
/*tags.*/


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

/*IT will overwrite the same dataset*/
proc sort data=raw;
by region;
run;

/*It will sort the data based on reg & st and overwire the same dset*/
proc sort data=raw;
by region state;
run;

/*It will sort the dataset and create the raw1 dset with sorting data*/
proc sort data=raw out=raw1;
by region;
run;

proc sort data=raw out=raw2;
by region state;
run;

proc sort data=raw out=raw3;
by region state month;
run;

/*Descending: Re arranges the obs in descedning order. according to*/
/*values of the by variables.*/

/*DESCENDING  order*/
proc sort data=raw out=rawd;
by descending region;
run;

proc sort data=raw out=rawd1;
by region descending state;
run;

proc sort data=raw out=rawd2;
by region descending state descending month;
run;

/*nodupkey*/
proc sort data=raw out= raw1 nodupkey ;
by region;
run;

proc sort data=raw out= raw2 nodupkey ;
by region state;
run;

/*dupout*/
proc sort data=raw out= raw2 dupout=nn nodupkey ;
by region state;
run;
/*Note: In above example it will create 2 datasets. Raw2 having only*/
/*unique records and nn having duplicate records.*/

/*NODUP*/
data a;
input id name $ age;
datalines;
100 jagan 34
200 mohan 34
100 jagan 34
100 mohan 23
200 rahul 22
;
run;

proc sort data=a out=d nodupkey;
by id;
run;

proc sort data=a out=d1 nodup;
by id;
run;

proc sort data=a out=d dupout=t nodup;
by id;
run;

/*Reverse*/
proc sort data=raw out=rawr reverse;
by region;
run;

proc sort data=raw out=rawr1 reverse;
by region state;
run;

/*Note: Reverse rearrange the data in descending order only charcter*/
/*data. but descedning rearranges the data in descending order both*/
/*char & numeric data. Reverse rearranges all the char by variables*/
/*but descending should specify for each variable.*/


/*_ALL_: To sort all the variables in dataset.*/
/*_CHAR_: To sort only char variables in dataset.*/
/*_NUMERIC_: To sort only numeric variables in dataset.*/

proc sort data=raw out=rawa;
by _all_;
run;

/*for only char data*/
proc sort data=raw out=rawc;
by _char_;
run;

/*for comparison. check the rawc & Rawc1 datasets*/
proc sort data=raw out=rawc1;
by region state;
run;

/*for only numeric data*/
proc sort data=raw out=rawn;
by _numeric_;
run;

/*DATA SET OPTIONS WITH PROC SORT*/
proc sort data=raw(keep=region state) out=rawk;
by region;
run;

proc sort data=raw out=rawk1(keep=region state);
by region;
run;

proc sort data=raw(keep=region state) out=rawk2;
by month;
run;

proc sort data=raw out=rawk3(keep=region state);
by month;
run;

proc sort data=raw(drop=month) out=rawk3(keep=region state);
/*by month;*/
by region;
run;

proc sort data=raw 
	out=rawk3(rename=(region=reg_name state=st_name));
by region;
run;

/*WHERE*/
proc sort data=raw(where=(region='Southern')) 
	out=rawk3(rename=(region=reg_name state=st_name));
by region;
run;

proc sort data=raw 
	out=rawk4;
by region;
where region='Southern';
run;

proc sort data=raw(firstobs=5 obs=9) 
	out=rawk4 tagsort;
by region;
run;










