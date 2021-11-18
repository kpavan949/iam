
%macro impo(dset,sheet);
		proc import out=&dset.
		datafile='F:\Jagan Sas_class2\outputs\ans.xls'
		dbms=xls replace;
		sheet="&sheet.";
		run;
%mend;
