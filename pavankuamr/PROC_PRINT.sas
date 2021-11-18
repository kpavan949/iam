/*PROC PRINT*/
/*The Print procedure print the observation in a sas
dataset using all or some of the variables*/

syntax: Proc print data=datasetname options;
		by var-1 var-2 ---- varn;
		var var-1 var-2--- varn;	
		sum var-1 var-2--- varn;
		pageby variabale;
		id variable	;
		run;

/*statements:*/
/*BY : Produce separate section of the report for each
	by group*/
/*Var: select variables that appear in the report and
		determine their order*/
/*sum: total values of numeric variables*/
/*page by : It will create the separate page for by
		variables*/
/*ID: Identify the obsevation by the formatted values of
the variable that you list instead of obsevation number.*/
/*Sumby: limit the no.of sums that appear in the report.*/

/*optins*/
/*Split: Identifies the asterisk as the char that starts
		a new line in colum heading*/
/*noobs:noobs suppress the printing of obs number at the
		begining of the rows.*/
/*N: N option points the no.of obs at the end of the 
		report*/
/*label: label uses the variables label as column heading		s*/
/*sumlabel: display the by variable label on the summary
line*/

data raw; 
   input region $ state $ month monyy5. 
         headcnt expenses revenue; 
   format month monyy5.; 
cards; 
Eastern  VA FEB78  10  7800 15500 
Southern FL MAR78   9  9800 13500 
Southern GA JAN78   5  2000  8000 
Northern MA MAR78   3  1500  1000 
Southern FL FEB78  10  8500 11000 
Northern NY MAR78   5  6000  5000 
Eastern  VA MAR78  11  8200 16600 
Plains   NM MAR78   2  1350   500 
Southern FL JAN78  10  8000 10000 
Northern NY FEB78   4  3000  4000 
Southern GA FEB78   7  1200  6000 
; 
run;

data a;
set sashelp.class;
run;

/*It will print the latest dataset*/
proc print;
run;

/*It will print the raw data*/
proc print data=raw;
run;

proc print data=raw;
var region state month;
title 'This report for 10.00 batch';
title2 'This report genarated by pavan';
title3 "This report created on &sysdate.";
footnote "this report genrated for loan team";
footnote2 "this report genrated for sai team";
run;

proc print data=raw;
var region state month revenue;
title 'first program';
run;


proc print data=raw;
var region state month revenue;
/*title 'first program';*/
/*title ' ';*/
footnote ' ';
run;

/*It will give the sum for revenu & expenses variables 
and it 
will print all variables*/
proc print data=raw;
/*sum revenue;*/
sum revenue expenses;
title 'second program';
run;

/*It will give the sum for headcnt & revenue variables 
and it
will print only 4 variables(revenue & expenses also)*/
proc print data=raw;
var region state;
sum revenue headcnt;
title 'second program';
run;

proc sort data=raw out=raw1;
by region;
run;

/*It will create the separate section based on region 
variable*/
/*but first must and should we need do the sort for by 
variables*/
proc print data=raw1;
by region;
var state month headcnt;
sum revenue;
run;

proc sort data=raw out=raw2;
by region state;
run;

/*It will create the separate section based on region 
& state vars*/
/*but first must and should we need do the sort for by 
variables*/
proc print data=raw2;
by region state;
var month headcnt;
sum revenue expenses;
run;

/*It will create the separate section based on region & 
state*/
/*variables and each page will disply only one region*/
proc print data=raw2;
by region state;
pageby region;
var month headcnt;
sum revenue expenses;
run;

/*It will create the separate section based on region &
state vars*/
/*and each page will showing statewise*/
proc print data=raw2;
by region state;
pageby state;
var month headcnt;
sum revenue expenses;
run;

/*ID Values will dispaly instead of obsevatin number*/
proc print data=raw2;
by region state;
var month headcnt;
sum revenue expenses;
id month revenue;
run;

/*If we use the label option it will print with lable 
names*/
/*Note: first try without lable after dataset name 
then see the 
output*/
proc print data=raw2 label;
by region state;
sum revenue expenses;
id month revenue ;
label region='REGION_NAME' 
		month='SALES OF MONTH' 
		revenue='SALES OFREVENUE'
			state= 'STATE_NAME';
run;

proc print data=raw2 label sumlabel;
by region state;
sum revenue expenses;
id month revenue ;
label region='REGION_NAME' 
		month='SALES OF MONTH' 
		revenue='SALES INCOME'
		state= 'STATE_NAME';
run;

/*Note: sumlabel In summary place it will display the 
label value*/

/*NOOBS: NOOBS suppress the printing of obs no at the 
begining of
the o/p*/

proc print data=raw2 noobs label;
by region state;
sum revenue expenses;
label region='REGION_NAME' month='SALES OF MONTH'
	revenue='SALES INCOME';
run;

/*OBS: specify the  column heading for the column that
identifies
each obs by number*/
proc print data=raw2 obs='Employee number' label;
by region state;
/*var month headcnt;*/
sum revenue expenses;
label region='REGION_NAME' month='SALES OF MONTH' 
	revenue='SALES INCOME';
run;

/*N: n option point the no.of obseration at the end of 
the report*/
proc print data=raw2 obs='observarion number' label n;
by region state;
sum revenue expenses;
label region='REGION_NAME' month='SALES OF MONTH' 
	revenue='SALES INCOME';
run;

proc print data=raw2 obs='observarion*number' label n 
			split='*';
by region state;
sum revenue expenses;
label region='REGION*NAME' month='SALES*OF*MONTH' 
		revenue='SALES*INCOME';
run;

/*export to external file into PDF format*/
ods pdf file="F:\JAGAN Sas_class\print\region.pdf";

proc print data=raw2 obs='observarion number' label n ;
by region state;
/*var month headcnt;*/
sum revenue expenses;
label region='REGION_NAME' month='SALES OF MONTH' 
revenue='SALES INCOME';
run;

ods pdf close;

ods rtf file="F:\JAGAN Sas_class\print\state_NEW.rtf";
proc print data=raw2;
by region state;
pageby state;
var month headcnt;
sum revenue expenses;
run;
ods rtf close;

ods html BODY="F:\JAGAN Sas_class\print\state_NEW.html";
proc print data=raw2;
by region state;
pageby state;
var month headcnt;
sum revenue expenses;
run;
ods html close;

proc sort data=sashelp.class out=new(keep=sex age 
height);
by sex;
run;

proc print data=new;
run;

ods pdf file="F:\JAGAN Sas_class\print\region_st.pdf";
proc print data=new
	Style(header)={background=blue
					foreground=red 
					font_weight=bold 
					font_face=Algerian
					font_size=5}
	Style(obsheader)={background=lightgreen
					foreground=white 
					font_weight=bold 
					font_face=Arial
					font_size=5}
	Style(data)={background=PURPLE
					foreground=black
					font_weight=bold 
					font_face=batang
					font_size=3}
 	Style(obsdata)={background=yellow
					foreground=black
					font_weight=bold 
					font_face=batang
					font_size=3}
	Style(total)={background=blue
					foreground=red
					font_weight=bold 
					font_face=batang
					font_size=2}
	
	Style(grandtotal)={background=brown
					foreground=yellow
					font_weight=bold 
					font_face=batang
					font_size=4};


by sex;
id sex/Style={background=brown
					foreground=yellow
					font_weight=bold 
					font_face=batang
					font_size=4};;
sum height;
run;
ods pdf close;


/*proc print data=raw2 style(header)={fontstyle=italic*/
/*		color=blue font_weight=bold font_size=6};*/
/*by region state;*/
/*sum revenue expenses;*/
/*label region='REGION*NAME' month='SALES*OF*MONTH' revenue='SALES*INCOME';*/
/*run;*/
/**/
/**/
/*proc print data=raw2 style(header)={fontstyle=italic*/
/*		color=blue font_weight=bold font_size=6} label;*/
/*by region state;*/
/*var revenue/style(header)={backgroundcolor=red fontstyle=italic*/
/*		foreground=blue font_weight=bold font_size=6};*/
/*sum revenue/style(total)={backgroundcolor=red fontstyle=italic*/
/*		foreground=blue font_weight=bold font_size=6};*/
/*sum expenses/style(total)={backgroundcolor=yellow fontstyle=italic*/
/*		foreground=blue font_weight=bold font_size=6}*/
/*style(grandtotal)={backgroundcolor=red fontstyle=italic*/
/*		foreground=blue font_weight=bold font_size=6};*/
/*label region='REGION*NAME' month='SALES*OF*MONTH' revenue='SALES*INCOME';*/
/*run;*/

