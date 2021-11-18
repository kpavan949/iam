/*PROc CORR*/
/*The proc corr procedure produce pearson correlation */
/*co-efficients of continuos numeric variables.*/

/*Note:Values of the correlation co-efficient are always
b/w -1 & +1*/

/*Syntax:*/
Proc corr data=dsetname options;
run;

data Fitness; 
      input Age Weight Oxygen RunTime @@; 
      datalines; 
   44 89.47 44.609 11.37    40 75.07 45.313 10.07 
   44 85.84 54.297  8.65    42 68.15 59.571  8.17 
   38 89.02 49.874   .      47 77.45 44.811 11.63 
   40 75.98 45.681 11.95    43 81.19 49.091 10.85 
   44 81.42 39.442 13.08    38 81.87 60.055  8.63 
   44 73.03 50.541 10.13    45 87.66 37.388 14.03 
   45 66.45 44.754 11.12    47 79.15 47.273 10.60 
   54 83.12 51.855 10.33    49 81.42 49.156  8.95 
   51 69.63 40.836 10.95    51 77.91 46.672 10.00 
   48 91.63 46.774 10.25    49 73.37   .    10.08 
   57 73.37 39.407 12.63    54 79.38 46.080 11.17 
   52 76.32 45.441  9.63    50 70.87 54.625  8.92 
   51 67.25 45.118 11.08    54 91.63 39.203 12.88 
   51 73.71 45.790 10.47    57 59.08 50.545  9.93 
   49 76.32   .      .      48 61.24 47.920 11.50 
   52 82.78 47.467 10.50 
   ; 
   run;
 
proc corr data=Fitness;
run; 

proc corr data=Fitness pearson;
var Weight Oxygen;
run; 

proc corr data=Fitness spearman;
var Weight Oxygen;
run; 

proc corr data=Fitness kendall;
var Weight Oxygen;
run; 

proc corr data=Fitness hoeffding;
var Weight Oxygen;
run; 

proc corr data=Fitness pearson spearman kendall hoeffding;
var Weight Oxygen;
run; 

/*NOSIMPLE: Suppress priniting simple descritive 
statistics for each variable*/
proc corr data=Fitness nosimple;
var Weight Oxygen;
run;

proc corr data=Fitness noprint outs=tt outh=tt1 out=t;
var Weight Oxygen;
run;  

/*NOMISS:Excludes observations with missing analysis
values from the analysis*/
proc corr data=Fitness nomiss;
var Weight Oxygen runtime;
run;  

/*OUTH=Specifies the output data set with Hoeffding’s $D$ statistics*/
/*OUTK=Specifies the output data set with Kendall correlation statistics*/
/*OUTP=Specifies the output data set with Pearson correlation statistics*/
/*OUTS=Specifies the output data set with Spearman correlation statistics*/

*************************;
/*PROC REG*/
************************;
/*The Reg procedure fits least-squares estimates to
linear regression model.*/
/**/
/*Reg procedure is required only statements. Must start
with PROC Reg & Model statement.*/

/*Syntax: */
Proc reg options;
by var;
model dependent=independent;
plot yvariable*xvariable;
run;

/*Model:specifies the dependent and independent variables*/
/*in the regression model, requests a model selection*/
/*method, displays predicted values, and provides details */
/*on the estimates (according to which options are selected).*/
/**/
/*BY:specifies variables to define subgroups for the 
analysis.*/
/*Plot: generates scatter plots.*/

proc sort data=sashelp.class out=class;by age;
run;

proc reg data=class;
by age;
model age=weight;
run;

proc reg data=class;
/*by age;*/
model age=weight;
plot age*weight;
run;

/*PROC ANOVA*/
/*The ANOVA procedure performs analysis of variance (ANOVA)
for balanced data from a wide variety of experimental
designs.*/

/*Designed for Balance data: Data where there are equal
no.of obervation in each classification*/

/*ANOVA procedure have required two statements class & MOdel*/

/*Syntax:*/

PROC ANOVA data=dsetname;
class variable;
model dependent=independent;
run;

/*Class: declares classification variables.*/
/*Model: defines the model to be fit*/

/*Note: Class stmt comes before the model statement and
define the classification variable for analysis of variance.*/

/*Model stmt defines the dependent variable and effects.
Effect should be the classification variable.*/

data Clover; 
   input Strain $ Nitrogen @@; 
   datalines; 
3DOK1  19.4 3DOK1  32.6 3DOK1  27.0 3DOK1  32.1 3DOK1  33.0 
3DOK5  17.7 3DOK5  24.8 3DOK5  27.9 3DOK5  25.2 3DOK5  24.3 
3DOK4  17.0 3DOK4  19.4 3DOK4   9.1 3DOK4  11.9 3DOK4  15.8 
3DOK7  20.7 3DOK7  21.0 3DOK7  20.5 3DOK7  18.8 3DOK7  18.6 
3DOK13 14.3 3DOK13 14.4 3DOK13 11.8 3DOK13 11.6 3DOK13 14.2 
COMPOS 17.3 COMPOS 19.4 COMPOS 19.1 COMPOS 16.9 COMPOS 20.8 
; 
run;

/* Analysis where Strain: Treatment Levels, Nitrogen: Response -*/ 
proc anova data = Clover; 
   class strain; 
   model Nitrogen = Strain; 
run; 
quit;


