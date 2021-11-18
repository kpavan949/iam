option replace=yes;
/*DATSET OPTIONS*/

/*KEEP */

/*SPECIFIES VAIRABLE FOR PROCESSING OR FOR WRITING TO
O/P SAS DATASET*/

/*SYNTAX: KEEP = VAR1 VAR2 ---- VAR-N*/

/*data a1;*/
data a2(KEEP= id NAME );
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 bang
500 shaym 34 60000 chen
600 vijaya 22 43000 delhi
;
run;

/*The below example creates two datasets with diff 
variables*/
data a2(KEEP= id NAME loc)  a3(KEEP= id age sal );
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 bang
500 shaym 34 60000 chen
600 vijaya 22 43000 delhi
;
run;

/*the below example creates the dset from external file*/
data a4(keep= name age height);
infile "F:\JAGAN Sas_class\data2\anilsas.txt";
input name $ sex $ age height weight;
run;

/*the below example creates the dset from external file and delimiter*/
/*is & */
data a5(keep=name height weight)
		a6(keep=age height);
infile "F:\JAGAN Sas_class\data2\manisha6.txt" 
	dlm='&' firstobs=5 obs=15;
input name $ sex $ age height weight;
run;

/*the below example create the a6 dset from existing 
dataset*/
data a6(keep=name weight);
set sashelp.class;
run;


******************************;
/*DROP*/
******************************;
/*IT excludes specified variables from output dataset*/

/*syntax: drop= var1 var2 ---- varn;*/

data a2(drop= id NAME );
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 bang
500 shaym 34 60000 chen
600 vijaya 22 43000 delhi
;
run;

/*The below example creates two datasets with diff variables*/
data a2(drop= id NAME loc)  a3(drop= id age);
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 bang
500 shaym 34 60000 chen
600 vijaya 22 43000 delhi
;
run;

/*the below example creates the dset from external file*/
data a4(keep= name age height weight) a5(drop=sex);
infile "F:\JAGAN Sas_class\data2\anilsas.txt";
input name $ sex $ age height weight;
run;

/*the below example creates the dset from external file and delimiter*/
/*is & */
data a5(drop=name height weight)
		a6(drop=age height);
infile "F:\JAGAN Sas_class\data2\manisha6.txt" 
	dlm='&' obs=15;
input name $ sex $ age height weight;
run;

/*the below example create the a6 dset from existing dataset*/
data a6(drop=name weight);
set sashelp.class;
run;

/**************************;*/
/*	RENAME*/
/**************************;*/
/*specifies new names for variable in output sas dataset*/
/*Syntax: rename=(oldname=newname oldname2=newname2----- */
/*		oldnamen=newnamen))*/

data a2(rename =(id = emp_no sal=salary loc= location));
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 bang
500 shaym 34 60000 chen
600 vijaya 22 43000 delhi
;
run;

/*The below example creates two datasets with diff variables*/
data a2(rename= (id=emp_no NAME=ename)) 
		a3(rename=(id = student_no name=student_name));
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 bang
500 shaym 34 60000 chen
600 vijaya 22 43000 delhi
;
run;

/*the below example creates the dset from external file*/
data a4(rename= (name =sname height =s_height));
		infile "F:\JAGAN Sas_class\data2\anilsas.txt";
input name $ sex $ age height weight;
run;

/*the below example creates the dset from external file and delimiter*/
/*is & */
data a5(rename= (name=emp_name height=new_height));
		infile "F:\JAGAN Sas_class\data2\manisha6.txt" 
	dlm='&' obs=15;
input name $ sex $ age height weight;
run;

/*the below example create the a6 dset from existing dataset*/
data a6(rename= (name=emp_name));
set sashelp.class;
run;

/*EXAMPLE*/
/*create the 2 datasets with diff varibale names*/
data a(rename = (name=emp_name)) b;
set sashelp.class;
if sex ='F' then output a;
if sex ='M' then output b;
run;

/*append the two dataset and check the o/p dtaset*/
data new;
set a b;
run;

/*append the two dataset and check the o/p dtaset*/
data new1;
set a b(rename=(name=emp_name));
run;

/*WHERE*/
/*Selct observation from sas dataset that meets a 
specific condition*/

data raw; 
input region $ state $ month monyy5. 
         headcnt expenses revenue; 
   format month monyy5.; 
datalines;
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

data reg1(where = (region='Eastern')) 
	reg2(where = (region ne 'Eastern'));
set raw;
run;

data reg3(where = (region='Eastern')) 
	reg4(where = (region ne 'Eastern' and state ne 'NY'));
set raw;
run;

data reg4(where = (region in ('Eastern','Southern')));
set raw;
run;


data reg5(where = (state in ('NY','GA','FL')));
set raw;
run;

data reg5(where = (region='Southern' and
	state in ('NY','FL')));
set raw;
run;

data reg5(where = (month = '01FEB78'd))
	reg6(where = (month = '01MAR78'd));
set raw;
run;

data reg5(where = (region in ('Eastern') and
		month = '01FEB78'd));
	set raw;
run;

data reg5(where = (headcnt  < 10))
	reg6(where = (headcnt  > 10))
	reg8(where = (headcnt  >= 10))
	reg9(where = (headcnt  ge 10))	;
set raw;
run;

/*REPLACE*/
If we we create dataset with any name, if it is already
exist it will overwrite on the existing dataset. becuase
of By default option is replace=yes). If use replace=no
it will not overwrite the dataset.

data new;
set sashelp.class;
run;

/*Execute this program check the log & output dataset*/
data new(replace=no);
set sashelp.class;
if age >= 13;
run;

/*execute this program check the log & output dataset*/
data new1(replace=no);
set sashelp.class;
if sex = 'M';
run;

/*execute this program check the log & output dataset*/
data new1(replace=no);
set sashelp.class;
if sex = 'F';
run;

/*PASSWORD*/
/*IT assigns a password to dataset*/
/*syntax: pw=passwordname;*/

/*RULES to PWD;*/
/*1. uptp 8 chars length*/
/*2. begin with char or _underscore.*/
/*3. Contain _, char and numerics. but it will not allow*/
/*spcial chars*/
/*4. Pwd is not case sensitive*/

data test(pw=new1234);
set sashelp.class;
if age in (13,14,15);
run;

/*whenever this step it will ask the pwd to execute the
program bydefault it will sort the ascending order*/
proc sort data=test out=test2;
by sex;
run;

/*It will sort the data based on gender and & age*/
proc sort data=test out=test3;
by sex age;
run;

/*change the password*/
proc datasets lib=work memtype=data;
modify test(pw=new1234/nnn123);/* (pw=oldpwd/newpwd)*/
run;

/*delete the password*/
proc datasets lib=work memtype=data;
modify test(pw=nnn123/);/* (pw=currentpwd/)*/
run;

/*LABEL*/

/*To assigen the label name to dataset*/

data male(label='MALE_DATA') 
	female(label='FEmale_DAta');
set sashelp.class;
if sex = 'M' then output male;
if sex = 'F' then output female;
run;

/*View*/

/*names a view that the datastep uses to store the input
d.s view.*/

/*View name & datastep name both should be same.*/
/*view can't create for datalines.*/
/*view can create only with existing datasets or 
database.*/

/*creating normal dataset*/
data new1;
set sashelp.class;
run;

/*creating the view*/
data new/view=new;
set sashelp.class;
run;

/*Execute this program and check the log & output*/
/*data will update in new1 table*/
data new1;
set new1;
if age in (13,14,15) then status='Minor';
else status='Others';
run;

/*Execute this program and check the log & output*/
data new;
set new;
if age in (13,14,15) then status='Minor';
else status='Others';
run;


libname test "F:\JAGAN Sas_class\data1";

/*First i have create the table in externale path*/
data test.class_2;
length sex $10.;
set sashelp.class;
run;


/*I have create the view for my original dataset*/
data test_1/view=test_1;
set test.class_2;
run;

/*I want to update the in main master table*/
/*the same data it will reflect in view also*/
data test.class_2;
/*length sex $10.;*/
set test.class_2;
if sex = 'M' then sex = 'Male';
if sex = 'F' then sex = 'Female';
if age > 13 then height=height+10;
else height =height;
run;
















































