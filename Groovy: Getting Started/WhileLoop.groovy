int opportunityOne = 1000
int opportunityTwo = 2000
int opportunityThree = 3000
int opportunityFour = 4000
int opportunityFive = 5000
int totalOpportunity = 0

List opportunities = [opportunityOne, opportunityTwo, opportunityThree, opportunityFour ,opportunityFive]

int counter = 0
while(counter < opportunities.size) {
    println "Found an opportunity of ${opportunities[counter]}"
    totalOpportunity += opportunities[counter]
    println "Total opportunity is now $totalOpportunity"
    counter++
}
