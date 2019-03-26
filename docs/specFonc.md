# Functionnal specification

## Structure example

- Property
  - Description
  - Postcondition

## Travel

- **init** : String x Image x TravellerSet -> Travel
  - Creates a Travel
- **name** : Travel ->  String
  - name of the travel
- **picture** : Travel -> Image
  - picture of the travel
- **persons** : Travel -> TravellerSet
  - all the participants of the travel
- **expences** : Travel -> ExpenseSet
  - expences of the travel  

## TravellerSet

- **init** : [Traveller] -> TravellerSet

## Traveller:
 > A traveller is a Person linked to a travel by an incoming and an outgoing date.

- **init** : Person x Date x Date -> Traveller
  - init(p,d1,d2) => d1 < d2 in date terms
- **init** : Person x Date -> Traveller
- **person** : Person
- **incomingDate** : Date
- **outgoingDate** : Date

## Expense

- **init** : String x Float x ContributionSet x ContributionSet -> Expense
- **init** : String x Float x ContributionSet x ContributionSet x Image -> Expense
- **name** : Expense -> String
- **amount** : Expense -> Float
- **buyers** : Expense -> ContributionSet
- **attendees** : Expense -> ContributionSet
- **picture** : Expense -> ContributionSet

## ExpenseSet

- **init** : [Expense] -> ExpenseSet
- **debt** : ExpenseSet -> Debt

## Debt
- **init** : Traveller x Float x Traveller -> Debt
- **giver** : Traveller
- **amount** : Float
- **receiver** : Traveller

## DebtSet
- **init** : [Debt] -> DebtSet

## Contribution
> Contribution is a link between a person and a Float. It could define the fact that the person has paid the amount or that the person is concern by the depense up to the given amount

- **init** : Person x Float -> Contribution
- **person** : Person
- **amount** : Float

## ContributionSet

- **init** : [Contribution] -> ContributionSet

## Person
- **init** : String x String -> Person
  - creates a person
  - init(lastname (s1, s2)) = s2
  - init(firstname(s1, s2)) = s1
- **lastname**
  - lastname of the person
- **firstname**
  - firstname of the person
- **fullname**
  - complete name
  - fullname(s) = firstname(s) + " " + lastname(s)
- **==**
  - check if the firstname, the lastname and the birthdate are equals between two Persons
  - return true if firstname, lastname and birthdate are equals, else return false
- **!=**
  - check if the firstname, the lastname and the birthdate are not equals between two Persons
  - return true if firstname, lastname and birthdate are not equals, else return false



  -----
  *The variables and applications names in this story are purely fictional, so any resemblance to people or situations that exist or have existed can only be fortuitous.*

  **- Quadricount's authors**
