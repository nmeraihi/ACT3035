libname cours10 "N:\ACT3035\data";

proc sql outobs=10;
	select * 
	from cours10.Eq_2;
quit;

/*en R*/
*head(table,10);
/*en Python*/
*table.head(10);

proc sql outobs=10;
	select 	type_prof as t_pr,
			type_territoire as t_tr
	from cours10.Eq_2;
quit;



proc sql outobs=10;
	select 	type_territoire, 
			sum(cout1) as sm_cout format=dollar15.2
	from cours10.Eq_2
	where cout1 > 1000 /*franchise*/ 
	group by type_territoire
	order by sm_cout
	;
quit;

/*
proc sql outobs=10;
	select 	type_territoire,
			sum(cout1) as sm_cout format=dollar15.2
	from cours10.Eq_2
	where cout1 > 1000 
	group by type_territoire 
	having type_prof in("Actuaire", "Infirmière")
	order by sm_cout
	;
quit;*/


proc sql outobs=10;
	select 	type_prof,
			sum(cout1) as sm_cout format=dollar15.2
	from cours10.Eq_2
	where cout1 > 1000 
	group by type_prof 
	having type_prof in("Actuaire", "Infirmière")
	order by sm_cout
	;
quit;

proc sql;
	select distinct type_prof,
					type_territoire
	from cours10.Eq_2
	order by type_prof, type_territoire
	;
quit;



proc sql outobs=10;
	select type_prof,
			cout1 as cout1_ann1,
			cout1 * 1.02 as cout1_ann2
	from cours10.Eq_2
	;
quit;


proc sql outobs=10;
	select type_prof,
			cout1 as cout1_ann1,
			cout1_ann1 * 1.02 as cout1_ann2,
			calculated cout1_ann2 *1.02 as cout1_ann3
	from cours10.Eq_2
	;
quit;

proc contents data=cours10.Eq_2;
run;


proc sql outobs=10;
	select a.name, sum(b.nbsin) as sinTot
	from  cours10.Donnes_demo as a left join cours10.Police_assurance as b
	on a.numeropol=b.numeropol
	group by a.name
	order by sinTot desc
	; 
quit;

proc sql;
create table cours10.sin_alar_prov as
	select 	a.province, 
			b.presence_alarme,
			sum(c.nbsin) as nbsinTot
	from 	cours10.Donnes_demo as a,
			cours10.Cars_info as b,
			cours10.Police_assurance as c	
	/*where 	a.numeropol=b.numeropol=c.numeropol*/
	where 	a.numeropol=b.numeropol and a.numeropol=c.numeropol
	group by a.province, b.presence_alarme
	;
quit;



proc sql outobs=10;
	select nbsinTot from
	(select 	a.province, 
			b.presence_alarme,
			sum(c.nbsin) as nbsinTot
	from 	cours10.Donnes_demo as a,
			cours10.Cars_info as b,
			cours10.Police_assurance as c	
	/*where 	a.numeropol=b.numeropol=c.numeropol*/
	where 	a.numeropol=b.numeropol and a.numeropol=c.numeropol
	group by a.province, b.presence_alarme
	);
quit;















