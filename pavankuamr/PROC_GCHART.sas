/*PROC GCHART*/
/*The chart statement is useful to create frequency 
graphs*/
/*like HBAR, HBAR3D, VBAR, VBAR3D, PIE, PIE3D, STAR, */
/*BLOCK and DONUT charts.*/

/*Syntax:-*/

/*Proc Gchart data= dataset;*/
/*Chart chart-request(s)/options;*/
/*By Variable(s);*/
/*Run;*/

/*BLOCK produces a block chart.*/
/*HBAR: produces a horizontal bar chart*/
/*vBAR: produces a vertical bar chart*/
/*star: produce a start chart.*/
/*pie: produce a pie chart*/
/*by: produce a separate chart for each by group*/


Data ds;
Set sashelp.class;
Run;

/*HBAR & HBAR3D*/
Proc Gchart data=ds;
Hbar sex;
Run;
Quit;

Proc Gchart data=ds;
Hbar sex age;
Run;

Proc Gchart data=ds;
Hbar3d age;
Run;
Quit;

/*NOSTAT – Suppress printing of statistics in Hbar/Hbar3d.*/
Proc Gchart data=ds;
Hbar3d age /nostats;
Run;
Quit;

Proc sort data=ds;
By sex;
Run;

Proc Gchart data=ds;
Hbar3d age /nostats ;
By sex;
Run;
Quit;

/*VBAR & VBAR3D*/
Proc Gchart data=ds;
Vbar sex age;
Run;
Quit;

Proc Gchart data=ds;
Vbar3d age;
Run;
Quit;

proc gchart data=ds;
vbar sex/group=age;
run;

/*Options for HBAR and VBAR Charts */
/*MIDPOINTS= - specifies values for the midpoint values
on the midpoint axis.*/
Proc Gchart data=ds;
Vbar3d age/midpoints=11 12 13 15 16;
Run;


/*CAXIS - Applies colors for axis (borders).*/
Proc Gchart data=ds;
Vbar3d age/caxis=brown;
Run;
Quit;

/*CFRAME - Applies colors for frame.*/
Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=lightgreen;
Run;
Quit;

/*CTEXT - Applies colors for text.*/
Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=green ctext=Green;
Run;
Quit;

/*SPACE - Increase/decrease space between bars.*/
Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=green ctext=blue space=2;
Run;
Quit;

/*WIDTH - Increase/decrease width of Bars.*/
Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=green ctext=blue width=8;
Run;
Quit;

/*WOUTLINE - Increase/decrease width of bars outline.*/
Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=green ctext=blue width=10
woutline=5;
Run;
Quit;

/*GROUP - Prints graph on each group wise. */
Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=brown ctext=blue
	space=5 group=sex midpoints=11 to 16;
Run;
Quit;

/*The same thing we can do with BY statement also.*/
/*But difference is no need to sort data for GROUP, 
need to sort data for BY Statement.*/
/*GROUP print one Bar for all groups, but BY statement 
prints each group separate bar.*/

Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=green ctext=blue space=5;
By sex;
Run;
Quit;

/*SUBGROUP - Each bar in chart can be subdivided into 
segments.*/
Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=green ctext=blue space=5 
	subgroup=sex midpoints=11 to 16;
Run;
Quit;

/*Legend1 position= (top inside);*/
Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=green ctext=blue group=sex 
		inside=freq width=10
		outside=sum sumvar=height midpoints=11 to 16;
title 'bar chart';
Run;
Quit;

Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=green ctext=black
		subgroup=sex inside=percent width=10
		outside=sum sumvar=height midpoints=11 to 16;
title 'bar chart';
format height dollar8.;
Run;
Quit;

Proc Gchart data=ds;
Vbar sex/caxis=red cframe=green ctext=blue group=age 
		outside=sum sumvar=height patternid=group;
title 'bar chart';
Run;
Quit;

/*LEGEND Global statement and the LEGEND= Option*/
/*SAS/GRAPH automatically produces a legend when the 
SUBGROUP= option is used in the HBAR, HBAR3D, VBAR or 
the VBAR3D statement. However, if you would like to make
any modifications to the default attributes of the 
legend it is necessary to use both a LEGEND statement 
and the LEGEND= option. The NOLEGEND option suppresses 
the legend.  Syntax: - Legend options;*/
/*LABEL= (text_description) or NONE */
/*VALUE= (text_description) or NONE */
/*ACROSS=n where n is the number of entries in each 
row of the legend */
/**/
/*POSITION=(y x z) where y is either BOTTOM, MIDDLE or 
TOP, x is either LEFT, */
/*CENTER or RIGHT, and, z is either OUTSIDE or INSIDE */
/*FRAME draws a frame around the legend */
/*CFRAME specifies a color for the legend’s background */
/*CBORDER specifies a color for the legend’s border */
/*CSHADOW draws and colors a shadow behind the legend */
/*CBLOCK draws and colors a block behind the legend  */

Legend1 Label=(position=top 'pavans team genderwise data') 
             Value=('Females' 'Males') 
             Position=(top right outside) 
     Across=1 cborder=yellow cshadow=green 
cframe=orange ; 

Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=green ctext=blue 
		subgroup=sex
legend=legend1;
Run;
Quit;

/*SUMVAR - Specifies the variable to be used for sum 
and mean calculations*/

Proc Gchart data=ds;	
Vbar3d age/caxis=red cframe=green ctext=blue space=5 
	subgroup=sex sumvar=height sum 
	midpoints=11 to 16 by 0.5;
Run;
Quit;

/*Mean - displays the value of the mean statistic. */
Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=white ctext=black 
		Midpoints=11 12 13 14 15 16 sumvar=height mean
		inside=freq; 
Run;
Quit; 

/*Freq - displays the value of the frequency statistic*/
Proc Gchart data=ds;
Vbar3d age/caxis=red cframe=brown ctext=blue 
                      Midpoints=11 12 13 14 15 16 
				sumvar=height inside=freq outside=sum; 
Run; 
Quit; 

/*Sum - displays the value of the sum statistic for height &weight*/
Proc Gchart data=ds;
Vbar age/caxis=red cframe=yellow ctext=blue 
      Midpoints=11 12 13 14 15 16 sumvar=height sum; 
Vbar age/caxis=red cframe=yellow ctext=blue 
     Midpoints=11 12 13 14 15 16 sumvar=weight 
		inside=sum; 
Run;
Quit; 

/*IFRAME - Specifies image location to apply image as a
frame for graph.*/
Proc Gchart data=ds;
Vbar3d age/
	iframe="C:\Users\Public\Pictures\Sample Pictures\icicibank.jpg";
Run;
Quit;

Proc Gchart data=ds;
pie age/midpoints=11 12 13 14 15 16;
run;

proc gchart data=sashelp.cars;
  pie make / group=type 
             across=2
			 other=5
            otherlabel="test data"
            clockwise value=none
            slice=outside percent=inside;
run;
quit; 


proc gchart data=sashelp.cars(where=(type="SUV" or 
type="Truck"));
  pie make / group=type 
             across=2
			 other=4
            otherlabel="other data"
            clockwise value=none
            slice=outside percent=inside;
run;
quit; 

/*http://support.sas.com/documentation/cdl/en/graphref/63022/HTML/default/viewer.htm#gr13n11-ex.htm*/
/*PIE & PIE3D*/

Proc Gchart data=ds;
Pie age;
Run;

Proc Gchart data=ds;
Pie3d age;
Run;

/*DONUT*/
Proc Gchart data=ds;
Donut age;
Run;


/*STAR*/
Proc Gchart data=ds;
Star age ;
Run;

/*BLOCK*/
Proc Gchart data=ds;
Block age;
Run;


Proc Gchart data=ds ;
Block age/subgroup=sex
          Legend=legend1;
/*          Midpoints= 11 to 16 by 1;*/
Run;

Proc Gchart data=ds ;
Block age/subgroup=sex
          Legend=legend1
          Midpoints=11 to 16 by 1;
Run;


/*axis1 order=(0 to 20);*/
/*maxis=axis1 */

















