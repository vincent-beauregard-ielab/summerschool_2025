<!-- Received: 23 October 2020 | Revised: 3 June 2021 | Accepted: 9 June 2021
DOI: 10.1111/geb.13354
ME THOD
MadingleyR: An R package for mechanistic ecosystem
modelling
Selwyn Hoeks1 | Marlee A. Tucker1 | Mark A. J. Huijbregts1 | Mike B. J. Harfoot2 |
Mike Bithell3 | Luca Santini1,4,5 -->

# Notes de lecture

MadingleyR: An R package for mechanistic ecosystem modelling

Selwyn Hoeks, Marlee A. Tucker, Mark A. J. Huijbregts, Mike B. J. Harfoot, Mike Bithell, Luca Santini

Global Ecology and Biogeography, 2021

## Thèse générale

Proposition d'une implémentation du modèle Madingley en C++, wrappée dans un package R.

* Objectif : Faciliter l'utilisation du modèle Madingley pour la communauté scientifique, en fournissant un package R facile à utiliser.

## Modèle Madingley

* Modèle d'écosystème mécanistique basé sur des cohortes d'organismes hétérotrophes, des autotrophes et des variables environnementales.
* Les cohortes sont des groupes d'organismes ayant des caractéristiques similaires (niveau trophique, caractéristiques métaboliques et stratégie de reproduction) et qui co-existent dans un environnement donné.
* Pour une cellule spatiale, le modèle simule les processus à chaque étape de temps, en mettant à jour les propriétés des cohortes et les variables environnementales.
  * Métabolisme, alimentation (interaction), reproduction, mortalité, dispersion avec les cellules adjacentes.
* Les interactions entre les cohortes sont modélisées pour simuler les dynamiques des écosystèmes à l'aide de paramètres fixes, dérivés de la littérature théorique et empirique.
* Les processus des autotrophes (production, allocation, mortalité) sont modélisés comme des fonctions du climat à partir d'un modèle de carbon terrestre.
* Les variables des groupes (biomasse des cohortes et stock, productivité) sont mises à jour à chaque étape de temps, et les propriétés émergentes sont dérivées des propriétés des cohortes.

## Notes sur l'implémentation

* Compilation basée sur C++ et OpenMP pour la parallélisation.
* Le package R fournit une interface utilisateur simple pour interagir avec le modèle, avec des interfaces avec les packages `terra` et `sf` pour la manipulation des données spatiales.
* Le package inclut des fonctions pour initialiser le modèle, exécuter des simulations, et visualiser les résultats.
* Le modèle n'intègre que les processus des milieux terrestres, le modèle marin n'est pas encore implémenté.
  

## À clarifier

* Lister les variables d'entrée et de sortie du modèle.
* Comment ces variables peuvent être intégrés à des scénarios de changement climatique pour la prise de décision (policy making).
* Comment est-ce que ce modèle peut s'intégrer dans un framework de scénario-projection.
* Quels seront les types de forcing qu'on voudrait tester avec ce modèle et est-ce que les données d'entrée sont disponibles pour ces forçages (destruction des habitats, changements climatiques, connectivité des écosystèmes, introduction d'espèces exotiques, surexploitation des ressources (surpêche, chasse, coupe de bois), pollution, etc.).