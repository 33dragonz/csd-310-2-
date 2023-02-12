#Natasha Jeter
#jan 30, 2022
#Database Security
#assignment 5.2



from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.wk2gxrs.mongodb.net/pytech"



client = MongoClient(url)

# connect pytech database
db = client.pytech  

# show the connected collections 
print("\n -- Pytech COllection List --")
print(db.list_collection_names())

# show an exit message
input("\n\n  End of program, press any key to exit... ")