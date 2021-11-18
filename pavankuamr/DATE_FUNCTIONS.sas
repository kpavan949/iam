/*Date Functions*/

/*SAS START DATE is 01JAN1960 ----1*/

/*DATE:  RETURNS THE current date as SAS date value.*/

/*syn: date();*/

data a;
a=date();
b=date()+30;
c=date()-2;
format a date7. b date9. c mmddyy8.;
run;

/*TODAY:  RETURNS THE current date as SAS date value.*/
/*syn: today();*/

data a1;
a=today();
b=today()+360;
c=today()-20;
format a date7. b date9. c mmddyy8.;
run;


/*DATETIME: RETURNS THE current date and time as SAS date value.*/

/*syn: datetime();  */

data a2;
a=datetime();
b=datepart(a);
c=timepart(a);
d=timepart(a);
format a datetime. b date9. c time5. d time8.;
run;

/*TIME: RETURNS THE current time as SAS date value.*/

/*syn: time();  */
/*NOTE: SAS time considered as 24 hrs format*/

data a3;
a=time();
format a time8. ;
run;

/*DAY: RETURns the day of the month from a SAS date value.*/

/*syn: DAy();*/
data a;
a=today();
b=today()+30;
c='30dec2016'd;
d='30nov2016'd+30;
d1=day(a);
d2=day(b);
d3=day(c);
d4=day(d);
format a date9. b date9.;
run;

/*week: Returns the week-number value*/
/*syn: week();*/

/*Note: it will calculate from 01jan*/

data a5;
a=today();
b=today()+30;
c='30dec2016'd;
d='30nov2016'd+30;
d1=week(a);
d2=week(b);
d3=week(c);
d4=week(d);
format a date9. b date9.;
run;

/*weekday: Returns the day of the week from SAS date value*/
/*Syn: weekday();*/

/*Sun=1, mon=2, Tue=3, Wed=4, Thr=5, Fri=6, Sat=7*/
data a6;
a=today();
b=today()+30;
c='30dec2016'd;
d='30nov2016'd+30;
d1=weekday(a);
d2=weekday(b);
d3=weekday(c);
d4=weekday(d);
format a date9. b date9.;
run;
 
/*MONTH:*/
/*Retunrs the month from a SAS date value*/

/*Syntax: Month(date);*/

DAta a;
a=date();
b=date()+30;
c='01nov2015'd;
a1=month(a);
a2=month(b);
a3=month(c);
run;
/*QTR:*/
/*Retunrs the quarter of the year from a SAS date value*/

/*Syntax: qtr(date);*/
DAta a1;
a=date();
b=date()-150;
c='01aug2015'd;
d='01mar2015'd;
a1=qtr(a);
a2=qtr(b);
a3=qtr(c);
a4=qtr(d);
run;

/*YEAR:*/
/*Retunrs the year from a SAS date value*/
/*Note: IT gives 4 digits year value*/
/**/
/*Syntax: year(date);*/

DAta a2;
a=date();
b=date()-3500;
c='01aug2016'd;
d='01mar2014'd;
a1=year(a);
a2=year(b);
a3=year(c);
a4=year(d);
run;

/*DHMS:*/
/*Returns A SAS datetime value from date,hour,minute, and second*/

/*Syntax: DHMS(date,hour,minute,second);*/

data a3;
a=Dhms('15jan2015'd,8,23,34);
b=Dhms('15jan2019'd,9,03,34);
c=Dhms('15jan2019'd,23,20,34);
format a datetime. b datetime. c datetime.;
run;

/*HMS:*/
/*Returns A SAS time value from hour, minute, and second*/
/**/
/*Syntax: HMS(hour,minute,second);*/

data a4;
a=hms(8,23,34);
b=hms(9,03,34);
c=hms(23,20,34);
format b time8. c time8.;
run;

/*Hour: Returns the Hour from a SAS time or datetime*/

/*Syntax: Hour(time or datetime);*/

data a3;
a=Dhms('15jan2015'd,8,23,34);
b=Dhms('15jan2019'd,9,03,34);
c=datetime();
d=hms(15,23,34);
a1=hour(a);
a2=hour(b);
a3=hour(c);
a4=hour(d);
run;

/*MINUTE: Returns the Minutes from a SAS time or datetime*/
/**/
/*Syntax: Minute(time or datetime);*/

data a4;
a=Dhms('15jan2015'd,8,00,34);
b=Dhms('15jan2019'd,9,03,34);
c=datetime();
d=hms(15,23,34);
a1=Minute(a);
a2=Minute(b);
a3=Minute(c);
a4=Minute(d);
run;

/*Seconds: Returns the seconds from a SAS time or datetime*/
/**/
/*Syntax: second(time or datetime);*/

data a5;
a=Dhms('15jan2015'd,8,00,34);
b=Dhms('15jan2019'd,9,03,23);
c=datetime();
d=hms(15,23,00);
a1=second(a);
a2=second(b);
a3=second(c);
a4=second(d);
run;

/*DATEPART: */
/*Extracts the date from a SAS datetime value.*/
/**/
/*Syn: Datepart(datetime);*/

data a;
a=datetime();
b=dhms('25feb2016'd,34,54,22);
c=datepart(a);
d=datepart(b);
format c date9. d date7.;
run;

/*TIMEPART:*/
/**/
/*Extracts the time from a SAS datetime value.*/
/**/
/*Syn: timepart(datetime);*/

data a6;
a=datetime();
b=dhms('25feb2016'd,34,54,22);
c=timepart(a);
d=timepart(b);
format b datetime. c time8. d time5.;
run;


/*DATEJUL:*/
/*Convert a julian date to a SAS date value.*/
/**/
/*Syntax: Datejul(juliandate);*/
/**/
/*Julian-date specifies a SAS numeric expression that represents a*/
/*Julian date. A julian date in SAS is a dte in the form of yyddd or*/
/*yyyyddd. where yy or yyyy ia two digit or four digit integer that */
/*represents the year and DDD is the number of the days of the year.*/
/*The value of ddd must be between 1 to 365 or 366(if leap year).*/

data a;
a=datejul(10350);
b=datejul(16060);
c=datejul(16366);
d=datejul(15366);
a1=today();
format a date9. b date9. c date9. d date9.;
run;

/*Juldate*/
/*:REturns the juliandate from sas date value*/

/*Syn: Juldate(date);*/
data a2;
a=today();
b=today()+35;
c='29feb1996'd;
c1='28feb1995'd;
d='31dec2004'd;
a1=juldate(a);
b2=juldate(b);
c3=juldate(c);
c31=juldate(c1);
d4=juldate(d);
format a date9. b date9. c date9. d date9.;
run;


/*HOLIDAY: */

/*Return the SAS date value for the holiday and year specified*/

/*Syn: Holiday("holiday",year);*/

/*VALID VALUES  FOR HOLIDAYS ARE*/

/*boxing, canada, canadaobserved, christmas, columbus, eastern,*/
/*fathers, hellowan, labour, memorial,mothers, newyear, */
/*Thanksgiving,Thanksgivingcanada, usindependence, uspresidents,*/
/*valentines, veterns, etc.*/


data a1;
a1=holiday('VICTORIA',2016);
a2=holiday('THANKSGIVING',2017);
a3=holiday('THANKSGIVING',2016);
a4=holiday('USINDEPENDENCE',2016);
a5=holiday('VALENTINES',2016);
a6=holiday('BOXING',2016);
a7=holiday('LABOR',2016);
a8=holiday('LABOR',2013);
a9=holiday('FATHERS',2013);
format a1 date9. a2 date9. a3 date9. a4 date9. a5 date9.
	a6 date9. a7 date9. a8 date9. a9 date9.;
run;


/*MDY  */
/*Returns a SAS date value from Month,day and year values.*/

/*Syn: MDY(month,day,year);*/

/*Month: Specifies a numeric expression it represents an integer*/
/*from 1 to 12.*/
/*DAY: Specifies a numeric expression it represents an integer from*/
/*1 to 31 */
/*YEAR: Specifies two digit or 4 digit integer that represents the*/
/*year.*/

/*Note: In the below example it will not allow the missing values*/

data a;
a=mdy(12,31,2016);
b=mdy(01,12,2018);
c=mdy(.,13,2016);
d=mdy(13,13,2016);
d1=mdy(2,30,2016);
e=mdy(2,28,2015);
format a date9. b date9. c date9. d date9.
	d1 date9. e date9.;
run;

/*NOTE:*/
/*For D variable month given morethan 12 so the o/p value is missing*/
/*For D1 variable, 2016 is leap year, In day position it will allow*/
/*upto 29 only. We given 30 so o/p is missing*/


/*INTCK*/

/*Return the integer count of the no.of interval b/w two dates or*/
/*times or datetime values.*/

/*Syn: intck(interval,from,to);*/

/*Interval: second,minutes, hours, day, week, month, qtr, semiyear*/
/*year*/

data a;
a='01jan2013'd;
b='31jan2016'd;
b1='31jan2018'd;
c=datetime();
d=dhms(today(),12,23,34);
a1=intck('days',a,b);
a2=intck('week',a,b);
a21=intck('month',a,b1);
a3=intck('qtr',a,b1);
a4=intck('semiyear',a,b1);
a5=intck('year',a,b1);
/**/
a6=intck('hour',c,d);
a7=intck('minute',c,d);
a8=intck('second',c,d);

format c datetime. d datetime.;
run;

/*INTNX*/
/*Increment a date, time or datetime values by given interval and*/
/*returns a date, time or datetime values.*/

/*Syn: Intnx(interval,startdate,increment/decrement,alignment);*/
data a1;
a=today();
b=intnx('days',a,8);
c=intnx('days',a,-8);
d=intnx('month',a,2);
e=intnx('month',a,-2);
f=intnx('month',a,-2,'B');
g=intnx('month',a,-2,'E');
h=intnx('month',a,-2,'M');
i=intnx('month',a,-36,'M');
j=intnx('qtr',a,-2);
k=intnx('week',a,-1);
L=intnx('week',a,-1,'E');
m=intnx('year',a,-1,'E');
n=intnx('year',a,-1,'B');

format a date9. b date9. c date9. d date9. e date9.
	f date9. h date9. i date9. j date9. k date9. l date9.
	m date9. n date9.;
run;


%let mth=%sysfunc(intnx(month,"&sysdate."d,-12),date9.);
%put &mth.;

%let mth=%sysfunc(intnx(month,"&sysdate."d,-2,E),ddmmyy10.);
%put &mth.;


/*SLEEP: For a specified period of time, suspends the execution of*/
/*program that invokes this function.*/

/*Syntax: Sleep(n,unit);*/
/*Note: The maximus sleep period for the sleep function is 46 days.*/

/*IT will stop the process 120 seconds*/
data _null_;
test=sleep(120);
run;

data a;
new=datetime();
format new datetime.;
run;

/*IT will stop the process 70 seconds*/
data _null_;
test=sleep(60);
run;

data b c;
set sashelp.class;
if sex = 'M' then output c;
if sex = 'F' Then output b;
run;

data a1;
new1=datetime();
format new1 datetime.;
run;

/*IT will stop the process 60(30*2) seconds*/
data _null_;
test=sleep(30,2);
run;

/*RANUNI*/
/*Return the random variate from uniform distribution.*/
data a;
set sashelp.class;
run;




/*IT will extract 15 random records*/
Data ran_2;
samsize=10;
obsleft=totobs;
do while(samsize > 0);
pic=pic+1;
if ranuni(0)< (samsize/obsleft) then do;
set sashelp.class point=pic nobs=totobs;
output;
samsize=samsize-1;
end;
obsleft=obsleft-1;
end;
stop;
run;

/*IT will extract 15 random records*/
/*Data ran_2;*/
/*samsize=5;*/
/*do i = 1 to samsize;*/
/*c=ranuni(0);*/
/*pick=ceil(ranuni(0)*tot);*/
/*set sashelp.class point=pick nobs=tot;*/
/*output;*/
/*end;*/
/*stop;*/
/*run;*/

























