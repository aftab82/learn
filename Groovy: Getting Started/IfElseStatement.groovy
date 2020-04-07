def myOpportunity = 10000

if (myOpportunity < 1000) {
    println "The best approach for opportunities of this size is email."
} else if (myOpportunity >= 1000 && myOpportunity < 5000) {
    println "The best approach for opportunities of this size is telephone."
} else {
    // Recommend face to face for all opportunities $5000 or more
    println "The best approach for opportunities of this size is face to face."
}
