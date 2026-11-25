# Analyse de la production agricole et de l’élevage avec SQL

## État du projet

**En cours — Phase 1 : Audit et diagnostic**

Ce projet exploite les données FAOSTAT sur les cultures et les produits de l’élevage. Le périmètre des futures analyses métier est centré sur le Mali. L’audit est réalisé progressivement : chaque contrôle est conçu, exécuté et interprété avant de passer au suivant.

## Objectif métier

Évaluer la structure, la couverture et la qualité du jeu de données FAOSTAT afin de disposer d’une base suffisamment comprise et contrôlée avant de mener des analyses ciblées sur la production agricole et animale au Mali.

## Source et structure des données

- **Fichier source :** `Production_Crops_Livestock_E_All_Data_NOFLAG.csv`
- **Base/table MySQL :** `production_crops_livestock_e_all_data_noflag`
- **Dimensions descriptives :** `Area`, `Item`, `Element`, `Unit`, ainsi que leurs codes.
- **Colonnes annuelles :** de `Y1961` à `Y2023`, soit une couverture de 1961 à 2023.

Le fichier CSV source n’est pas inclus dans ce dépôt.

## Travaux réalisés — audit des dimensions descriptives

Les contrôles déjà exécutés ont permis d’établir les résultats suivants :

| Contrôle | Résultat |
|---|---:|
| Nombre total de lignes | 75 000 |
| Lignes concernant le Mali | 317 |
| Produits distincts (`Item`) — table complète | 302 |
| Produits distincts (`Item`) — Mali | 132 |
| Zones distinctes (`Area`) | 198 |
| Codes de zone distincts (`Area Code`) | 198 |
| Codes géographiques M49 distincts (`Area Code (M49)`) | 198 |
| Codes de produits distincts (`Item Code`) | 302 |
| Codes CPC distincts (`Item Code (CPC)`) | 302 |
| Codes d’indicateurs distincts (`Element Code`) | 14 |
| Libellés d’indicateurs distincts (`Element`) | 8 |
| Unités distinctes (`Unit`) | 10 |
| Combinaisons distinctes code / indicateur / unité | 14 |

### Comprendre les indicateurs et leurs unités

Les 14 combinaisons observées montrent que le libellé d’un indicateur ne suffit pas toujours à interpréter une valeur : l’unité doit également être prise en compte. Par exemple, le libellé `Stocks` apparaît avec plusieurs unités.

Les combinaisons relevées dans la table sont :

| Element Code | Element | Unit |
|---:|---|---|
| 5312 | Area harvested | ha |
| 5412 | Yield | kg/ha |
| 5510 | Production | t |
| 5111 | Stocks | An |
| 5320 | Producing Animals/Slaughtered | An |
| 5112 | Stocks | 1000 An |
| 5413 | Yield | No/An |
| 5424 | Yield/Carcass Weight | g/An |
| 5513 | Production | 1000 No |
| 5313 | Laying | 1000 An |
| 5417 | Yield/Carcass Weight | kg/An |
| 5321 | Producing Animals/Slaughtered | 1000 An |
| 5318 | Milk Animals | An |
| 5114 | Stocks | No |

Un contrôle complémentaire n’a relevé aucun `Element Code` associé à plusieurs unités distinctes dans la table examinée. Cette observation ne remplace pas les contrôles de cohérence qui restent à effectuer.

## Méthode de travail

1. Examiner la structure et le volume de la table.
2. Décrire les dimensions et les catégories d’indicateurs.
3. Contrôler la couverture temporelle et le nombre d’années.
4. Rechercher les doublons logiques et les valeurs manquantes ou vides.
5. Vérifier les valeurs des indicateurs en tenant compte de leur code, de leur libellé et de leur unité.
6. Après validation de l’audit, définir des analyses métier ciblées sur le Mali.
7. Documenter progressivement les requêtes, les résultats vérifiés et les limites de l’analyse.

## Structure du dépôt

```text
sql-agricultural-production-analytics/
├── README.md
└── sql/
    └── 01_audit_diagnostic.sql
```

Le script SQL est enrichi progressivement au fil des contrôles réalisés et revus.

## Plan de l’audit

1. Identification et structure de la table — réalisé
2. Nombre total de lignes et lignes du Mali — réalisé
3. Inspection des premières observations — réalisé
4. Nombre de produits distincts (`Item`) — réalisé
5. Nombre de zones distinctes (`Area`) — réalisé
6. Nombre de codes de zone distincts (`Area Code`) — réalisé
7. Nombre de codes M49 distincts (`Area Code (M49)`) — réalisé
8. Nombre de codes de produits distincts (`Item Code`) — réalisé
9. Nombre de codes CPC distincts (`Item Code (CPC)`) — réalisé
10. Nombre de codes d’indicateurs distincts (`Element Code`) — réalisé
11. Nombre de libellés d’indicateurs distincts (`Element`) — réalisé
12. Nombre d’unités distinctes (`Unit`) — réalisé
13. Période couverte par les données — période identifiée : 1961–2023
14. Nombre d’années distinctes
15. Recherche des doublons logiques
16. Recherche des valeurs `NULL`
17. Recherche des valeurs vides
18. Minimum et maximum des superficies récoltées
19. Minimum et maximum des rendements
20. Minimum et maximum des productions
21. Minimum et maximum des stocks

**Prochaine étape de travail :** poursuivre l’audit temporel avec le contrôle du nombre d’années distinctes, puis traiter les contrôles restants. L’EDA n’a pas encore commencé.

## Outils utilisés

- MySQL
- DBeaver
- GitHub

## Note sur les résultats

Les chiffres présentés correspondent aux résultats des requêtes exécutées sur la base locale à la date de mise à jour du dépôt. Ils seront révisés si des contrôles ultérieurs conduisent à les corriger ou à préciser leur interprétation.
