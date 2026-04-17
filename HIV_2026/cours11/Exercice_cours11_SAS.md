**Les exercices se protent sur la base de données CARS dans la bibliothèque SASHELP**

**Utilisez proc SQL afin de répondre aux questions** 





Exercice 1 :



A) Sélectionnez les colonnes Make (Marque), Model (Modèle) et MSRP (Prix de vente).



B) Renommez MSRP en Prix\_Catalogue.



C) Appliquez le format DOLLAR12.2 à la colonne du prix.



D) Limitez l'affichage aux 15 premières observations.







Exercice 2 :



Filtre tous les véhicules qui répondent aux critères suivants :



La marque (Make) est soit 'Audi' ou 'BMW'.



Le type de véhicule (Type) n'est pas un 'Sedan'.



Le modèle (Model) contient la lettre 'z' ou 'Z' (Indice : utilise LIKE).



Affichez toutes les colonnes.







Exercice 3 : 



Calculez des statistiques par Origine (Origin) :



Affichez la colonne Origin.



Calculez le nombre de voitures par origine (nommez-la Nombre\_Voitures).



Calculez la puissance moyenne (Horsepower) par origine (nomme-la Puissance\_Moyenne).



Créez une nouvelle colonne Taxe\_Luxe qui correspond à 10% du prix (MSRP \* 0.10).









Exercice 4 : 



Calculez la consommation moyenne en ville (MPG\_City) par marque (Make).



Filtrez pour ne garder que les marques qui ont une consommation moyenne supérieure à 20.



Triez le résultat par la consommation moyenne la plus élevée en premier.









Exercice 5 :



Créez une table dans la bibliothèque WORK nommée CARS\_CATEGORIE qui contient :



Le modèle et la puissance (Horsepower).



Une nouvelle variable Performance basée sur la puissance :



'Puissante' si Horsepower > 300



'Standard' si Horsepower est entre 150 et 300



'Economique' sinon.



Triez par Horsepower décroissant.

