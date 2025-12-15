# ACT3035A25 - Travail Pratique 

## Informations générales

| Élément | Description |
|---------|-------------|
| **Cours** | ACT3035 - laboratoire d'actuariat |
| **Session** | Automne 2025 |
| **Type de travail** | Individuel |
| **Durée** | 2 semaines |
| **Date de remise** | 29 Déc 2025 à 12:00 PM |
| **Pondération** | 15 |

---

## Objectif général

Ce travail pratique vise à réaliser un projet complet de science des données actuarielles, de l'acquisition des données jusqu'à la modélisation et l'interprétation des résultats. Ce projet simule une situation professionnelle réelle où l'étudiant/actuaire doit identifier, collecter, traiter et analyser des données afin de construire des modèles prédictifs pertinents.

---

## Avertissement important concernant l'intégrité académique

**L'utilisation d'outils d'intelligence artificielle générative (ChatGPT, GitHub Copilot, Claude, Gemini, etc.) est STRICTEMENT INTERDITE pour ce travail.**

L'historique Git de votre dépôt sera utilisé pour évaluer l'intégrité de votre travail. Tout indice d'utilisation d'IA générative entraînera une note de zéro et un signalement.

---

## Exigence fondamentale : Utilisation de Git

### Pourquoi Git est obligatoire

Git n'est pas seulement un outil de gestion de version pour ce projet. **C'est votre preuve de travail.**

L'historique de vos commits est la seule façon pour moi de vérifier que :
- Vous avez effectué le travail vous-même
- Vous n'avez pas utilisé d'IA
- Votre progression est authentique

### Règles impératives

1. **Avant de commencer quoi que ce soit**, créez votre dépôt GitHub et ajoutez-moi comme collaborateur (identifiant : `nmeraihi`). Comment on fait ça? ça fait parti du travail de faire de recherches et trouver la réponse, pour ce genre recherches "comment je fais pour ajouter un collaborateur dans GitHub", aucun problème d'utiliser l'IA.

2. **Chaque décision, chaque étape doit faire l'objet d'un commit**
   - Choix du jeu de données : commit
   - Téléchargement des données : commit
   - Première exploration : commit
   - Ajout de telle ou telle ligne de code...: commit
   - Nettoyage d'une variable : commit
   - Création d'un graphique : commit
   - Modification d'un modèle : commit

3. **Les commits doivent être fréquents et incrémentaux**
   - Un commit par tâche logique accomplie
   - Des messages de commit descriptifs en français
   - Évitez les commits massifs regroupant plusieurs heures de travail

4. **Les erreurs sont acceptées et encouragées**
   - Commettez vos erreurs, puis commettez vos corrections
   - Cela démontre un processus d'apprentissage authentique
   - Un historique trop "propre" est suspect

### Sans historique Git, aucun point ne sera attribué

**Je le répète : si votre dépôt ne contient pas un historique Git démontrant clairement votre progression du début à la fin, vous recevrez une note de zéro, peu importe la qualité du travail final.**

Par exemple (juste un exemple), un projet parfait soumis en 10 commits recevra zéro.
Un projet imparfait avec 100-1000 commits démontrant votre cheminement sera évalué.

---

## Description du travail/projet

### Étape 1 : Acquisition des données

**Aucun jeu de données ne vous est fourni.**

Vous devez trouver vous-même un jeu de données réel et publiquement accessible sur un sujet qui vous intéresse. Ce jeu de données doit :
- Être pertinent pour une analyse actuarielle
- Contenir suffisamment d'observations (minimum recommandé : 500)
- Contenir des variables permettant une modélisation intéressante
- Être accessible publiquement

Exemples de sources acceptables :
- Portails de données ouvertes gouvernementales (QC, Féderal, municipal ...etc)
- Kaggle (jeux de données publics uniquement)
- UCI Machine Learning Repository
- Données d'organismes internationaux (OMS, Banque mondiale, etc.)
- Données d'assureurs ou de régulateurs publiées publiquement

Dans votre README et votre documentation, vous devez expliquer :
- D'où proviennent les données
- Comment vous y avez accédé (URL, API, téléchargement manuel)
- Pourquoi ces données sont pertinentes pour une analyse actuarielle

### Étape 2 : Processus ETL complet

Vous devez réaliser un processus ETL (Extract, Transform, Load) rigoureux :

**Extraction**
- Documenter la méthode d'acquisition
- Conserver les données brutes dans leur format original

**Transformation**
- Nettoyage des valeurs manquantes (avec justification de la méthode)
- Traitement des valeurs aberrantes
- Transformation des variables si nécessaire
- Création de nouvelles variables dérivées si pertinent
- Encodage des variables catégorielles

**Chargement**
- Préparation des données pour l'analyse
- Séparation éventuelle en ensembles d'entraînement et de test

### Étape 3 : Analyse exploratoire des données

Vous devez produire une analyse exploratoire complète incluant :

**Statistiques descriptives**
- Mesures de tendance centrale et de dispersion
- Analyse des distributions
- Tableaux de fréquences pour les variables catégorielles

**Visualisations**
- Histogrammes et graphiques de densité
- Boîtes à moustaches
- Graphiques de corrélation
- Graphiques appropriés selon le type de données

**Discussion**
- Qualité des données
- Limites identifiées
- Problèmes potentiels pour la modélisation

### Étape 4 : Définition du problème actuariel

Vous devez clairement définir :
- La variable réponse à prédire
- La justification de ce choix d'un point de vue actuariel
- Les variables explicatives retenues et pourquoi
- L'objectif de la modélisation (tarification, provisionnement, sélection des risques, etc.)

### Étape 5 : Modélisation actuarielle

Vous devez construire **au minimum deux modèles actuariels** parmi les suivants :
- Régression logistique
- Modèle linéaire généralisé (GLM)
- Régression de Poisson
- Modèle binomial négatif
- Régression Gamma
- Autres modèles que vous pensez pertinent

Pour chaque modèle, vous devez :
- Justifier le choix du modèle (pourquoi je pense que ce modèle est idéal) 
- Présenter les résultats d'estimation
- Évaluer la qualité d'ajustement
- Interpréter les coefficients

### Étape 6 : Comparaison et interprétation

Vous devez :
- Comparer les modèles entre eux
- Identifier le modèle le plus approprié et justifier ce choix
- Interpréter les résultats d'un point de vue actuariel
- Discuter des implications pratiques

### Étape 7 : Discussion des limites

Vous devez obligatoirement inclure une section discutant :
- Les limites de votre analyse
- Les biais potentiels des données
- Les améliorations possibles

---

## Langages de programmation

Vous pouvez utiliser **R** et/ou **SAS** pour ce projet.

Exigences :
- Le code doit être reproductible
- Les scripts doivent être clairement commentés
- Les dépendances doivent être documentées
- Pour R : inclure un fichier listant les packages utilisés
- Pour SAS : inclure les instructions pour accéder aux données

---

## Structure du dépôt

Votre dépôt GitHub doit respecter la structure suivante :

```
nom-du-projet/
│
├── README.md                 # Description du projet (ce fichier)
│
├── data/
│   ├── raw/                  # Données brutes (non modifiées)
│   └── processed/            # Données nettoyées et transformées
│
├── src/
│   ├── 01_acquisition.R      # Script d'acquisition des données
│   ├── 02_nettoyage.R        # Script de nettoyage ETL
│   ├── 03_exploration.R      # Script d'analyse exploratoire
│   ├── 04_modelisation.R     # Script de modélisation
│   └── 05_comparaison.R      # Script de comparaison des modèles
│
├── docs/
│   └── rapport.md           # Rapport final
│
└── results/
    ├── figures/              # Graphiques générés
    └── tables/               # Tableaux de résultats
```

Vous pouvez adapter cette structure selon vos besoins, mais elle doit rester logique et organisée.

---

## Livrables

1. **Dépôt GitHub complet**
   - Historique Git démontrant votre progression
   - Code source organisé et commenté
   - Données (ou instructions pour les obtenir si trop volumineuses)

2. **README.md du projet**
   - Description claire du projet
   - Instructions de reproduction
   - Source des données
   - Résumé des résultats

3. **Code reproductible**
   - Scripts exécutables sans erreur
   - Commentaires explicatifs
   - Documentation des dépendances

4. **Résultats**
   - Visualisations
   - Tableaux de résultats
   - Interprétations

---

## Critères d'évaluation

| Critère | Pondération |
|---------|-------------|
| Acquisition et justification des données | 10% |
| Qualité du processus ETL | 15% |
| Analyse exploratoire des données | 15% |
| Choix et justification des modèles actuariels | 20% |
| Interprétation des résultats | 15% |
| Qualité et reproductibilité du code | 10% |
| Utilisation de Git et transparence | 10% |
| Clarté et professionnalisme de la communication | 5% |

### Détail des critères

**Acquisition et justification des données (10%)**
- Pertinence du jeu de données choisi
- Clarté de la documentation sur la source
- Justification du choix d'un point de vue actuariel

**Qualité du processus ETL (15%)**
- Rigueur du nettoyage des données
- Pertinence des transformations
- Documentation des décisions prises

**Analyse exploratoire des données (15%)**
- Exhaustivité de l'analyse descriptive
- Qualité et pertinence des visualisations
- Discussion de la qualité des données

**Choix et justification des modèles actuariels (20%)**
- Adéquation des modèles choisis avec le problème
- Justification théorique des choix
- Qualité technique de l'implémentation

**Interprétation des résultats (15%)**
- Comparaison rigoureuse des modèles
- Pertinence de l'interprétation actuarielle
- Discussion des implications pratiques

**Qualité et reproductibilité du code (10%)**
- Code clair et bien structuré
- Commentaires pertinents
- Reproductibilité sans erreur

**Utilisation de Git et transparence (10%)**
- Fréquence et régularité des commits
- Messages de commit descriptifs
- Historique démontrant une progression authentique

**Clarté et professionnalisme de la communication (5%)**
- Qualité de la rédaction
- Organisation du dépôt
- Professionnalisme général

---

## Procédure de soumission

1. **Immédiatement** : Créez votre dépôt GitHub et ajoutez `nmeraihi` comme collaborateur
2. **Tout au long du projet** : Committez régulièrement votre progression
3. **À la date de remise** : Assurez-vous que votre dépôt est à jour et que le README est complet
4. **Soumettez** : Me soumettre l'URL de votre dépôt GitHub par courriel avec votre code permanent au plus tard le 29 déc 2025 à 12:00 PM.

---

## Rappels importants

- **Commencez par Git** : Votre premier commit devrait être la création du README avec la description de votre projet envisagé
- **Committez chaque décision** : Le choix de votre jeu de données doit être documenté dans un commit
- **N'attendez pas la fin** : Un projet soumis en quelques commits massifs sera pénalisé sévèrement
- **Les erreurs sont normales** : Committez-les, puis committez les corrections
- **Pas d'IA** : L'utilisation d'outils d'IA générative pour créer le code ou le projet est interdite et ça va se voir

---

## Questions et support

Pour toute question concernant ce travail pratique :
- Consultez d'abord ce README attentivement
- Faites vos recherches, je ne réponds à aucune question sur le TP

---

## Ressources utiles

**Portails de données ouvertes**
- Données Québec : https://www.donneesquebec.ca
- Statistique Canada : https://www.statcan.gc.ca
- Kaggle : https://www.kaggle.com/datasets
- UCI ML Repository : https://archive.ics.uci.edu/ml

---

*Ce travail pratique est une occasion de démontrer vos compétences de vous débrouiller d'abord. Abordez-le avec rigueur et professionnalisme.*

