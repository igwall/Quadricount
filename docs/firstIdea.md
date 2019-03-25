# Projet Swift

## Gestion des voyages  
On doit avoir les informations suivantes :
* Nom
* Photo
* Groupes de personnes

Chaque participant doit être lié à : 
* Une date de début
* Une date de fin

On doit pouvoir effectuer les actions suivantes :
* Ajouter
* Supprimer
* Ordonner
* Associer des personnes à la création du voyage
* Faire entrer et quitter des personnes pendant le voyage
* Connaitre les personnes présentes (avec dates d'entrée de sortie) et avec ordre modulable

## Gestion des dépenses

On doit avoir les informations suivantes :
* Nom 
* Montant 
* Date de la dépense (Defaut : date du jour) 
* Payeur 
* Participants (Groupe de personne) 
* Photo (facultatif)

On doit pouvoir :
* Enregistrer une dépense
* Indiquer qui a payé une dépense (Une dépense peut être payée par plusieurs
  personnes, avec des montants éventuellement différents)
* Indiquer qui est concerné par la dépense
* On peut ajouter une photo à la dépense (Ticket de caisse etc)

Note :
* Une dépense concerne par défaut, l'ensemble du groupe

## Bilan du voyage

On doit pouvoir :
* Connaitre l'état du partage
* Voir un récapitulatif des dépenses
* Voir les équilibres des dépenses de manière rapide ET de manière détaillée
  (qui doit quoi à qui)
* Afficher un récapitulatif personnel (je suis Thomas je dois x à A et y à B et
  C me doit z)
* Voir l'ensemble des dépenses de A
* Voir le prix par personne du voyage

Note :
* Le partage doit se faire de manière à minimiser les échanges d'argents ->
  L'idéal étant qu'une seule personne doive payer. **Partie peut être un peu
  complexe niveau maths et algo, A voir**

## Idée :

* Si plusieurs payeurs -> On réparti automatiquement de manière équilibré (somme/N
si il y a N payeur) Il faut penser à vérifier que la somme des montants pour
chaque participant est égale au montant globale de la dépense. 
* Faudrait qu'on test un tricount à plus que deux. Je connais très bien le
  tricount à deux mais pas plus.
