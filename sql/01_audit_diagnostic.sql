/*============================================================================
PHASE 1 : AUDIT & DIAGNOSTIC
Projet : Agricultural Production Analytics
Source : FAOSTAT - Crops and Livestock Products
Périmètre d'analyse prévu : Mali
Statut : audit en cours
============================================================================*/

USE production_crops_livestock_e_all_data_noflag;

-- ============================================================
-- 1. IDENTIFICATION ET STRUCTURE DE LA TABLE
-- Objectif : comprendre les colonnes et les types de données.
-- ============================================================

SHOW COLUMNS FROM production_crops_livestock_e_all_data_noflag;

DESCRIBE production_crops_livestock_e_all_data_noflag;


-- ============================================================
-- 2. CONTRÔLE DU NOMBRE DE LIGNES
-- Objectif : établir le volume de référence de la table complète
-- et le volume des observations concernant le Mali.
-- Résultats obtenus : 75 000 lignes au total ; 317 pour le Mali.
-- ============================================================

SELECT
    COUNT(*) AS total_lines
FROM production_crops_livestock_e_all_data_noflag AS pcleadn;

SELECT
    COUNT(*) AS mali_lines
FROM production_crops_livestock_e_all_data_noflag AS pcleadn
WHERE pcleadn.Area = 'Mali';


-- ============================================================
-- 3. INSPECTION DES PREMIÈRES OBSERVATIONS
-- Objectif : examiner les dimensions descriptives, les indicateurs,
-- les unités et quelques valeurs annuelles réellement importées.
-- Observation : les colonnes annuelles vont de Y1961 à Y2023.
-- Les NULL observés seront quantifiés dans la section dédiée.
-- ============================================================

SELECT *
FROM production_crops_livestock_e_all_data_noflag AS pcleadn
LIMIT 20;


-- ============================================================
-- 4. NOMBRE DE ITEM UNIQUES
-- Objectif : compter les produits distincts dans la table complète
-- puis ceux représentés dans les observations du Mali.
-- Résultats obtenus : 302 au total ; 132 pour le Mali.
-- ============================================================

SELECT
    COUNT(DISTINCT pcleadn.Item) AS total_unique_item
FROM production_crops_livestock_e_all_data_noflag AS pcleadn;

SELECT
    COUNT(DISTINCT pcleadn.Item) AS mali_unique_item
FROM production_crops_livestock_e_all_data_noflag AS pcleadn
WHERE pcleadn.Area = 'Mali';


-- ============================================================
-- SECTIONS RESTANTES DE L'AUDIT
-- Nous les compléterons progressivement, après conception et
-- validation de chaque requête avec la méthode de mentorat.
-- ============================================================

-- 5. NOMBRE DE AREA UNIQUES
-- 6. NOMBRE DE AREA CODE UNIQUES
-- 7. NOMBRE DE AREA CODE (M49) UNIQUES
-- 8. NOMBRE DE ITEM CODE UNIQUES
-- 9. NOMBRE DE ITEM CODE (CPC) UNIQUES
-- 10. NOMBRE DE ELEMENT CODE UNIQUES
-- 11. NOMBRE DE ELEMENT UNIQUES
-- 12. NOMBRE DE UNIT UNIQUES
-- 13. PÉRIODE COUVERTE PAR LES DONNÉES
-- 14. NOMBRE D'ANNÉES DISTINCTES
-- 15. RECHERCHE DES DOUBLONS LOGIQUES
-- 16. RECHERCHE DES VALEURS NULL
-- 17. RECHERCHE DES VALEURS VIDES
-- 18. MINIMUM ET MAXIMUM DES SURFACES RÉCOLTÉES
-- 19. MINIMUM ET MAXIMUM DES RENDEMENTS
-- 20. MINIMUM ET MAXIMUM DES PRODUCTIONS
-- 21. MINIMUM ET MAXIMUM DES STOCKS
