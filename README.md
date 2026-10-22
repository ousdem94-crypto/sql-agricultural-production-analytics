# Analyse de la production agricole et de l’élevage avec SQL

## État du projet

**En cours — Phase 1 : Audit et diagnostic**

Ce projet utilise les données FAOSTAT sur les cultures et les produits de l’élevage, avec un premier périmètre d’analyse centré sur le Mali. Le travail avance progressivement : chaque étape de l’audit est documentée et validée avant de passer à la suivante.

## Objectif métier

Comprendre la structure, la couverture et la fiabilité du jeu de données FAOSTAT sur la production agricole et animale avant de réaliser des analyses métier ciblées sur le Mali.

## Source et structure des données

- Fichier source : `Production_Crops_Livestock_E_All_Data_NOFLAG.csv`
- Base/table actuellement utilisée dans DBeaver et MySQL : `production_crops_livestock_e_all_data_noflag`
- Les dimensions descriptives comprennent `Area`, `Item`, `Element` et `Unit`, ainsi que des colonnes annuelles de `Y1961` à `Y2023`.

Le fichier CSV source n’est pas inclus dans ce dépôt pour le moment.

## Travaux réalisés à ce jour

Premiers contrôles effectués dans DBeaver :

| Contrôle | Résultat |
|---|---:|
| Nombre total de lignes dans la table | 75 000 |
| Nombre de lignes concernant le Mali | 317 |
| Nombre de produits distincts dans l’ensemble de la table | 302 |
| Nombre de produits distincts pour le Mali | 132 |

Une première inspection visuelle a permis d’identifier notamment les catégories suivantes dans `Element` : `Area harvested`, `Yield`, `Production` et `Stocks`, avec différentes unités. Certaines colonnes annuelles contiennent des valeurs `NULL`. Ces observations seront examinées pendant l’audit ; elles ne sont pas encore considérées comme des erreurs.

## Méthode de travail

1. Auditer et diagnostiquer les données brutes.
2. Examiner la qualité des données, la couverture, les valeurs manquantes et les doublons logiques.
3. Vérifier la plausibilité des valeurs des indicateurs en tenant compte des catégories `Element` et des unités `Unit` réellement présentes.
4. Une fois l’audit terminé, définir et réaliser des analyses métier centrées sur le Mali.
5. Documenter progressivement les requêtes, les résultats validés et les limites de l’analyse.

## Structure du dépôt

```text
sql-agricultural-production-analytics/
├── README.md
└── sql/
    └── 01_audit_diagnostic.sql
```

Le script SQL sera complété progressivement, au fur et à mesure que les sections de l’audit seront réalisées et revues ensemble.

## Plan actuel de l’audit

1. Identification et structure de la table
2. Contrôle du nombre de lignes, dont celles du Mali
3. Inspection des premières observations
4. Nombre de produits distincts (`Item`)
5. Nombre de zones distinctes (`Area`)
6. Nombre de codes de zone distincts (`Area Code`)
7. Nombre de codes M49 de zone distincts (`Area Code (M49)`)
8. Nombre de codes de produits distincts (`Item Code`)
9. Nombre de codes CPC de produits distincts (`Item Code (CPC)`)
10. Nombre de codes d’éléments distincts (`Element Code`)
11. Nombre d’éléments distincts (`Element`)
12. Nombre d’unités distinctes (`Unit`)
13. Période couverte par les données
14. Nombre d’années distinctes
15. Recherche des doublons logiques
16. Recherche des valeurs `NULL`
17. Recherche des valeurs vides
18. Contrôle des valeurs minimales et maximales des superficies récoltées
19. Contrôle des valeurs minimales et maximales des rendements
20. Contrôle des valeurs minimales et maximales des productions
21. Contrôle des valeurs minimales et maximales des stocks

Certains contrôles pourront être ajustés après confirmation des catégories d’indicateurs et des unités présentes dans la table importée. Le projet reste dans la phase d’audit et de diagnostic : l’analyse exploratoire des données (EDA) n’a pas encore commencé.

## Outils utilisés

- MySQL
- DBeaver
- GitHub

## Remarques

Les résultats présentés ici correspondent à la base de données locale et aux contrôles effectués jusqu’à présent. Ils seront mis à jour si des vérifications ultérieures modifient les chiffres ou leur interprétation.
