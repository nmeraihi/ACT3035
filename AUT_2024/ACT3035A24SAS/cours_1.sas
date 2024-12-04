/* Bonjour act3035 */
/* commentaire de Sas */

/* Je consulte mes données à partitr d'un dossier 
partageable avec toute le rste de la classe qui se trouvera
dans une sahered biblioth`que que je peux SEULEMENT consulter*/
libname assu "/home/nmeraihi1/my_content/data";

/* Dans la ligne ci-dessous je créé mes données une une biblioth`que
qui m'appartient juste à moi tout seul que j'ai appelé mybib*/
libname mybib "/home/nmeraihi1/notes_cours";


Data mybib.cours1;
	set assu.eq_2;
	keep numeropol type_prof alimentation cout1 cout2;
run;

proc print data=mybib.cours1 (FIRSTOBS=2 OBS=10);
run;

Data mybib.cours1;
	set assu.eq_2;
	WHERE type_prof like "In%";
	proc print data=mybib.cours1 (FIRSTOBS=2 OBS=10);
run;


/* On veut les Hockeyeur dont l'alimentation commence par Vé */

Data mybib.cours1;
	set assu.eq_2;
	WHERE type_prof="Hockeyeur"
	and alimentation like "Vé%"
	;
	proc print data=mybib.cours1 (FIRSTOBS=2 OBS=10);
run;


Data mybib.cours1;
	set assu.eq_2;
/* 	cout_total=cout1+cout2+cout3+cout4+cout5+cout6+cout7; */
	cout_total=sum(cout1,cout2,cout3,cout4,cout5,cout6,cout7);
	WHERE type_prof="Hockeyeur"
	and alimentation like "Vé%";
	if cout_total>1000;
	keep numeropol type_prof alimentation cout1 cout_total
/* on aurait pu utiliser la fonction drop pour éliminer l'affichage
des variables qu'on ne veut PAS afficher	 */
	;
	proc print data=mybib.cours1; (FIRSTOBS=2 OBS=10);
	format cout_total dollar12.2;
run;


*ceci est un commetaire;

alors











