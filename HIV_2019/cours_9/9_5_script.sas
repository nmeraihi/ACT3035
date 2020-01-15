data demog_saisie;
	input Gender $ Age Height Weight;
	datalines;
		F 50 68 155
		F 23 60 101
		M 65 72 220
		F 35 65 133
		M 15 71 166
	;
run;

title "données demo";
proc print data=demog_saisie;
run;



*lecture en dsd;

/*mnlkqh
dflq
lkh*/

data demog_saisie_2;
infile datalines dsd;
	input Gender $ Age Height Weight;
	datalines ;
		"F",50,68,155
		"F",23,60,101
	;
run;

title "données demo";
proc print data=demog_saisie;
run;


data baque;
	infile "C:\Users\ec291358\Desktop\ACT3035_H19\data-master\bank.txt";
	input
		id $ 1-3
		DOB $ 4-13
		sexe $ 14
		Balance 15-30
	;	
run;


filename emprunt "C:\Users\ec291358\Desktop\
ACT3035_H19\data-master\emprunt_bancaire_2.csv";
proc import datafile=emprunt
	dbms=csv
	out=loan;
run;


title "changement de label";
proc print data=loan label;
	label Gender="sexe";
	format Principal dollar12.;
run;

/*Lib perma*/

filename emprunt "C:\Users\ec291358\Desktop\
ACT3035_H19\data-master\emprunt_bancaire.csv";

libname empr "C:\Users\ec291358\Desktop\ACT3035_H19\data-master";
proc import datafile=emprunt
	dbms=csv
	out=empr.loan;
run;


data empr.loan_mod;
	set empr.loan;
	where Gender like "%female%";
	keep Principal Age;
run;


data empr.loan_mod;
	set empr.loan;
	where Gender like "%female%";
	drop Loan_ID;
	if age<40;
run;


