
*N:\ACT3035\data;
libname cours11 "C:\Users\ec291358\Desktop\ACT3035_H19\data-master";
proc sql;
	create table cours11.sin_alar_prov as
	select 	a.province, 
			b.presence_alarme,
			sum(c.nbsin)as nbsinTot
	from 	cours11.Donnes_demo as a, 
			cours11.Cars_info as b,
			cours11.Police_assurance as c
	where 	a.numeropol=b.numeropol and a.numeropol=c.numeropol
	group by a.province, b.presence_alarme
	; 
quit;



libname cours11 "N:\ACT3035\data";
proc sql;
	create table sin_alar_prov as
	select 	a.province, 
			b.presence_alarme,
			sum(c.nbsin)as nbsinTot
	from 	cours11.Donnes_demo as a, 
			cours11.Cars_info as b,
			cours11.Police_assurance as c
	where 	a.numeropol=b.numeropol and a.numeropol=c.numeropol
	group by a.province, b.presence_alarme
	; 
	select nbsinTot from sin_alar_prov;
quit;

proc sql;
create table sin_alar_prov2 as 
select * from sin_alar_prov;
quit

proc print data=sin_alar_prov;
run;


*creer une table avec un like;
proc sql;
	create table sin_alar_prov3 like sin_alar_prov;
	insert into sin_alar_prov3 
		select *
		from sin_alar_prov
	;
quit;

proc sql;
	update sin_alar_prov3
		set nbsinTot=nbsinTot*1.05
		where presence_alarme neq 0
	;
	select * from sin_alar_prov3;
quit;


proc sql;
	create table sin_alar_qc like sin_alar_prov;
	insert into sin_alar_qc
	select * from sin_alar_prov
		where province like "Q%"
	;
quit;


proc sql;
	delete 
	from sin_alar_prov
	where province like "Q%" 
	;
quit;


proc sql;
	alter table sin_alar_prov 
	add nbsinTotreduit num format=dollar10.4
	;
	update sin_alar_prov 
	set nbsinTotreduit=nbsinTot/1.0234587
	; 
quit;


proc sql;
	alter table sin_alar_prov
	modify  nbsinTotreduit format=dollar10.2
	;
quit;

proc sql;
	alter table sin_alar_prov
	 	drop nbsinTotreduit
	;
quit;



proc sql;
	drop table sin_alar_qc;
quit;	


data loop;
	do j=5 to 15 by 2;
		x=j+1;
		y=x**2;

	end;
run;

data bern (drop=i);
	call streaminit(123);
	p=.5;
	do i=1 to 10;
		x=RAND("BERNOULLI", p);
		output;
	end;
run;


data normale (drop=i);
	call streaminit(123);
	do i=1 to 1000;
		y=rand("NORMAL", 10, 2);
		y_pdf=PDF("NORMAL",y, 10, 2);
	output;
	end;	
run;	

proc sgplot data=normale;
	scatter x=y y=y_pdf;
run;


%macro genNormale(nomTable, nombre, mu, sigma, seed=123);
data &nomTable (drop=i);
	call streaminit(&seed);
	do i=1 to &nombre;
		y=rand("NORMAL", &mu, &sigma);
		y_pdf=PDF("NORMAL",y, &mu, &sigma);
	output;
	end;	
run;	

proc sgplot data=&nomTable;
	scatter x=y y=y_pdf;
run;
%mend genNormale;

%genNormale(normalMacro, 123,1500, 9, 3);

%genNormale(nomTable=normalMacro2,nombre=1800, mu=5, sigma=3);



