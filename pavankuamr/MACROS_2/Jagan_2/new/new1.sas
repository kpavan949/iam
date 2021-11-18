
%macro new1(dsn,age);
data &dsn.;
set sashelp.class;
if age gt &age.;
run;

proc sort data=&dsn. out=&dsn._2;
by age;
/*where sex = 'F';*/
run;

proc print data=&dsn._2;
run;
%mend;
