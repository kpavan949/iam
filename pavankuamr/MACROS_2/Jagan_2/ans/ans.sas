
%macro ans(dsn,age);
data &dsn.;
set sashelp.class;
if age gt &age.;
run;

proc sort data=&dsn.;
by height;
run;

proc print data=&dsn.;
title "this is my autocall program";
title2 " crated for ANS team";
run;
%mend;

