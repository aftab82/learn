int[] opportunities = new int[] { 500, 600, 700, 800, 900 }

// opportunities.each { println "${it}" }
opportunities.each((opportunity) -> {
    if (opportunity >= 700)
        println opportunity
    })
