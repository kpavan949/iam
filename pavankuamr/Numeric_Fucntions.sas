/*Numeric Functions*/

/*Mean: Return the arithemetic mean*/

/*argument is numeric at least one non-missing argument is required*/
/*otherwise the function returns a missing value*/

/*Syntax: mean(arguemtn-1, arguemtn-2,--- argument-n);*/
/*Syntax: mean(var-1, var-2,--- var-n);*/

data a;
a1=mean(2,6,8); /*2+6+8/3=5.33*/
a2=mean(2,4,6,8); /*2+4+6+8/4=5*/
a3=mean(2,3,4,6,8); /*2+3+4+6+8/5=4.6*/
a4=mean(4,4,4,4,4); /*4+4+4+4+4/5=4*/
a5=mean(of a1-a4);/*mean(a1,a2,a3,a4);*/
a51=mean(of a:);/*mean(a1,a2,a3,a4,a5);*/
a52=mean(of a1:a4);/*mean(a1,a2,a3,a4);*/
a6=mean(a1,a4);/*mean(a1,a4);*/
a7=mean(a1,a2);/*mean(a1,a2);*/
a8=mean(a1,a3);/*mean(a1,a3);*/
a9=mean(.,2,4,.,.);/*2+4/2=*/
a10=mean(.,2,4,6,.,.);
run;

/*Median: Calculate median of the non missing values of list of*/
/*numeric values.*/

/*syntax: median(valu-1, value-2--- value-n);*/

data a;
a1=median(2,6,8); 
a2=median(2,3,.,.,4,6,8);
a3=median(2,.,4,6,8);
a4=median(4,.,.,4,4);
run;

/*Min: Returns the smallest value*/
/*syntax: min(valu-1, value-2--- value-n);*/

data amin;
a1=min(2,6,8); 
a2=min(2,3,.,.,4,6,8,1);
a3=min(2,.,4,6,8,7,0.5);
a4=min(4,.,.,3.4,4,5);
a5=min(of a1-a4); /*or min(a1,a2,a3,a4)*/
run;

/*Max: Returns the largest value*/
/*syntax: max(valu-1, value-2--- value-n);*/

data amax;
a1=max(2,6,8); 
a2=max(2,3,.,.,4,6,8);
a3=max(2,.,4,6,8);
a4=max(4,.,.,3.4,4,5);
a5=max(of a1-a4); /*or max(a1,a2,a3,a4)*/
run;

/*Range: Return the range of values */

/*syntax: range(valu-1, value-2--- value-n);*/

/*Note: the fn returns the diff b/w the largest and the smallest of*/
/*the non missing values*/

data arange;
a1 = range(.,34,45,89);
a2 = range(34,34,45,189);/*155*/
a3 = range(11,34,45,18);/*34*/
a4 = range(of a1-a3);/*range(a1,a2,a3)*/
run;

/*Sum fn: Returns the sum of the non missing values.*/

/*syntax: sum(valu-1, value-2--- value-n);*/

/*Sum statement: Adds the value into variabe with non missing values.*/
/*Its won't consider missing values. If missing values are there.*/
/*sum value is missing.*/

data a;
a1=sum(2,4,.,8);
a2=sum(2,.,.,.,8);
a3=2+4+.+8;/*sum stmt*/
a4=2+4+10+8;/*sum stmt*/
a5=sum( of a1-a4);
run;

/*NMISS: Return the no.of missing values*/

/*syntax: nmiss(valu-1, value-2--- value-n);*/
data anmiss;
a1=nmiss(2,4,.,8);
a2=nmiss(2,.,.,.,8);
a3=nmiss(2,3,4,45);
run;

/*N: Return the no.of non missing values*/
/*syntax: n(valu-1, value-2--- value-n);*/

data an;
a1=n(2,4,.,8);
a2=n(2,.,.,.,8);
a3=n(2,3,4,45);
run;

/*Coalesce*/
/*To select the first non missing value in a list of numeric*/
/*arguemtns*/

/*syn: coalesce(var1,var2,--- varn);*/
data a;
var1=coalesce(2,4,6);
var2=coalesce(4,.,8);
var3=coalesce(.,.,6);
var4=coalesce(.,.,.);
run;

data a;
input m1 m2 m3;
datalines;
23 34 .
. 45 54
. . 34
78 43 56
;
run;

data c;
set a;
new=coalesce(m1,m2,m3);
sm=sum(m1,m2,m3);
mn=min(m1,m2,m3);
mx=max(m1,m2,m3);
avg=mean(m1,m2,m3);
run;

/*COALESCEC*/
/*To select the first non missing value in a list of character*/
/*arguemtns*/
data a1;
var1=coalescec('swati','praveen');
var2=coalescec(' ','test','new');
var3=coalescec('','','vijaya');
run;

/*Anydigit*/
/*to locate the first occurance of a digit and returns 
ts position.*/
/*if none is found the fn returns a 0(zero).*/
/*syntax: anydigit(string,start);*/

data a;
input address $30.;
datalines;
jagan mohan flot 102 hyd
vijya sri flot 202 bang
suresh kumar
jagan mohan flot 10g 456
;
run;

data b;
set a;
new=anydigit(address);
new1=anydigit(address,20);
new2=anydigit(address,21);
/*new3=anydigit(address,-6);*/
run;

/*LAG*/
To obtain the values of variable from previous observation
or nth observation previous to the current observation

/*syntax: lag(varname);*/

data a3;
input id dept $ MONTH $ sales;
DATALINES;
100 BISC feb18 34000
100 BISC mar18 42000
100 BISC apr18 43000
100 BISC may18 40000
100 BISC jun18 30000
100 BISC july18 35000
;
run;

data a4;
set a3;
psales=lag(sales);
psales2=lag2(sales);
psales3=lag3(sales);
psales4=lag4(sales);
diff=sales-psales;
diff2=sales-psales2;
run;
/*MOD*/
/*RETURNs the  remainder from the division of the first 
argument by the second argument.*/
 /**/
/*Syntax: Mod(argument-1,argument-2);*/

data a b;
set sashelp.class;
new=_n_;
if mod(_n_,2)=0 then output a;
if mod(_n_,2)=1 then output b;
run;


data a1 b1 c1 d1 E1;
set sashelp.class;
new=_n_;
if mod(_n_,3)=0 then output a1;/*it will get every 3rd record*/
/*it will get every 3rd record but it will start from 1st record*/
if mod(_n_,3)=1 then output b1;
if mod(_n_,9)=1 then output c1;
if mod(_n_,6)=1 then output d1;
if mod(_n_,4)=1 then output E1;
run;

/*Ceil*/
/*Returns integer that is greater than or equal to the
argument.*/

/*Syn: Ceil(argument);*/

data a;
var1=ceil(2.4);
var2=ceil(3.5);
var3=ceil(4.8);
var4=ceil(-4.8);
run;

/*floor*/
/*Returns integer that is less than or equal to the argument.*/
/**/
/*Syn: floor(argument);*/
data a1;
var1=floor(2.4);
var2=floor(3.5);
var3=floor(4.8);
var4=floor(-4.8);
var5=floor(-2.8);
run;

/*ABS: Returns the absolute value*/
/*Syn: abs(argument);*/
/*Note: If values is negative it converts into +ve*/
data a2;
var1=abs(2.4);
var2=abs(-3.5);
var3=abs(4.8);
var4=abs(-5.8);
run;

/*int*/
/*Returns integer value and not considering the decimal
values*/
/*Syn: int(argument);*/
data a4;
var1=int(2.4);
var2=int(3.5);
var3=int(4.8);
var4=int(-4.8);
run;

/*ROUND*/
/*It will take the neartest value*/
/*Syn: round(argument);*/

data a4;
var1=round(2.4);
var2=round(3.5);
var3=round(4.8);
var4=round(-4.8);
/*IF you want to take decimals*/
/*Syn: round(argument,roundingunit);*/
var5=round(4.45);
var51=round(4.45,.1);
var6=round(4.56,.1);
var7=round(4.667,.1);
var8=round(4.667,.01);/*it will read two decimals*/
var9=round(4.5667,.001);/*it will read 3 decimals*/
run;














