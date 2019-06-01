# Procédure d'installation

Après création d’un compte Amazon, effectuer les commandes ci-après

## Création d’un compartiment
Dans la console AWS Management Console, créer un nouveau bucket (ou compartiment)
- nommé valentinchevreau
- région : UE IRLANDE
- pas de copie des paramètres d’un compartiment existant

SUIVANT

- Versionning : ne rien cocher
- Journalisation des accès au serveur : ne rien cocher
- Balises : ne rien cocher
- Journalisation au niveau des objets : ne rien cocher
- Chiffrement par défaut : ne rien cocher
- Paramètre d’objet > ne rien cocher
- Gestion > ne rien cocher

SUIVANT

- Bloquer l’accès public : cocher la première case uniquement
- Gérer les autorisations systèmes : ne pas octroyer

SUIVANT

CRÉER UN COMPARTIMENT


## Créer un utilisateur
- Services : rechercher *[IAM]()*
- Cliquer sur Utilisateurs > Ajouter un utilisateur
- Nom d’utilisateur : terraform
- Cocher le premier type d’accès uniquement (Accès par programmation)

SUIVANT : AUTORISATIONS

Choisir la première option dans  “Attacher directement les stratégies existantes” pour définir
Confirmer la vérification


## Création d’une image avec Packer
Se rendre dans le dossier :
> packer/eu-west-1/database

Exécuter cette commande
> packer build prof-code.json

## Déployer l'architecture

Se rendre dans le dossier suivant :
> architecture/eu-west-1/database

Effectuer la commande
> terraformm apply

Confirmer la modification en entrant "yes" dans "value"

## Supprimer les données

Se rendre dans le dossier suivant :
> architecture/eu-west-1/database

Effectuer la commande
> terraformm destroy

