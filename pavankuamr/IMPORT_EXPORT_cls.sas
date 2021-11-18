/*How to export the data to externale file*/

/*export the data sas to text file*/

data male female;
set sashelp.class;
if sex ='M' then output male;
if sex ='F' then output female;
run;

/*Default delimiter is space*/
proc export data=male
	outfile="F:\Jagan\sas2\bhanu.txt"
	dbms=dlm;
	run;

/*Execute this program and check the log*/
proc export data=male
	outfile="F:\Jagan\sas2\vajid_sas.txt"
	dbms=dlm;
	run;

proc export data=male
	outfile="F:\Jagan\sas2\vajid_sas.txt"
	dbms=dlm replace;
	run;

/*in the below example delimiter is | symbol*/
proc export data=male
	outfile="F:\Jagan\sas2\vajid_sas1.txt"
	dbms=dlm replace;
	delimiter='|';
	run;

/*in the below example delimiter is & symbol*/
proc export data=female
	outfile="F:\Jagan\sas2\vajid_sas1.txt"
	dbms=dlm replace;
	delimiter='$';
	run;

/*	CSV FORMAT*/

proc export data=female
	outfile="F:\Jagan\sas2\mahesh.csv"
	dbms=csv;
	run;

	
proc export data=male
	outfile="F:\Jagan\sas2\mahesh.csv"
	dbms=csv;
	run;

	
proc export data=male
	outfile="F:\Jagan\sas2\mahesh.csv"
	dbms=csv replace;
	run;

proc export data=male
	outfile="F:\Jagan\sas2\mahesh.xls"
	dbms=xls;
	run;

/*	IMPORT THE DATA*/

proc import out=test
	datafile="F:\Jagan\sas2\bhanu.txt"
	dbms=dlm;
	run;

	proc export data=male
	outfile="F:\Jagan\sas2\vajid_sas1.txt"
	dbms=dlm replace;
	delimiter='|';
	run;

	proc import out=mahesh
		datafile="F:\Jagan\sas2\vajid_sas1.txt"
		dbms=dlm;
		delimiter='$';
		run;

		proc import out=priya
			datafile="F:\Jagan\sas2\vajid_sas2.txt"
			dbms=dlm;
			delimiter='|';
			run;

/*IMPOPRT THE CSV File*/

proc import out=mounika
	datafile="F:\Jagan\sas2\mahesh.csv"
	dbms=csv;
	run;

	
proc import out=mounika
	datafile="F:\Jagan\sas2\mahesh.csv"
	dbms=csv replace;
	run;

	
proc import out=meenakshi
	datafile="F:\Jagan\sas2\mahesh.csv"
	dbms=csv replace;
	run;


