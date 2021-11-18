PROC COPY;

/*THIs is procedure is useful for copying sas data library entries
from one device to another.*/

/*syntax:*/

proc copy in=libname1 out=libname2 options;
select dataset1 dataset2 --- datasetn;
exclude dataset1 dataset2 --- datasetn;
run;

/*IN=  libname: refers the sas libary containing the datasets that */
/*are to be copied. like a source*/
/**/
/*out=  libname refers the sas libary into which datasets are copied.*/
/*like destinations*/
/**/
/*SELECT selected dataset are copied from in library to out library*/
/**/
/*EXCLUDE select selected dataset are not copied from in library to */
/*out library*/
/**/
libname suresh 'F:\JAGAN Sas_class\data\dsets';

libname anil 'F:\JAGAN Sas_class\data\dsets2';

/*copy the all the datasets from one lib to work library*/

proc copy in=suresh out=work;
run;

/*copy the all the datasets from one lib to two library*/
proc copy in=suresh out=anil;
run;

/*execute this*/
proc datasets library=anil kill;
run;
/*Note: it will delete all datasets from anil lib*/

/*copy the selected dataset from one to two library */
proc copy in=suresh out=anil;
select four_1 one_1 six_1;
run;

/*exclude some datasets while copying from one library to two library */
proc copy in=suresh out=anil;
exclude four_1 one_1 six_1;
run;


/*example2*/
proc copy in=sashelp out=work;
run;

/*it will delete the all datasets in work lib*/
proc datasets library=work kill;
run;

proc copy in=sashelp out=work memtype=data;
run;


proc copy in=sashelp out=work memtype=data;
run;

proc datasets library=work kill;
run;

proc copy in=sashelp out=work memtype=view;
run;

proc datasets library=work kill;
run;

proc copy in=sashelp out=work memtype=catalog;
run;

proc datasets library=work kill;
run;


