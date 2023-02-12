import pymongo
from pymongo import MongoClient
client = MongoClient("mongodb+srv://admin:admin@cluster0.wk2gxrs.mongodb.net/pytech")
db = client["pytech"]
collection = db["students"]

post1 = {"_id": 1007, "First Name": "Derek", "Last Name": "Jeter"}
post2 = {"_id": 1008, "First Name": "Sarah", "Last Name": "Mcgloughlin"}
post3 = {"_id": 1009, "First Name": "Harry", "Last Name": "Potter"}

collection.insert_many([post1, post2, post3])