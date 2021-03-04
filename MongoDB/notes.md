creds m001-student / m001-mongodb-basics

connection string:
mongo "mongodb+srv://sandbox.hmwde.mongodb.net/<dbname>" --username m001-student
mongo "mongodb+srv://m001-student:m001-mongodb-basics@sandbox.hmwde.mongodb.net/admin"

URI:
mongodb+srv://m001-student:m001-mongodb-basics@sandbox.hmwde.mongodb.net/database

Export to BSON:
mongodump --uri "mongodb+srv://m001-student:m001-mongodb-basics@sandbox.hmwde.mongodb.net/sample_supplies"

Export to JSON file:
mongoexport --uri="mongodb+srv://m001-student:m001-mongodb-basics@sandbox.hmwde.mongodb.net/sample_supplies" --collection=sales --out=sales.json

Import BSON (drop option removes data):
mongorestore --uri "mongodb+srv://m001-student:m001-mongodb-basics@sandbox.hmwde.mongodb.net/sample_supplies"  --drop dump

Import JSON:
mongoimport --uri="mongodb+srv://m001-student:m001-mongodb-basics@sandbox.hmwde.mongodb.net/sample_supplies" --drop sales.json


show dbs

use sample_training

show collections

db.zips.find({"state": "NY"})

db.zips.find({"state": "NY"}).count()

db.zips.find({"state": "NY", "city": "ALBANY"})

db.zips.find({"state": "NY", "city": "ALBANY"}).pretty()

```
db.inspections.insert({
      "_id" : ObjectId("56d61033a378eccde8a8354f"),
      "id" : "10021-2015-ENFO",
      "certificate_number" : 9278806,
      "business_name" : "ATLIXCO DELI GROCERY INC.",
      "date" : "Feb 20 2015",
      "result" : "No Violation Issued",
      "sector" : "Cigarette Retail Dealer - 127",
      "address" : {
              "city" : "RIDGEWOOD",
              "zip" : 11385,
              "street" : "MENAHAN ST",
              "number" : 1712
         }
  })
```
db.inspections.insert({
      "id" : "10021-2015-ENFO",
      "certificate_number" : 9278806,
      "business_name" : "ATLIXCO DELI GROCERY INC.",
      "date" : "Feb 20 2015",
      "result" : "No Violation Issued",
      "sector" : "Cigarette Retail Dealer - 127",
      "address" : {
              "city" : "RIDGEWOOD",
              "zip" : 11385,
              "street" : "MENAHAN ST",
              "number" : 1712
         }
  })

db.inspections.find({"id" : "10021-2015-ENFO", "certificate_number" : 9278806}).pretty()

db.zips.updateMany({ "city": "HUDSON" }, { "$inc": { "pop": 10 } })
db.zips.updateOne({ "zip": "12534" }, { "$set": { "pop": 17630 } })

db.grades.updateOne({ "student_id": 250, "class_id": 339 },
                    { "$push": { "scores": { "type": "extra credit",
                                             "score": 100 }
                                }
                     })
db.inspections.deleteMany({ "test": 1 })
db.inspection.drop()


MongoDB Enterprise atlas-nka60q-shard-0:PRIMARY> db.zips.updateMany({"city": "ALBANY", "state": "NY"}, {"$set": {"capital?": true}})
{ "acknowledged" : true, "matchedCount" : 7, "modifiedCount" : 7 }

MongoDB Enterprise atlas-nka60q-shard-0:PRIMARY> db.zips.updateMany({"city": "NEW YORK", "state": "NY"}, {"$set": {"capital?": false}})
{ "acknowledged" : true, "matchedCount" : 40, "modifiedCount" : 40 }


db.trips.find({ "tripduration": { "$lte" : 70 },
                "usertype": { "$ne": "Subscriber" } }).pretty()


db.routes.find({"$and": [{"$or":[{"src_airport":"KZN"},{"dst_airport":"KZN"}]},{"$or":[{"airplane":"CR2"},{"airplane":"A81"}]}]}).count()
--18
db.routes.find({"$or":[{"src_airport":"KZN"},{"dst_airport":"KZN"}]},{"$or":[{"airplane":"CR2"},{"airplane":"A81"}]}).count()
--56
db.routes.find({"src_airport":"KZN"},{"dst_airport":"KZN"})


db.routes.find({ "$and": [ { "$or" :[ { "dst_airport": "KZN" },
                                    { "src_airport": "KZN" }
                                  ] },
                          { "$or" :[ { "airplane": "CR2" },
                                     { "airplane": "A81" } ] }
                         ]}).pretty()

student IDs > 25 and < 100:
{"$and": [{"student_id": {"$gt": 25}}, {"student_id": {"$lt": 100}}]}
{"sutdent_id": {"$gt": 25}}, {"student_id": {"$lt": 100}}
{"student_id": {"$gt": 25, "$lt": 100}}

db.companies.find({ "$and": [
                        { "$or": [ { "founded_year": 2004 },
                                   { "founded_month": 10 } ] },
                        { "$or": [ { "category_code": "web" },
                                   { "category_code": "social" }]}]}).count()


db.trips.find({ "$expr": { "$eq": [ "$end station id", "$start station id"] }
             }).count()

db.trips.find({ "$expr": { "$and": [ { "$gt": [ "$tripduration", 1200 ]},
                         { "$eq": [ "$end station id", "$start station id" ]}
                       ]}}).count()

db.companies.find({"$expr": {"$eq": ["$twitter_username", "$permalink"]}}).count()


db.listingsAndReviews.find({ "amenities": {
                                  "$size": 20,
                                  "$all": [ "Internet", "Wifi",  "Kitchen",
                                           "Heating", "Family/kid friendly",
                                           "Washer", "Dryer", "Essentials",
                                           "Shampoo", "Hangers",
                                           "Hair dryer", "Iron",
                                           "Laptop friendly workspace" ]
                                         }
                            }).pretty()

db.listingsAndReviews.find({"accommodates": {"$gt": 6}}).count()
db.listingsAndReviews.find({"reviews": {"$size": 50}}).count()

db.listingsAndReviews.find({"$and": [
                                    {"accommodates": {"$gt": 6}},
                                    {"reviews": {"$size": 50}}
                                    ]}).count()

db.listingsAndReviews.find({ "reviews": { "$size":50 },
                             "accommodates": { "$gt":6 }})

db.listingsAndReviews.find({"property_type": "House"})
db.listingsAndReviews.find({"amenities": "Changing table"})
db.listingsAndReviews.find({"property_type": "House",
                            "amenities": "Changing table"}).count()

db.listingsAndReviews.find({ "amenities":
        { "$size": 20, "$all": [ "Internet", "Wifi",  "Kitchen", "Heating",
                                 "Family/kid friendly", "Washer", "Dryer",
                                 "Essentials", "Shampoo", "Hangers",
                                 "Hair dryer", "Iron",
                                 "Laptop friendly workspace" ] } },
                            {"price": 1, "address": 1}).pretty()

```
db.listingsAndReviews.find({ "amenities": "Wifi" },
                           { "price": 1, "address": 1, "_id": 0 }).pretty()
```
```
db.listingsAndReviews.find({ "amenities": "Wifi" },
                           { "price": 1, "address": 1,
                             "_id": 0, "maximum_nights":0 }).pretty()
```

db.grades.find({ "class_id": 431 },
               { "scores": { "$elemMatch": { "score": { "$gt": 85 } } }
             }).pretty()
db.grades.find({ "scores": { "$elemMatch": { "type": "extra credit" } }
               }).pretty()


db.companies.find({"offices": {"$elemMatch": {"city": "Seattle"}}}).count()


use sample_training

db.trips.findOne({ "start station location.type": "Point" })

db.companies.find({ "relationships.0.person.last_name": "Zuckerberg" },
                  { "name": 1 }).pretty()

db.companies.find({ "relationships.0.person.first_name": "Mark",
                    "relationships.0.title": { "$regex": "CEO" } },
                  { "name": 1 }).count()


db.companies.find({ "relationships.0.person.first_name": "Mark",
                    "relationships.0.title": {"$regex": "CEO" } },
                  { "name": 1 }).pretty()

db.companies.find({ "relationships":
                      { "$elemMatch": { "is_past": true,
                                        "person.first_name": "Mark" } } },
                  { "name": 1 }).pretty()

db.companies.find({ "relationships":
                      { "$elemMatch": { "is_past": true,
                                        "person.first_name": "Mark" } } },
                  { "name": 1 }).count()


MongoDB Enterprise > db.trips.find({"start station location.coordinates.0": {"$lt": -74}}).count()
1928
MongoDB Enterprise > db.trips.find({ "start station location.coordinates": { "$lt": -74 }}).count()
1928
MongoDB Enterprise >
Since this is New York longitudes are always positive hence can be ignored


```
db.listingsAndReviews.find({ "amenities": "Wifi" },
                           { "price": 1, "address": 1, "_id": 0 }).pretty()

db.listingsAndReviews.aggregate([
                                  { "$match": { "amenities": "Wifi" } },
                                  { "$project": { "price": 1,
                                                  "address": 1,
                                                  "_id": 0 }}]).pretty()

db.listingsAndReviews.findOne({ },{ "address": 1, "_id": 0 })

db.listingsAndReviews.aggregate([ { "$project": { "address": 1, "_id": 0 }},
                                  { "$group": { "_id": "$address.country" }}])

db.listingsAndReviews.aggregate([
                                  { "$project": { "address": 1, "_id": 0 }},
                                  { "$group": { "_id": "$address.country",
                                                "count": { "$sum": 1 } } }
                                ])
```

```
db.listingsAndReviews.aggregate([
  {"$project": {"room_type": 1, "_id": 0}},
  {"$group": {"_id": "$room_type"}}
  ])

db.listingsAndReviews.aggregate([
  {"$group": {"_id": "$room_type"}}
  ])
```


use sample_training

db.zips.find().sort({ "pop": 1 }).limit(1)

db.zips.find({ "pop": 0 }).count()

db.zips.find().sort({ "pop": -1 }).limit(1)

db.zips.find().sort({ "pop": -1 }).limit(10)

db.zips.find().sort({ "pop": 1, "city": -1 })


db.trips.find({"birth year": {"$ne": ""}}).sort({"birth year": -1}).limit(1).pretty()

db.trips.find({"birth year": {"$ne": ""}}, {"birth year": 1}).sort({"birth year": -1}).limit(1)


use sample_training

db.trips.find({ "birth year": 1989 })

db.trips.find({ "start station id": 476 }).sort( { "birth year": 1 } )

db.trips.createIndex({ "birth year": 1 })

db.trips.createIndex({ "start station id": 476, "birth year": 1 })


Updates by adding a value to readings array. Once array size reaches 48 new document is created:
db.iot.updateOne({ "sensor": r.sensor, "date": r.date,
                   "valcount": { "$lt": 48 } },
                         { "$push": { "readings": { "v": r.value, "t": r.time } },
                        "$inc": { "valcount": 1, "total": r.value } },
                 { "upsert": true })
