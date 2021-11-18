/*PROC DELETE*/

/*This procedure is useful to delete the datasets*/
proc delete data=datsetname datsetname2 ---- datsetnamen;
run;

data new new1;
set sashelp.class;
run;


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


proc delete;
run;

/*If you want delete any particular dataset*/
proc delete data=new;
run;

libname one 'F:\JAGAN Sas_class\bhartath';

/*It will delete the dataset from one lib(permanent)*/
proc delete data=one.sandhya;
run;

/*I am creating the multiple datasets*/
data a1 a2 a3 a4;
set sashelp.class;
run;

/*I want to delete multiple datasets at a time*/
proc delete data = a1 a2 a3;
run;

proc delete data= a4 new1 new new3;
run;

/*data=_ALL: */
/*Delete all datasets from specific library*/

proc delete data=_all_;
run;
