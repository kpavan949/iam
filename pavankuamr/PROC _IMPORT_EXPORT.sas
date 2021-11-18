/*PROC IMPORT-PROC EXPORT*/

/*PROC EXPORT*/
/*proc export data from sas dataset and write it to an 
external */
/*datasource txt or notepad, csv or excel*/

proc export data=libref.datasetname
	outfile="driveloc\filename"
	dbms=identifier replace;
	run;

libname suri 'F:\Jagan Sas_class3\data';

data a;
set sashelp.class;
run;

data test;
set sashelp.class;
run;

/*txt files*/
/*delimiter  ---   , |  ' ' ~*/
/*the below example default delemiter is space*/
proc export data=a
	outfile='F:\Jagan Sas_class3\data\satya.txt'
	dbms=dlm;
	run;

/*pipe delimiter*/
proc export data=a
	outfile='F:\Jagan Sas_class3\data\akshay.txt'
	dbms=dlm;
	delimiter='|';
	run;

proc export data=a
	outfile='F:\Jagan Sas_class3\data\sravani.txt'
	dbms=dlm replace;
	delimiter='@';
	putnames=no;
	run;

/*Note: putname=no means it will not export the variable*/
/*names*/
/*star delimiter*/
proc export data=a
	outfile='F:\Jagan Sas_class3\data\sravani_2.txt'
	dbms=dlm;
	delimiter='*';
	run;

/*Replace option: If any file is there with the same,
it will overwrite the existing file*/

/*Export the data from sashelp library*/
/*And file is created with today's(system date) date*/
proc export data=sashelp.class
	outfile="F:\Jagan Sas_class3\data\pavan_&sysdate..txt"
	dbms=dlm replace; 
	delimiter='@ & *';
/*	delimiter='@';*/
	run;


/*CSVformat*/
proc export data=a
	outfile='F:\Jagan Sas_class3\data\suresh.csv'
	dbms=csv;
	run;

proc export data=a
	outfile='F:\Jagan Sas_class3\data\pavani.txt'
	dbms=csv;
/*	putnames=no;*/
	run;

/*	execute this program and check the output*/
proc export data=a(where=(sex='M'))
	outfile='F:\Jagan Sas_class3\data\swati.csv'
	dbms=csv;
	run;

/*file created with comma separator*/
proc export data=a(where=(sex='M'))
outfile='F:\Jagan Sas_class3\data\sw.txt'
dbms=csv;
run;

/*execute this program and check the log*/
	proc export data=a(where=(sex='F'))
	outfile='F:\Jagan Sas_class3\data\swati.csv'
	dbms=csv ;
	run;

/*	execute this program and check the output*/
proc export data=a(where=(sex='F'))
	outfile='F:\Jagan Sas_class3\data\swati.csv'
	dbms=csv replace;
	run;
	
/*excel format*/
proc export data=a
		outfile='F:\Jagan Sas_class3\data\sai.xls'
		dbms=xls;
/*		dbms=excel;*/
	run;


/*	execute this program and check the output*/
/*	IT will create the sheet name as Female*/
proc export data=a
		outfile='F:\JAGAN Sas_class\export\test_1.xls'
		dbms=xls;
		sheet='Female';
run;

/*	execute this program and check the output*/
/*	IT will create the sheet name as male*/
		proc export data=a
		outfile='F:\JAGAN Sas_class\export\ans_1.xls'
		dbms=excel;
		sheet='Male';
		run;

/*	execute this program and check the output*/
		proc export data=a(where=(sex='M'))
		outfile='F:\JAGAN Sas_class\export\ans_1.xls'
		dbms=xls replace;
		sheet='Male';
		run;

/*	execute this program and check the output*/
		proc export data=a(where=(sex='F'))
		outfile='F:\JAGAN Sas_class\export\ans_1.xls'
		dbms=xls replace;
		sheet='Female';
		run;

/*		export the data to MS-access file*/
proc export data=sashelp.class
	table=new
	dbms=access;
	database='F:\JAGAN Sas_class\export\new.mdb';
	run;

/*proc export data=test*/
/*		outfile='F:\JAGAN Sas_class\export\ans_2.xls'*/
/*		dbms=excel;*/
/*		run;*/

/*PROC IMPORT*/

/*p.i reads data from an external source and write into SAS*/
/*environment as sas datasets*/

/*syntax:*/

proc import out=libref.datasetname
	datafile="driveloc\filename"
	dbms=identifier replace;
	run;

/*	import the text files*/
proc import out=jagan
	datafile='F:\Jagan Sas_class3\data\satya.txt'
	dbms=dlm;
run;

/*It will import the pipe delimeter file*/
proc import out=vijaya
datafile='F:\Jagan Sas_class3\data\sravani_2.txt'
dbms=dlm;
delimiter='*';
/*delimiter='*|#';*/
run;

/*execute the program and check the log*/
	proc import out=vijaya(where=(sex='M'))
	datafile='F:\Jagan Sas_class3\data\akshay.txt'
	dbms=dlm ;
	delimiter='|';
	run;

/*execute the program and check the log and output dataset also*/
	proc import out=vijaya(where=(sex='F'))
	datafile='F:\Jagan Sas_class3\data\sravani_2.txt'
	dbms=dlm replace;
	delimiter='*';
	run;

/*	In this example using multiple delimeters*/
proc import out=one_2
	datafile='F:\Jagan Sas_class3\data\sravani_2.txt'
	dbms=dlm replace;
	delimiter='* | ,';
	run;

/*	IMPORT csv files*/
proc import out=suri.shyam
	datafile='F:\Jagan Sas_class3\data\suresh.csv'
	dbms=csv;
	run;

/*	execute this program and check the output*/
proc import out=test_2(where=(age > 13))
	datafile='F:\Jagan Sas_class3\data\swati.csv'
	dbms=csv ;
	run;

/*	execute this program and check the log*/
proc import out=test_2(where=(age > 13))
	datafile='F:\Jagan Sas_class3\data\swati.csv'
	dbms=csv ;
	run;

/*	execute this program and check the output*/
proc import out=test_2(where=(age < 13))
	datafile='F:\Jagan Sas_class3\data\swati.csv'
	dbms=csv replace;
	run;


/*EXCEL FORMAT*/
Proc import out=test_4
		datafile='F:\Jagan Sas_class3\data\ans_1.xls'
		dbms=xls;
		run;

/**/
/*proc import out=test_5*/
/*		datafile='F:\JAGAN Sas_class\export\ans_1.xls'*/
/*		dbms=xls;*/
/*		run;*/

/*	execute this program and check the log*/
		proc import out=test_5
		datafile='F:\JAGAN Sas_class\export\ans.xls'
		dbms=xls;
		run;

/*	execute this program and check the log and output dataset*/
		proc import out=test_5
		datafile='F:\Jagan Sas_class3\data\ans.xls'
		dbms=xls replace;
		run;

/*I want get the data from female sheet*/
proc import out=test_6
		datafile='F:\Jagan Sas_class3\data\ans.xls'
		dbms=xls replace;
		sheet='Female';
		run;

/*I want get the data from female sheet*/
proc import out=test_8
		datafile='F:\Jagan Sas_class3\data\ans.xls'
		dbms=xls replace;
		sheet='Male';
		run;

%macro impo(dset,sheet);
		proc import out=&dset.
		datafile='F:\Jagan Sas_class3\data\ans.xls'
		dbms=xls replace;
		sheet="&sheet.";
		run;
%mend;

options mprint mlogic symbolgen;

   %impo(test_5,ans);
   %impo(test_6,Female);
   %impo(test_8,male);

/*it WILL IMPORT THE ACCESS FILE TO sas ENVIRONMENT*/
PROC IMPORT OUT=NN;
		TABLE=NEW
		dbms=access;
	database='f:\jagan sas_class3\data\test.mdb';
RUN;

















