# Disposer de l'information "commentaire" dans les caractéristiques du mail MP

## Demande :

![image](https://github.com/MathisCastell/Stage-Disposer-de-l-information-commentaire-dans-les-caracteristiques-du-mail-MP/assets/148212506/75dcc596-d765-4874-9449-641b2f8eb792)

## Modification de la base de donnée pour accueillir le champ commentaire 

ALTER TABLE egd.msg_mail
 ADD Commentaires TEXT CHARACTER SET utf8 COLLATE utf8_general_ci AFTER fkIdExterne;

## Création de la page de détails

Je défini dans un premier temps les champs en leur donnant un nom une valeur et un type.
Ensuite je défini les variables de session.
Je fais les requêtes SQL pour aller chercher les valeurs dans la base de donnée pour afficher les détails du mail.
Je mets une PS qui a pour objectif de marquer le mail comme non lu si on clique sur le bouton marquer comme non lu. ![image](https://github.com/MathisCastell/Stage-Disposer-de-l-information-commentaire-dans-les-caracteristiques-du-mail-MP/assets/148212506/42bd7ee7-ddaa-4d7e-889a-52c1033a71b5)

Pour finir je les affiche dans la page.

Résultat :

![image](https://github.com/MathisCastell/Stage-Disposer-de-l-information-commentaire-dans-les-caracteristiques-du-mail-MP/assets/148212506/bcbdde9f-aea1-40d0-ad1f-1c95a52ebd38)
![image](https://github.com/MathisCastell/Stage-Disposer-de-l-information-commentaire-dans-les-caracteristiques-du-mail-MP/assets/148212506/322821bc-77ee-4fb8-97b5-2fc5a51b7a8d)



## Création de la page de modification 

Je défini les variables.
Je fais les requêtes SQL pour afficher les valeurs déjà présentes dans les champs.
J'appelle la PS qui aura pour but de modifier les valeurs dans la base de donnée.
J'affiche les différents champs défini plus haut.

Résultat :

![image](https://github.com/MathisCastell/Stage-Disposer-de-l-information-commentaire-dans-les-caracteristiques-du-mail-MP/assets/148212506/ba688127-58c9-45a9-bfd1-072b07ee3d0f)
