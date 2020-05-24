/* Lecture 6 : Dependent Samples 코드 
one-tail test, 1% 유의수준 */

data alcohol;
input alcohol noalcohol;
cards;
46 33
51 41
41 29
32 18
37 26
48 40
37 23
36 25
38 28
30 21
42 31
43 36
53 39
38 27
47 38
36 19
33 22
36 24
42 33
54 42
36 27
48 35
46 34
33 22
48 36
54 39
43 29
50 37
;

proc print data=alcohol;
run;

proc ttest data=alcohol alpha=0.01;
paired alcohol*noalcohol;
run;

/* Lecture 7 */
data example1;
input gender$ age super;
cards;
M 23 40   
M 64 88   
M 66 110   
M 31 86   
M 55 137
M 48 78   
M 58 111   
M 31 88   
M 27 80   
M 25 86
M 20 80   
M 32 47   
M 63 106   
M 23 65   
M 62 74
M 43 66   
M 43 79   
M 36 58   
M 67 123   
M 27 87
M 29 88   
M 48 90   
M 63 56   
M 27 73   
M 19 112
M 59 110   
M 65 118   
M 26 52   
M 53 106   
M 42 67
M 60 57   
F 30 66   
F 25 69   
F 40 65   
F 38 52
F 57 84   
F 33 86   
F 23 35   
F 42 116   
F 49 76
F 35 55   
F 49 73   
F 44 89   
F 50 127   
F 60 87
F 63 142   
F 47 77   
F 23 76   
F 27 58   
F 36 91
F 48 107   
F 23 98   
F 74 128   
F 44 84   
F 56 146
F 53 75   
F 37 120   
F 41 80   
F 41 82   
F 57 123
;
run;

proc print data=example1;
run;

proc freq data=example1 order=data;
exact binomial;
tables gender/alpha=0.05;
run;

proc freq data=example1;
exact binomial;
tables gender/alpha=0.05;
run;

data example2;
input party $ count;
cards;
Repub 407
Demo 358
;
run;

proc freq data=example2 order=data;
weight count;
exact binomial;
tables party/alpha=0.05;
run;


data example3;
input viewers $ count;
cards;
bigbang 275
other 4725
run;

proc freq data=example3 order=data;
weight count;
exact binomial;
tables viewers/alpha=0.05;
run;

data twosample1;
input gender $ yesno $ count @@;
cards;
male yes 110 male no 140
female yes 104 female no 96
;
run;

proc freq data=twosample1 order=data;
weight count;
tables gender*yesno/chisq rdiff relrisk;
run;


data twosample2;
input supermarket $ sale $ count @@;
cards;
super1 yes 180 super1 no 724
super2 yes 155 super2 no 883
;
run;

proc freq data=twosample2 order=data;
weight count;
tables supermarket*sale/chisq  rdiff relrisk; 
run;

/* Lecture8 sas class */

data onesample;
input opinions $ number @@;
cards;
favor 168 oppose 32
;
proc freq data=onesample;
table opinions/chisq testp=(90 10);
weight number;
run;


data twosample;
input faculty $ policy $ f @@;
cards;
tenured support 86 tenured nosupport 19
nonten support 82 nonten nosupport 13
;
proc freq data=twosample;
table faculty*policy/chisq expected;
weight f;
run;

data twosample2;
input faculty $ benefit $ f @@;
cards;
tenured retirement 68 tenured disability 17 tenured hospital 8 tenured medical 12
nonten retirement 22 nonten disability 9 nonten hospital 44 nonten medical 20
;
proc freq data=twosample2;
table faculty*benefit/chisq expected;
weight f;
run;


Data dependent;
input pre $ post $ F @@;
cards;
unfav fav 14 fav fav 6
unfav unfav 16 fav unfav 2
;
proc freq data=dependent;
weight F;
Table pre*post;
Exact Mcnem;
run;


data exam1;
input gender $ major $ f @@;
cards;
male A 75 male B 46 male C 23
female A 30 female B 32 female C 24
;

proc freq data=exam1;
table gender*major/chisq expected;
weight f;
run;

data lec8;
input rank $ benefit $ f @@;
cards;
professor retirement 35 professor disability 8 professor hospitalization 10 professor medical 10
associate retirement 30 associate disability 8 associate hospitalization 20 associate medical 8
assistant retirement 15 assistant disability 5 assistant hospitalization 15 assistant medical 8
instructor retirement 10 instructor disability 5 instructor hospitalization 7 instructor medical 6
;

proc freq data=lec8;
table rank*benefit/chisq expected;
weight f;
run;

data lec8_2;
input method $ num $ f @@;
cards;
1 A 15 1 B 21 1 C 45 1 D 13
2 A 26 2 B 31 2 C 34 2 D 5
3 A 33 3 B 17 3 C 49 3 D 20
;

proc freq data=lec8_2;
table method*num/chisq expected;
weight f;
run;

data lec8_3;
input med $ num $ f @@;
cards;
med 1 10 med 2 14
nomed 1 20 nomed 2 7
;

proc freq data=lec8_3;
table med*num/chisq expected;
weight f;
run;

data lec8_4;
input maketing $ num $ f @@;
cards;
maket A 0.45 maket B 0.4 maket C 0.15
nomaket A 0.51 nomaket B 0.41 nomaket C 0.08
;

proc freq data=lec8_4;
table maketing*num/chisq expected;
weight f;
run;

data lec8_4;
input maketing $ number @@;
cards;
A 102 B 82 O 16
;

proc freq data=lec8_4;
table maketing/chisq testp=(45 40 15);
weight number;
run;

data lec8_5;
input rank $ mba $ f @@;
cards;
A 1 31 A 2 13 A 3 16
B 1 8 B 2 16 B 3 7
C 1 12 C 2 10 C 3 17
D 1 10 D 2 5 D 3 7
;
proc freq data=lec8_5;
table rank*mba/chisq expected;
weight f;
run;

Data lec8_6;
input pre $ post $ F @@;
cards;
yes yes 7 yes no 37
no yes 26 no no 15
;

proc freq data=lec8_6;
weight F;
Table pre*post;
Exact Mcnem;
run;


/* Lecture 9-10-11 SAS */

proc import datafile="/folders/myfolders/lec9-corr.csv" out=corr dbms=csv replace;
run;
proc print data=corr;
run;

proc corr data=corr;
run;

proc corr data=corr spearman;
var xrank yrank;
run;

data sample;
input subject math emath @@;
cards;
1  39  65  2  43  78  3  20  51  4  64  81
5  57  90  6  47  85  7  28  75  8  75  98
9  34  56  10  52  76
;
run;
proc plot; plot emath*math;
run;
proc reg data=sample;
model emath=math;
output out=o1 p=predmath r=residual;
run;

proc plot; plot predmath*math;
run;

proc print data=o1;
run;

proc corr data=o1;
var math emath;
run;

proc corr data=o1;
var emath predmath;
run;

proc reg data=o1;
model emath=math/STB;
run;

proc reg data=o1;
model emath=math/CLB;
run;

data o2;
set o1;
tenmath=10*math;
tenemath=10*emath;
run;

proc reg data=o2;
model emath=tenmath;
run;

proc reg data=o2;
model tenemath=math;
run;

proc reg data=o2;
model tenemath=tenmath;
run;



