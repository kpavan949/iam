/*PROC GPLOT*/
/*The plot statement specifies one or more plot requests
that namethe horizontal and left vertical axis
variables*/

/*Proc Gplot data=dataset;*/
/*Plot plot-request(s)/options;*/
/*Run;*/


Data ds; 
Input year @7 hdate date7. High @24 Ldate date7. Low; 
format hdate ldate date7. ;
Datalines; 
1954  31DEC54  404.39  11JAN54  279.87 
1955  30DEC55  488.40  17JAN55  388.20 
1956  06APR56  521.05  23JAN56  462.35 
1957  12JUL57  520.77  22OCT57  419.79 
1958  31DEC58  583.65  25FEB58  436.89 
1959  31DEC59  679.36  09FEB59  574.46 
1960  05JAN60  685.47  25OCT60  568.05 
1961  13DEC61  734.91  03JAN61  610.25 
1962  03JAN62  726.01  26JUN62  535.76 
1963  18DEC63  767.21  02JAN63  646.79 
1964  18NOV64  891.71  02JAN64  768.08 
1965  31DEC65  969.26  28JUN65  840.59 
1966  09FEB66  995.15  07OCT66  744.32 
1967  25SEP67  943.08  03JAN67  786.41 
1968  03DEC68  985.21  21MAR68  825.13 
1969  14MAY69  968.85  17DEC69  769.93 
1970  29DEC70  842.00  06MAY70  631.16 
1971  28APR71  950.82  23NOV71  797.97 
1972  11DEC72 1036.27  26JAN72  889.15 
1973  11JAN73 1051.70  05DEC73  788.31 
1974  13MAR74  891.66  06DEC74  577.60 
1975  15JUL75  881.81  02JAN75  632.04 
1976  21SEP76 1014.79  02JAN76  858.71 
1977  03JAN77  999.75  02NOV77  800.85 
1978  08SEP78  907.74  28FEB78  742.12 
1979  05OCT79  897.61  07NOV79  796.67 
1980  20NOV80 1000.17  21APR80  759.13 
1981  27APR81 1024.05  25SEP81  824.01 
1982  27DEC82 1070.55  12AUG82  776.92 
1983  29NOV83 1287.20  03JAN83 1027.04 
1984  06JAN84 1286.64  24JUL84 1086.57 
1985  16DEC85 1553.10  04JAN85 1184.96 
; 
Run;

Proc Gplot data=ds; 
Plot high*year; 
Run;


Proc Gplot data=ds; 
bubble high*year=low; 
Run;

Proc Gplot data=ds; 
bubble high*year=low/bcolor=blue blabel bsize=8; 
Run;


Proc Gplot data=ds; 
bubble high*year=low/bcolor=blue blabel bsize=8; 
bubble2 low*year=high/bcolor=yellow blabel bsize=8; 
Run;

/*Quit;*/

/*Options:-*/
/*HAXIS=*/
Proc Gplot data=ds; 
Plot high*year/haxis=1950 to 1990 by 5; 
Run;
Quit;

/*Note: Creates plots in which one variable is plotted on */
/*the horizontal axis and vertical axis*/
/**/
/*high is vertical axis(yaxis) and year is horizontal axis*/
/*(x axis)*/

Proc Gplot data=ds; 
Plot high*year='&'/haxis=1950 to 1990 by 5; 
Run;
Quit;

/*VAXIS=*/
Proc Gplot data=ds; 
Plot high*year='/'/haxis=1950 to 1990 by 2 
			vaxis= 0 to 3000 by 200 ; 
Run;
Quit;

/*HREF=*/
Proc Gplot data=ds; 
Plot high*year='&/'/haxis=1950 to 1990 by 2 
					vaxis= 0 to 3000 by 500 
					href=1960 1985 ; 
/*                		href=1960 1965 1970 1980; */
Run;
Quit;

/*VREF=*/
Proc Gplot data=ds; 
Plot high*year='/'/haxis=1950 to 1990 by 2
				vaxis= 0 to 3000 by 500 
                href=1970 1980 vref=500 1500 ; 
Run;
Quit;

/*HREVERSE*/
Proc Gplot data=ds; 
Plot high*year='*'/haxis=1950 to 1990 by 2
			vaxis= 0 to 3000 by 500 
                  vref=1000 2000 hreverse; 
Run; 

/*VREVERSE*/
Proc Gplot data=ds; 
Plot high*year='/'/haxis=1950 to 1990 by 2 
					vaxis= 0 to 3000 by 500 
                vref=1000 2000 vreverse; 
Run;
Quit;

Proc Gplot data=ds; 
Plot high*year='/' low*year='0'/haxis=1950 to 1990 by 5
	 vref=500 1000 1500; 
Run;
Quit;

/*OVERLAY:
If the OVERLAY option is not specified, each plot request
generates a separate graph.*/
Proc Gplot data=ds; 
Plot high*year='*' low*year='0'/haxis=1950 to 1990 by 5
                    vref=500 1000 1500 overlay; 
Run; 

/*CAXIS=axis-color*/
/*CFRAME=background-color*/
/*CTEXT=text-color*/
Proc Gplot data=ds; 
Plot high*year='*' low*year='0'/haxis=1950 to 1990 by 5
		vref=500 1000 1500 overlay caxis=red; 
Run;
Quit;

Proc Gplot data=ds; 
Plot high*year='*' low*year='0'/haxis=1950 to 1990 by 2
		vref=500 1000 2000 overlay  
        	caxis=red cframe=lightgreen; 
Run; 

Proc Gplot data=ds; 
Plot high*year='*' low*year='0'/haxis=1950 to 1990 by 5
		vref=500 1000 1500 overlay 
        		caxis=red cframe=lightgreen ctext=brown; 
Run;

Proc Gplot data=ds; 
Plot high*year='*' low*year='0'/haxis=1950 to 1990 by 5
			Vref=500 1000 1500 overlay  
        	Caxis=red ctext=blue
/*		Iframe="C:\Users\Public\Pictures\Sample Pictures\icicibank.jpg";  */
		Iframe="C:\Users\Public\Pictures\Sample Pictures\Koala.JPG";  
Run;

/*HMINOR=number-of-minor-ticks*/
/*specifies the number of minor tick marks drawn between each major tick mark on the*/
/*horizontal axis*/
/*VMINOR=number-of-minor-ticks*/
/*specifies the number of minor tick marks drawn between each major tick mark on the*/
/*Vertical axis*/

symbol1 interpol=join value=dot;

Proc Gplot data=ds; 
Plot high*year/haxis=1950 to 1990 by 5
                Vref=500 1000 1500  
                Caxis=red ctext=yellow
						hminor=2
                    vminor=5;  
Run;
Quit;

symbol1 interpol=join
        value=dot
        color=red;

symbol2 interpol=join
        value=C
        font=marker
        color=_Style_;

Proc Gplot data=ds; 
Plot high*year low*year/haxis=1950 to 1990 by 5
                Vref=500 1000 1500 overlay  
                Caxis=red ctext=blue;  
Run;
Quit;


symbol1 interpol=join value=dot color=_style_;
symbol2 interpol=join value=C   color=_style_ ;

axis1 order=(1955 to 1995 by 5)
      label=('new');
      
axis2 order=(0 to 3000 by 1000)
      label=none;   
      
legend1 label=('Year Values')
        position=(top center outside);

Proc Gplot data=ds; 
Plot high*year low*year/haxis=axis1	 
					legend=legend1	vaxis=axis2
                Vref=500 1000 1500 overlay  
                Caxis=red ctext=blue;  
Run;
Quit;

symbol1 interpol=join value=dot color=_style_;
symbol2 interpol=join value=C   color=_style_ ;

axis1 order=(1955 to 1995 by 5)
      label=('new');
      
axis2 order=(0 to 3000 by 500)
      label=('High'); 

axis3 order=(0 to 1000 by 100)
      label=('low'); 

Proc Gplot data=ds; 
Plot high*year /haxis=axis1	vaxis=axis2	
                Caxis=red ctext=blue cframe=lightgreen;  
Plot2 low*year/haxis=axis1 vaxis=axis3 legend=legend1;  

Run;
Quit;




