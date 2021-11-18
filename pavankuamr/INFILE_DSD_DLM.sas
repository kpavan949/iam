/*INFILE STATEMENT*/

/*infile stmt identifies an external file or rawdata. */
/*Identifies an external file to read data with an i/p */
/*stmt.*/

/*Infile stmt can also use a file reference using the 
filename stmt*/

/*Syntax: 
Infile 'File-specification path\filename' options;*/

data one_2;
infile datalines;
input id name $ age sal loc $;
datalines;
100 jagan 34 54000 hyder
200 vijaya 30 43000 bang
300 manesha 34 23000 chee
400 suresh 21 42222 delhi
500 swati 23 54433 chen
;
run;

/*read the data from external file*/
data two;
infile "F:\Jagan\sas3\new.txt";
input id name $ age sal loc $;
run;

data sneha;
infile 'C:\Users\windows\Desktop\test.txt';
input id name $ age sal loc $;
run;

/*Note: In the above example default delimiter is space. So no need*/
/*to use any infile option */

/*the below example read the Column input*/
data a12;
infile "F:\Jagan\sas2\second.txt" truncover ;
input id 1-3 name $ 5-14 age 16-17 
	sal 19-23 loc $ 25-29 quali $ 31-35;
run;

/*data nn;*/
/*input id 1-3 name $ 5-15 age 17-18 */
/*	sal 20-24 loc $ 26-30 quali $ 32-36 ;*/
/*	datalines;*/
/*100 jagan mohan 34 50000 hyd   btech*/
/*200 vijay kumar    60000 bang  mca*/
/*500 		       34 60000 chen  btech*/
/*600 		       22   	 delhi mba*/
/*;*/
/*run;*/

/*DSD -(DELIMITER SENSITIVE DATA)*/
/*1.It read delimiter is comma*/
/*2.It reads missing values with delimiter is a comma*/
/*3.SAS treats two consecutive delimiter as a missing 
value*/
/*4.It removes double quotaitons marks from character 
values*/

/*First you can run without DSD option and check the log
& dset*/
/*then you can add dsd & run and check the log & dset*/

data new1;
infile datalines dsd;
input id name $ age sal loc $;
datalines;
100,jagan,34,54000,hyder
200,vijaya,30,43000,bang
300,manesha,34,23000,chee
400,suresh,21,42222,delhi
500,"swatisri",23,54433,chen
;
run;

/*it WILL READ FROM EXTERNAL FILE*/
data new2;
infile "F:\Jagan\sas3\new_2.txt" dsd;
input id name $ age sal loc $;
run;

/*The below data having missing values*/
data new3;
infile datalines dsd;
input id name $ age sal loc $;
datalines;
100,jagan,34,54000,hyder
200,,30,43000,bang
300,manesha,,23000,chee
400,suresh,21,42222,delhi
500,"swati",23,,chen
;
run;

/*copy above raw data and keep in external file*/
data new4;
infile "F:\Jagan\sas2\four.txt" dsd;
input id name $ age sal loc $;
run;


/*the below example variable values more than 8 character, so we need*/
/*to give the max length for that variable*/
data new4;	
infile datalines dsd;
input id name :$14. age sal add ~$22. loc $;
datalines;
100,jagan mohan b,34,50000,"SR Nagar, Hyderbad",hyd
200,vijay kumar,23,60000,"JP Nagar, BANGALORE",bang
500,shaym k,34,60000,"SRi Nagar, chennai",chen
600,vijay,22,43000,"devi Nagar, delhi",delhi
;
run;

data new5;
infile "F:\Jagan\sas2\five.txt" dsd;
input id name :$14. age sal add :$22. loc $;
run;

**********************************;
/*DLM*/
**********************************;

/*When data values having special characters in rawdata
or an external files. then we can use DLM option to 
read data.*/

/*Note: The special characters must be enclosed with 
single quotaion marks*/

data new1;
infile datalines dlm=',';
input id name $ age sal loc $;
datalines;
100,jagan,34,54000,hyder
200,vijaya,30,43000,bang
300,manesha,34,23000,chee
400,suresh,21,42222,delhi
500,swati,23,54433,chen
;
run;

/*the below example delimiter is pipe symbol*/
data new2;
infile datalines dlm='|';
input id name $ age sal loc $;
datalines;
100|jagan|34|54000|hyder
200|vijaya|30|43000|bang
300|manesha|34|23000|chee
400|suresh|21|42222|delhi
500|swati|23|54433|chen
;
run;

data new2;
infile datalines dlm='&';
input id name $ age sal loc $;
datalines;
100&jagan&34&54000&hyder
200&vijaya&30&43000&bang
300&manesha&34&23000&chee
400&suresh&21&42222&delhi
500&swati&23&54433&chen
;
run;

/*The below example it will read the from external file and*/
/*delimiter is ~*/
data new3;
infile "F:\Jagan\sas2\six.txt" dlm='~';
input id name $ age sal loc $;
run;

/*the below example having multiple delimeters(, &)*/
data new2;
infile datalines dlm=', &';
input id name $ age sal loc $;
datalines;
100,jagan&34&54000&hyder
200,vijaya&30&43000,bang
300&manesha,34&23000&chee
400&suresh,21&42222&delhi
500&swati&23&54433&chen
;
run;

/*the below example having multiple delimeters(, & ! %)*/
data new2;
infile datalines dlm=', & ! %';
input id name $ age sal loc $;
datalines;
100,jagan&34&54000%hyder
200,vijaya&30&43000%bang
300&manesha,34&23000%chee
400&suresh,21&42222&delhi
500&swati&23&54433!chen
;
run;

/*the below example having multiple delimeters(, & ! %) and read*/
/*the data from external file*/
data new3;
infile "F:\Jagan\sas2\eight.txt" dlm=', & ! % # |';
input id name $ age sal loc $;
run;


/*DSD:*/
/**/
/*1.It reads delimeter as a comma*/
/*2.It removes double quotes from character values*/
/*3.It treats two consecutive dlm as missing value.when 
we assign atleast one blank space b/w consecutive 
delimiters.*/

/*DLM*/

/*IT reads delimiter as any special character.*/
/*It won't removes double quotes from character values*/



/*DLMSTR*/
/*when data values haiving string as a delimiter in 
rawdata an external file then we can use the dlmstr 
option to read data*/

/*Note: This string must be enclosed in quotes and case 
sensitive*/
data new2;
infile datalines dlmstr='def';
input id name $ age sal loc $;
datalines;
100defjagandef34def54000defhyder
200defvijayadef30def43000defbang
300defmaneshadef34def23000defchee
400defsureshdef21def42222defdelhi
500defswatidef23def54433defchen
;
run;

data new3;
infile "F:\Jagan\sas2\nine.txt" dlmstr='ROS';
input id name $ age sal loc $;
run;

/*First execute this program and check the log and 
dataset*/
data new4;
infile datalines dlmstr='def';
input id name $ age sal loc $;
datalines;
100DEFjagandef34def54000DEfhyder
200defvijayadef30DEf43000DEfbang
300DEFmaneshadef34DEf23000defchee
400defsureshdef21DEF42222DEfdelhi
500DEFswatidef23def54433defchen
;
run;


/*DLMSopt*/

/*If it is not in one case  we should use dlmstr along 
with dlmsopt ='i' to read the data properly*/

data new4;
infile datalines dlmstr='def' dlmsopt='i';
input id name $ age sal loc $;
datalines;
100DEFjagandef34def54000DEfhyder
200defvijayadef30DEf43000DEfbang
300DEFmaneshadef34DEf23000defchee
400defsureshdef21DEF42222DEfdelhi
500DEFswatidef23def54433defchen
;
run;

/*FIRSTOBS*/
/*IT will read the data from nth observation*/

data a;
infile datalines firstobs=8;
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 bang
500 shaym 34 60000 chen
600 vijaya 22 43000 delhi
1200 bharath 23 60000 bang
1500 venu 34 60000 chen
1600 vijayk 22 43000 delhi
1100 amar 23 60000 bang
5100 surya 34 60000 chen
6100 vinay 22 43000 delhi
;
run;


data new3;
infile "F:\Jagan\sas2\ten.txt" firstobs=2 dlm='|';
input id name $ age sal loc $;
run;


data new3;
infile "F:\Jagan\sas2\ten_1.txt" firstobs=2 dlm='|';
input id name $ age sal loc $;
run;

/*OBS:*/
/*IT will read the data upto nth observation*/

data a;
infile datalines obs=3;
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 bang
500 shaym 34 60000 chen
600 vijaya 22 43000 delhi
1200 bharath 23 60000 bang
1500 venu 34 60000 chen
1600 vijayk 22 43000 delhi
1100 amar 23 60000 bang
5100 surya 34 60000 chen
6100 vinay 22 43000 delhi
;
run;

data new3;
infile "F:\Jagan\sas2\ten.txt" obs=5 dlm='|';
input id name $ age sal loc $;
run;

data a;
infile datalines firstobs=3 obs=8;
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 bang
500 shaym 34 60000 chen
600 vijaya 22 43000 delhi
1200 bharath 23 60000 bang
1500 venu 34 60000 chen
1600 vijayk 22 43000 delhi
1100 amar 23 60000 bang
5100 surya 34 60000 chen
6100 vinay 22 43000 delhi
;
run;

data new3;
infile "F:\Jagan\sas2\ten.txt" firstobs=4 obs=5 
	dlm='|';
input id name $ age sal loc $;
run;

/*MISSOVER*/
/*THe missover option tells sas that if it runs of data,*/
/*don't go to the next dataline. Instead  assign missing*/
/*values to any remanining variables.*/

/*Note: whenever executing first you can comment the 'infile */
/*datalines missover' and uncomment the 'infile datalines'*/
/*& execute, then check the log & dataset*/

data a2;
/*infile datalines;*/
infile datalines missover;
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
500 shaym 34 60000 chen
600 vijaya 22
1200 bharath 23 60000 bang
1500 venu 34 60000
1600 vijayk 22 43000 delhi
5100 surya
6100 vinay 22 43000 delhi
;
run;

data a4;
infile datalines dsd;
/*infile datalines dsd missover;*/
input id name $ age sal loc $;
datalines;
100,jagan,34,50000,hyd
200,vijay,23,60000,bang
600,vijaya,22,
1200,bharath,23,60000,bang
1500,venu,34,60000
1600,,22,43000,delhi
5100,surya,,
6100,vinay,22,43000,delhi
;
run;

data a5;
infile 'F:\Jagan\sas2\missov.txt' dsd missover;
input id name $ age sal loc $;
run;


/*TRUNCOVER*/

/*when last variable is missing for any record and if
we specify length for that variable we can use the 
truncover*/

data a;
infile datalines missover ;
input id name $ age sal loc :$9.;
datalines;
100 jagan 34 50000 hyder
200 vijay 23 
500 shaym 34 60000 chennaitn
600 vijaya 22 43000 bangalore
;
run;

data d5;
infile 'F:\JAGAN Sas_class\data\trunc.txt'
		missover;
input id name $ age sal loc $9.;
run;

data d6;
infile 'F:\JAGAN Sas_class\data\trunc.txt'
		truncover;
input id name $ age sal loc $9.;
run;

/*STOPOVER*/

/*Stops the data step  when it reads a short line*/

/*Note: Because of the datastep to stop execution 
immediately & write a note in SAS log*/

data a8;
infile datalines stopover;
input id name $ age sal loc $;
datalines;
100 jagan 34 50000 hyd
200 vijay 23 60000 
1200 bharath 23 60000 bang
600 vijaya 22
1500 venu 34 60000
;
run;

/*END*/
Specifies a variable that sas sets to 1 when the current
input data record is the last in the i/p file. until sas
process the last data record. The end=variable is set
to 0 like automatic variables, this variable is not 
written to the dataset

data d2;
infile 'F:\JAGAN Sas_class\data\datafirst.txt'
		dlm='&' end=y ;
input id name $ age sal loc $;
put y;/*y value print in log window*/
/*it will create new vairable*/
new_var=y;
run;

/*the below example it will not read the last record in
o/p dset*/
data d4;
infile 'F:\JAGAN Sas_class\data\datafirst.txt'
		dlm='&' end=x;
input id name $ age sal loc $;
put x;
new_var=x;/*it will create new vairable*/
/*if x=1 then output; */
if x=0 then output; 
run;


/*FILENAME*/

/*Specifies a variable that sas sets to the physical
name of the current i/p file.*/

data d3;
length x $50.;
infile 'F:\JAGAN Sas_class\data\datafirst.txt'
		dlm='&' filename=x;
input id name $ age sal loc $;
put x;
new_var=x;/*it will create new vairable*/
run;


/*Column*/
/*Names a variable that sas uses to assign the current
column location of the i/p pointer*/

data d3;
infile 'F:\JAGAN Sas_class\data\datafirst.txt'
		dlm='&' column=x;
input id name $ age sal loc $;
put x;
new_var=x;/*it will create new vairable*/
run;

/*Length*/
/*specifies  a variable that sas set to the length of 
current i/p line.*/

data dr;
infile 'F:\JAGAN Sas_class\data\datafirst.txt'
		dlm='&' length=x;
input id name $ age sal loc $;
put x;
new_var=x;/*it will create new vairable*/
run;

/*LINESIZE*/
/*Specifies the record length that is available to the 
i/p stmt*/

/*Note:linesize must between 10 to 32767*/

/*execute this program and check the output dataset*/
/*It will read upto 20 bytes*/
data dr;
infile 'F:\JAGAN Sas_class\data\datafirst.txt'
		dlm='&' linesize=15;
input id name $ age sal loc $;
run;

/*execute this program and check the output dataset*/
/*It will read upto 30 bytes*/
data dr1;
infile 'F:\JAGAN Sas_class\data\datafirst.txt'
		dlm='&' linesize=30;
input id name $ age sal loc $;
run;

/*LRECL*/
/*Logical record length should be 1 to 32767*/

data dr;
infile 'F:\JAGAN Sas_class\data\datafirst.txt'
		dlm='&' lRECL=20;
input id name $ age sal loc $;
run;


data dr4;
infile 'F:\JAGAN Sas_class\data\datafirst.txt'
		dlm='&' lRECL=5000;
input id name $ age sal loc $;
run;

/*These are the default option we have to use */
data d456_1;
infile 'F:\JAGAN Sas_class\data\datafirst.txt' dsd
		dlm='&' missover lrecl=32767;
input id name $ age sal loc $;
run;


data d456;
infile 'F:\JAGAN Sas_class\data\datafirst_1.txt' dsd
		dlm='&' missover linesize=32767 firstobs=2;
input id name $ age sal loc $;
run;

/*_NULL_*/
/*The dataset name _null_	is reserved for a special */
/*purpose here no dataset will be create, but the */
/*programning steps will be executed*/

/*FILE:*/

/*IT WRITES the information from SAS to external file*/

/*Syntax: file specifation-path options;*/

data a;
set sashelp.class;
run;

/*It will create the _nul dset and export the data to 
external path*/
data _null;
set a;
file 'F:\Jagan Sas_class15\output\file1.txt';
put name sex age height weight;
run;

/*It will not create the dset, but data exported to 
external path*/
data _null_;
set a;
file 'F:\Jagan Sas_class15\output\file2.txt';
/*put name height weight;*/
put name sex age height weight;
run;

/*GIVE THE DELIMITER*/
data _null_;
set a;
file 'F:\Jagan Sas_class15\output\file3.txt' dlm='$';
put name sex age height weight;
run;

/*# delimiter*/
data _null_;
set sashelp.class;
file 'F:\Jagan Sas_class15\output\file4.txt' dlm='#';
put name sex age height weight;
run;

data _null_;
set a;
file 'F:\Jagan Sas_class15\output\file5.txt' 
	dlm='@ & #';
put name sex age height weight;
run;

/*LINESIZE*/
data _null_;
set a;
file 'F:\Jagan Sas_class15\output\file6.txt'
		DLM='*' linesize=20;
put name sex age height weight;
run;

/*DROPVER*/

/*Discard data items that exceed the output line length*/
/*(as specified by the linesize or LRECL in the file stmt)*/

data _null_;
set a;
file 'F:\Jagan Sas_class15\output\file8.txt'
	DLM='*' linesize=18 dropover;
put name sex age height weight;
run;

/*MOD*/
/*Writes the o/p lines after any existing lines in the */
/*file append multiple data steps o/p into external */
/*location*/

data _null_;
set sashelp.class;
file 'F:\Jagan Sas_class15\output\file5.txt'
	DLM='&';
put name sex age height weight;
run;

data _null_;
set sashelp.class;
file 'F:\Jagan Sas_class15\output\file5.txt'
	DLM='|' mod;
put name sex age height weight;
run;

data new new1;
set sashelp.class ;
if sex = 'F' then output new;
if sex = 'M' then output new1;
run;

data _null_;
set new;
file 'F:\Jagan Sas_class15\output\file9.txt';
put name sex age height weight;
run;

data _null_;
set new1;
file 'F:\Jagan Sas_class15\output\file9.txt' mod;
put name sex age height weight;
run;

/*It will export the multiple datasets*/
data _null_;
set new new1;
file 'F:\Jagan Sas_class15\output\file19.txt' mod;
put name sex age height weight;
run;


/*data it will be print in aliggment*/
data _null_;
set sashelp.class;
file 'F:\Jagan Sas_class15\output\file15.txt'	;
/*file 'F:\Jagan Sas_class15\output\file15.rtf'	;*/
put @1 name @10 sex @15 age @20 height @30 weight;
run;

/*GIVE THE VARIABLE NAMES IN EXETERNAL FILE*/
data _null_;
set a;
file 'F:\Jagan Sas_class15\data\file25.txt' dlm='|';
if _n_ = 1 then do;
put "name" '|' "sex" '|' "age" '|'
"height" '|' "weight" '|';
		end;
put name sex age height weight;
run;

data _null_;
file 'F:\Jagan Sas_class15\output\file25.txt';
put "name" '|' "sex" '|' "age" '|'
"height" '|' "weight" '|';
run;

data _null_;
SET A;
file 'F:\Jagan Sas_class15\output\file25.txt' 
	DLM='|' mod;
put name sex age height weight;
run;


/*FILE PRINT*/

/*IT is a reserved fileref(path) that directs the o/p
into o/p window produced by put statements.*/

data _null_;
set new;
file print;
put name sex age height weight;
run;

/*FILE LOG*/

/*IT is a reserved fileref(path) that directs the o/p
into LOG window produced by put statements.*/

data _null_;
set new1;
file log;
put name sex age height weight;
run;



/*FILENAME STATEMENT*/
/*Associate a fileref for external file. infile stmt can
also use	a file reference using the filename stmt.*/

/*syntax:*/

filename fileref "external_file_path";

data test;
infile 'F:\JAGAN Sas_class\data3\bharathsas.txt';
input name $ sex $ age height weight;
run;

filename one 'F:\JAGAN Sas_class\data3\bharathsas.txt';

/*importing from external to sas environment*/
data test1;
infile one;
input name $ sex $ age height weight;
run;

/*IT will export the only male data to external file*/
data _null_;
set test;
if sex = 'F';
file 'F:\JAGAN Sas_class\data3\bharathsa4.txt';
put name sex age height weight;
run;

data _null_;
set test;
if sex = 'M';
file one;
put name sex ;
run;


filename two 'F:\JAGAN Sas_class\data3\';

data _null_;
infile two(bharathsas1.txt);
input name $ sex $ age height weight;
new=age+14;
new_height=height+10;
file two(pavan.txt);
put name sex age height weight new new_height;
run;

/*The above example it will import the file and create 
the new vars and export to external file as pawan.txt*/

filename two 'F:\JAGAN Sas_class\data4\*.txt';

data new;
infile two;
input name $ sex $ age height weight;
run;


data new1;
infile 'F:\JAGAN Sas_class\data4\*.txt';
input name $ sex $ age height weight;
run;


/*I want to import two files at a time*/
filename new ('F:\JAGAN Sas_class\data4\bharathsas3.txt',
			'F:\JAGAN Sas_class\data3\bharathsas2.txt');

data new_3;
infile new;
input name $ sex $ age height weight;
run;


/*Execute this program and check the log and o/p dataset*/
data new_4;
infile ('F:\JAGAN Sas_class\data4\bharathsas3.txt',
			'F:\JAGAN Sas_class\data3\bharathsas2.txt');
input name $ sex $ age height weight;
run;

/*Execute this program and check the log and o/p dataset*/
/*it will read second file only*/
data new_4;
infile 'F:\JAGAN Sas_class\data4\bharathsas3.txt';
infile 'F:\JAGAN Sas_class\data3\bharathsas2.txt';
input name $ sex $ age height weight;
run;


/*I want to import two files at a time*/
/*filename new ('F:\JAGAN Sas_class\data4\bharathsas1.txt',*/
/*			'F:\JAGAN Sas_class\data3\bharathsas2.txt');*/
/**/
/*data new_3;*/
/*infile new;*/
/*input name $ sex $ age height weight;*/
/*run;*/









