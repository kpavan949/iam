/*MACROS*/

/*MACRO is a stored text that can be set anywhere in sas program. or Stored code*/
/*that can be used repeatedly with macro name*/

/*advantages of Macros*/
1. Reduce the amount of programming needed for repeated tasks.
2. Minimize on typing and execution errors.
3. simplifying the code.
4. Making the variable global.
5. In macors we have only one datatype. IT is character only.

/*MAcro processing-- show the diagram*/

/*MAcro variable can be reference any where in sas program other than in datalines or cards.*/

Macros start with Percent symbol (%)

Macro variable are 2 types.

1. System defined variables(Automatic variables)
2. User defined variables(programmer created).

The values of the macro variable is stored in the macro symbol table for the duration of 
the SAS SEssion. when a sas session starts the sas system automcatically define a several
macro variable. these macro variables are stored in the macro symbol table.


Note: the automatic variables prefix with SYS it is reseverd by the SAS for automactic vars
so we can't create any macro variable start with sys

%Put: Statement instructs the macro processor to write information to the SAS log.

%put _automatic_ --It will display the all automatic variables in log window

USER DEFINE MACRO variables.
global: A macro variable is gloabl if it is defined open code outside or inside a macro.
A gloable macro variable exists for the durationof the SAS session

local: A macro variable is local, it it is defined inside a macro.


RESOVING MACRO VARIABLES
--------------------------
macro variables are resolved by using the & symbol, infront of macro variable.


%put sysdate.;

%put &sysdate.;


Single quotes and souble quotes
-----------------------------
when we want resolving the macro vaiable with in the quotes, we must enclose the string with
double quotes. A macro variable reference enclosed within single quotes, it will not be resolved.

%put 'today date is asdfsdfsdafsdf &sysdate.';

%put "today date is asdfsdfsdafsdf &sysdate.";



