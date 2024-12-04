libname coursdeu '/home/nmeraihi1/my_content/data';
proc sql;
/* On commence par la consultation des données avec 'select'	 */
	select 	age,
			education
	from coursdeu.loan;
quit;


proc sql;
/* On commence par la consultation des données avec 'select'	 */
	select *
/* avec l'étoile plus haut on sélectionne toutes les variables (colonnes)	 */
	from coursdeu.loan;
quit;


proc sql outobs=10;
	select * from coursdeu.assu_4;	
quit;

proc sql outobs=100;
	select 	numeropol,
			langue,
			type_prof,
			type_territoire,
			sum(cout1, cout2, cout3, cout4, cout5, cout6, cout7) 
			as coutTotal format =dollar15.2,
			calculated coutTotal*(1.02**19) 
			as coutTotalInflation format =dollar15.2,
			2003-annee_permis as experience_conduite,
				case
					when calculated experience_conduite<5 then "Jeunes conducteurs"
					when calculated experience_conduite ge 5 and calculated experience_conduite <20 then "Moyen conducteurs"
					when calculated experience_conduite ge 20 then "conducteurs experimentes"
				end as cat_exp_permis			
	from coursdeu.eq_2
	order by experience_conduite desc, coutTotal	
	;	
quit;


/* faites attention create table et outobs */
/* proc sql outobs=100; */
proc sql;
	create table cours2 as
			select
			numeropol,
			langue,
			type_prof,
			type_territoire,
			sum(cout1, cout2, cout3, cout4, cout5, cout6, cout7) 
			as coutTotal format =dollar15.2,
			calculated coutTotal*(1.02**19) 
			as coutTotalInflation format =dollar15.2,
			2003-annee_permis as experience_conduite,
				case
					when calculated experience_conduite<5 then "Jeunes conducteurs"
					when calculated experience_conduite ge 5 and calculated experience_conduite <20 then "Moyen conducteurs"
					when calculated experience_conduite ge 20 then "conducteurs experimentes"
				end as cat_exp_permis			
	from coursdeu.eq_2
	order by experience_conduite desc, coutTotal	
	;	
quit;


proc sql;
	select	cat_exp_permis,
			type_prof,
			sum(coutTotalInflation) as 	coutTotalInflation format =dollar15.2	
/* 	AVG, COUNT, MAX, MIN ...etc comme autres fonctions		 */
	from work.cours2
	group by type_prof, cat_exp_permis
	having type_prof in ("Actuaire", "Infirmière")
	/* where type_prof like "%cien"	 */
	;
quit;


/* Ici pour illuster qu'on peut travailler avec des tables temporaires dans 
la lib work ou faire un select dans un select comme illustré dans le code
ci-dessous */
proc sql;
select * from (
			select
			numeropol,
			langue,
			type_prof,
			type_territoire,
			sum(cout1, cout2, cout3, cout4, cout5, cout6, cout7) 
			as coutTotal format =dollar15.2,
			calculated coutTotal*(1.02**19) 
			as coutTotalInflation format =dollar15.2,
			2003-annee_permis as experience_conduite,
				case
					when calculated experience_conduite<5 then "Jeunes conducteurs"
					when calculated experience_conduite ge 5 and calculated experience_conduite <20 then "Moyen conducteurs"
					when calculated experience_conduite ge 20 then "conducteurs experimentes"
				end as cat_exp_permis			
	from coursdeu.eq_2) as tableTemporaire
	;	
quit;

/* Jointure des deux table de production de pétrol par pays */

proc sql;
	select * from coursdeu.oilprod;
quit;

proc sql;
	select * from coursdeu.oilrsrvs;
quit;

proc sql;
	select 	production.country, 
			production.BarrelsPerDay,
			reserve.Barrels,
			(production.BarrelsPerDay/reserve.Barrels)
			as ratio_pro_reserve_points_pourcen format=percent8.4
			
	from coursdeu.oilprod as production, coursdeu.oilrsrvs as reserve
	where production.country = reserve.country
	/* 	Si on veut ordonner par pays ayant la plus grande réserve */
	order by reserve.Barrels desc
	;
quit;

















