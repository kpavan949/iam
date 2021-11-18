data one;
input id name $ age sal;
datalines;
100 jagan 34 54000
400 mohan 32 54300
300 vijaya 23 52000
200 kumar 23 60000
;
run;

data two;
input id lname $ dept quali$ sex $;
cards;
400 jagan2 34 mba m
200 mohan2 32 mca m
300 vijaya2 23 btech f
100 kumar2 23 mtech m
;
run;

/*Sorting the id data and keep in ascedning order*/
proc sort data=one out=one_1;
by id;
run;

/*Sorting the id data and keep in ascedning order*/
proc sort data=two out=two_2;
by id;
run;

/*I have club the two tables*/
data new;
merge one_1 two_2;
by id;
run;

/*I have club the two tables*/
proc sql;
create table saipriya as
select * from one full join two on one.id=two.id;
run;



/*I have club the two tables and keep specific vars*/
data new_3(keep=id name sal quali);
merge one_1 two_2;
by id;
run;

/*I have club the two tables*/
/*From one(first) table taking id,name, sal and two(second) table*/
/*taking quali and sex variable*/

proc sql;
create table saipriya_1 as
select one.id, one.name, one.sal, two.quali, two.sex 
	from one full join two 
		on one.id=two.id;
run;


data new_4(keep=id name sex );
merge one_1 two_2;
by id;
run;

proc sql;
create table saipriya_2 as
select one.id, one.name, two.sex
	from one full join two 
		on one.id=two.id;
run;

/*label just give the alias name only*/
data new_5;
set new_3;
label name=employee_name quali=employye_qualification;
run;


data new_6;
set new_5;
/*where employee_name = 'jagan';*/
where name = 'jagan';
run;

/*rename will change the name permanent*/
data new_8;
set new_3;
rename name=employee_name quali=employye_qualification;
run;







