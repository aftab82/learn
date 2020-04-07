int opportunityOne = 1000
int opportunityTwo = 2000
int opportunityThree = 3000
int opportunityFour = 4000
int opportunityFive = 5000
int totalOpportunity = 0

List opportunities = [opportunityOne, opportunityTwo, opportunityThree, opportunityFour ,opportunityFive]

//for(int i = 0; i < opportunities.size; i++)
for(int opportunity in opportunities) {
    println "Found an opportunity of ${opportunity}"
    totalOpportunity += opportunity
    println "Total opportunity is now $totalOpportunity"
}
