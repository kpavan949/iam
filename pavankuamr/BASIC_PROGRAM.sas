data stu;
input id name $ loc $ sal dept $;
datalines;
100 jagan hyd 45000 ece
200 surya bang 43000 it
300 vijaya che 42100 ece
400 suresh delhi 54000 IT
500 lucky bombay 43200 comp
;
run;

/*execute this program and check the log & dataset*/
data stu_1;
input id name $ loc $ sal dept $;
rec_cnt=_n_;
err_cnt=_ERROR_;
datalines;
100 jagan hyd 45000 ece
200 surya bang 43000 it
300 vijaya che 42100 ece
400 suresh delhi 54000 IT
500 lucky bombay 43200 comp
;
run;

/*execute this program and check the log & dataset*/
data stu_2;
input id name $ loc $ sal dept $;
rec_cnt=_n_;
err_cnt=_ERROR_;
datalines;
100 jagan hyd 45000 ece
200 surya bang hhhh it
300 vijaya che 42100 ece
kkk suresh delhi tesc IT
klm lucky bombay 43200 comp
;
run;

data a;
set sashelp.class;
run;
