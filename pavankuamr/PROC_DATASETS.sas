/*PROC DATASETS*/

/*PROC copy, Proc contents, Proc delete, Proc append*/

/*This is utility procedure is useful for copying,
renaming, deleting, appending, exchaning and reparing
the sas member types*/

/*Syntax:*/
proc datasets library=libname member=membertype;
change oldname=newname member=membertype;
exchange name=othername member=membertype;
copy datasets member=membertype;;
delete datasets member=membertype;
repair datasets member=membertype;
append dataset member=membertype;
modify dataset;
quit;

/*Memtype Specify the membertype from the sas library that*/
/*need to be processed by proc datasets can be used the*/
/*copy the required sas file type or required memtype, */
/*values of memtypes are all, data, view and catalog*/

/*Change: REname the SAS datasets*/

data raw;
  input region $ state $ month date7. 
         headcnt expenses revenue; 
   format month date7.; 
   cards; 
Eastern  VA 20FEB78  10  7800 15500 
Southern FL 12MAR78   9  9800 13500 
Southern GA 30JAN78   5  2000  8000 
Northern MA 21MAR78   3  1500  1000 
Southern FL 22FEB78  10  8500 11000 
Northern NY 15MAR78   5  6000  5000 
Eastern  VA 16MAR78  11  8200 16600 
Plains   NM 17MAR78   2  1350   500 
Southern FL 23JAN78  10  8000 10000 
Northern NY 24FEB78   4  3000  4000 
Southern GA 12FEB78   7  1200  6000 
; 
run;

/*It will change the dset name from raw to Alekya*/
proc datasets lib=work;
change raw=veera;
quit; 

libname swati "F:\JAGAN Sas_class\bhartath";

/*I want to change the sas dset name in permanent lib*/
/*and it will change the multiple dataset names*/
proc datasets lib=swati;
change a9=manish a10=sai;
quit; 

/*Exchange: the names of datasets will be exchnaged for
the specified member type*/

data male female;
set sashelp.class;
if sex = 'M' then output male;
if sex = 'F' then output female;
run;

proc datasets lib=work;
exchange male=female;
run;

proc datasets lib=work;
exchange male=female;
run;


/*COPY: use to copy the sas dataset b/w the libraries*/
/*It will copy all member types(data,view& catalog)*/
proc datasets lib=sashelp;
copy in=sashelp out=work;
run;

/*select: specified datasets only copy*/
proc datasets lib=sashelp;
copy in=sashelp out=work;
select Adsmsg Air Buy Bweight cars citiday citimon 
class;
run;

/*memtype=data:It will copy only tables*/
proc datasets lib=sashelp;
copy in=sashelp out=work memtype=data;
run;

/*memtype=view:It will copy only view*/
proc datasets lib=sashelp;
copy in=sashelp out=work memtype=view;
run;

/*memtype=catalog:It will copy only catalogs*/
proc datasets lib=sashelp;
copy in=sashelp out=work memtype=catalog;
run;

/*Modify:*/
/* modify stmt can be used to change the formats or
variable names*/

proc datasets lib=work;
modify raw;
format month date9.;
run;

proc datasets lib=work;
modify raw;
format month mmddyy8.;
run;

proc datasets lib=work;
modify raw;
format month yymmddn8.;
rename region = REGON_NAME state=st_name;
run;

/*APPENDING:*/
/*Appending the dataset from one dset to another dset*/
/*The male dataset adding at the bottom of the female 
dset*/
proc datasets library=work;
append base=female data=male force;
quit;

/*DETAILS*/
/* It will give the descriptive information for required
library*/
proc datasets library=work details;
quit;

proc datasets library=swati details;
quit;

/*Contents*/
/* It will give the descriptive information for required dataset 
in particular lib*/
proc datasets library=work ;
contents data=female;
run;

proc datasets library=work ;
contents data=female varnum short;
run;

proc datasets library=work ;
contents data=female short position;
run;

proc datasets library=work;
contents data=work._all_ nods;
run;

/*or*/
proc contents data=female;
run;

/*DELETE: Delete the required dsets from library*/
data a a1 a2 a3 a4 a5;
set sashelp.class;
run;

proc datasets library=work;
delete a a1;
quit;

proc delete data= a a1;
quit;

/*It will delete all the dasets start with 'a'*/
proc datasets library=work;
delete a:;
quit;

/*Kill*/
/*delete all members in the library*/
proc datasets lib=work kill;
run;

/*Repair: repair corrupted sas dataset*/
proc datasets lib=work;
repair raw;/*raw is the dataset name*/
run;


