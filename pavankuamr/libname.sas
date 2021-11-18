/*IT will crete the libname*/

/*syntax: libname foldername 'path';*/

/*Note:foldername not more than 8 characters*/

libname new "F:\JAGAN Sas_class\SAS2";

/*execute this and check the log*/
libname SASSSSSSs "F:\JAGAN Sas_class\SAS2";

/*It will create the dataset in new library(permanent)*/

data nn;
set SASHELP.CLASS;
run;

data NEW.nn;
set SASHELP.CLASS;
run;

data NEW.male new.female;
set SASHELP.CLASS;
if sex = 'M' then output new.male;
if sex = 'F' then output new.female;
run;

data nn;
set SASHELP.CLASS;
run;

/*The below one it will create the new1 folder and extract the data*/
/*from 2 different locations*/

libname new1 ("F:\JAGAN Sas_class\data\dsets"
			"F:\JAGAN Sas_class\dsets") 
		access=readonly; 

/*It will drop the folder from current sas session*/
libname foldername clear;

libname new1 clear;

