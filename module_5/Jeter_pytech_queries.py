from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.wk2gxrs.mongodb.net/pytech"

client = MongoClient("mongodb+srv://admin:admin@cluster0.wk2gxrs.mongodb.net/pytech")
db = client.pytech
students = db.students

student_list = students.find({})

print("\n  -- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")

for doc in student_list:
    print("  Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")
    sarah = students.find_one({"student_id": "1008"})
    print("\n  -- DISPLAYING STUDENT DOCUMENT FROM find_one() QUERY --")
print("  Student ID: " + sarah["student_id"] + "\n  First Name: " + sarah["first_name"] + "\n  Last Name: " + sarah["last_name"] + "\n")

# exit message 
input("\n\n  End of program, press any key to continue...")