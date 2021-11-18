/*PROC MEANS*/

/*The means procedure provides data summarization tools
to calculate descriptive statistics for variables across 
all observation and within group of observation.*/

/*Syntax;*/
Proc means data=datasetname options;
by var-1 var-2--- var-n;
class variable;
id variable;
var var-1 var-2--- var-n;
output out=;
ways *;
run;

/*By: Calculate the separate statics for each by group*/
/*Class: identify variables whose values define subgroup
for the analysis*/
/*Var:Identify the analysis variable and their order in 
the results*/
/*Id: includes additional identification variables in
the o/p dataset*/
/*Output: it will create the another daset with analysis
of data*/
/*ways: specify the no.of ways to make unique combination
of class variables*/


data gains; 
   input name $  team $  age ; 
   cards; 
Alfred  blue    6 
Alicia  red     25 
Barbara  .      5 
Bennett red     . 
Carol   blue    15 
Carlos  blue    6 
Carol1  .       35 
Carlos2  red    6 
; 
 run;
              
/* BY DEFAULT STATICS N, MEAN, STDDEV, MIN AND MAX*/
proc means data=gains;
run; 

proc means data=gains n mean;
run; 

/*RANGE: MAXImUM- MINiMUM VALUE*/
proc means data=gains n mean range;
run; 

proc means data=gains;
class team;
run; 

proc means data=gains missing;
class team;
run; 

/*example 2*/
data gains; 
    input name $ sex $ height  weight  school $  time; 
cards; 
Alfred  M 69.0 122.5 AJH  1 
Alfred  M 71.0 130.5 AJH  2 
Alicia  F 56.5  84.0 BJH  1 
Alicia  F 60.5  86.9 BJH  2 
Benicia F 65.3  98.0 BJH  1 
Benicia F 69.3  99.1 BJH  2 
Bennett F 63.2  96.2 AJH  1 
Bennett F 69.2  98.2 AJH  2 
Carol   F 62.8 102.5 BJH  1 
Carol   F 65.3 105.4 BJH  2 
Carlos  M 63.7 102.9 AJH  1 
Carlos  M 70.3 106.9 AJH  2 
Henry   M 63.5 102.5 AJH  1 
Henry   M 68.9 108.6 AJH  2 
Jaime   M 57.3  86.0 BJH  1 
Jaime   M 62.9  90.0 BJH  2 
Janet   F 59.8  84.5 AJH  1 
Janet   F 62.5  86.5 AJH  2 
Jean    M 68.2 113.4 AJH  1 
Jean    M 70.3 116.0 AJH  2 
Joyce   M 51.3  50.5 BJH  1 
Joyce   M 55.5  53.5 BJH  2 
Luc     M 66.3  77.0 AJH  1 
Luc     M 69.3  82.9 AJH  2 
Marie   F 66.5 112.0 BJH  1 
Marie   F 69.5 114.9 BJH  2 
Medford M 64.9 114.0 AJH  1 
Medford M  .     .    .   . 
Philip  M 69.0 115.0 AJH  1 
Philip  M 70.0 118.0 AJH  2 
Robert  M 64.8 128.0 BJH  1 
Robert  M 68.3   .   BJH  2 
Thomas  M 57.5  85.0 AJH  1 
Thomas  M 59.1  92.3 AJH  2 
Wakana  F 61.3  99.0 AJH  1 
Wakana  F 63.8 102.9 AJH  2 
William M 66.5 112.0 BJH  1 
William M 68.3 118.2 BJH  2 
; 
run;

/*It will give default statistics*/
proc means data=gains;
run;

/*It will give default statistics for height variables*/
proc means data=gains;
var height ;
run;

/*It will give default statistics for height & weight 
variables*/
proc means data=gains;
var height weight;
run;

proc means data=gains;
var height;
class sex;
run;

proc means data=gains;
var height weight;
class sex;
output out=new;
/*output out=new1(drop=_TYPE_ _FREQ_);*/
run;

/*calculate the statics for height & weight and create 
the new*/
/*dataset with max & min values*/
/*separate the statics based on sex variable*/
proc means data=gains;
var height weight;
class sex;
output out=new1 max=maxheight maxwieght min=minht minwt
				sum=sumht sumwt;
run;

/*calculate the statics for height & weight and create 
                 the new dataset with max & min values*/
/*separate the statics based on sex variable*/
/*and give the additional information*/
proc means data=gains;
var height weight;
class sex;
output out=new2 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest;
run;

proc means data=gains;
var height weight;
class sex;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
run;

proc means data=gains;
var height weight;
/*class sex school;*/
class sex school time;
output out=new3_1 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
run;


proc sort data=gains out=gains2;
by school time;
run;

/*IT will create the separate section based on school 
& time*/
proc means data=gains2;
by school time;
var height weight;
class sex;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
run;


proc means data=gains;
var height weight;
class sex school;
ways 1;
/*ways 1 2;*/
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
run;

/*It will calculate one-way,two-way & three-way 
combination*/
proc means data=gains;
var height weight;
class sex school time;
/*ways 1;*/
/*ways 1 2;*/
/*ways 1 2 3;*/
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
run;

/*Types:Identify specific combination of class 
variables to use*/
/*to subdivide the data*/
proc means data=gains;
var height weight;
class sex school;
types sex school;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
	title 'one way and two way calculations';
run;

proc means data=gains maxdec=2 fw=6 nonobs missing;
var height weight;
class sex school;
types sex school sex*school;
/*types sex*school;*/
output out=new4 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
	title 'one way and two way calculations';
run;


ods pdf file="F:\Jagan Sas_class2\outputs\ans_means.pdf";
proc means data=gains maxdec=3 fw=10 nonobs missing;
var height weight;
class sex school;
types sex school sex*school;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
	title 'one way and two way calculations';
run;

ods pdf close;


ods html body="F:\Jagan Sas_class2\outputs\ans_ttt.html";
proc means data=gains maxdec=3 fw=10 nonobs missing;
var height weight;
class sex school;
types sex school sex*school;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
	title 'one way and two way calculations';
	footnote 'proc menas procudeure';
	footnote2 "Genarated by stephen team on &sysdate.";
run;

ods html close;



/*proc sort data=gains out=gains2;*/
/*by sex height;*/
/*run;*/

