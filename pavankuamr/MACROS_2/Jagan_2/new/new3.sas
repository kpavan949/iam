
%macro new3(dsn,age);
data &dsn.;
set sashelp.class;
if age gt &age.;
run;

proc sort data=&dsn. out=&dsn._2;
by height;
run;
%mend;
