@GrabConfig(systemClassLoader=true)
@Grapes([
    @Grab(group='mysql',module='mysql-connector-java', version='8.0.19')
    ])
import groovy.sql.Sql

def sql = Sql.newInstance("jdbc:mysql://localhost:3306/gps", "root", "root",
    "con.mysql.jdbc.Driver")

sql.eachRow('select * from routepoints where temperature < 50') {
    println "Latitude: ${it.latitude}, Longitude: ${it.longitude}, " +
        "Timestep: ${it.timestep}, Temperature: ${it.temperature}"
}

def row = sql.firstRow('select latitude,longitude from reoutepoints')
println "Latitude: ${row.latitude}, Longitude: ${row.longitude}"

def newTemperature = 100
sql.executeUpdate("update routepoints set temperature = ${newTemperature}")
sql.close()
