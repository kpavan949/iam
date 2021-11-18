data a;
input m1 $ m2 m3 m4;
cards;
10 20 30 50
20 30 40 60
;
run;

data a1;
input m1 m2 m3;
cards;
10 30 10
50 40 22
;
run;

data c;
merge a a1;
run;

data d;
merge a a1;
by m1;
run;

