int myOpportunity = 12000

switch (myOpportunity) {
    case 0..999:
        println "e-mail"
        break
    case 1000..4999:
        println "telephone"
        break
    default:
        //Reccommend face to face for opportunities greater than $5000
        println "face to face"
}
