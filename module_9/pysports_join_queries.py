
""" 
  pysports_join_queries.py
   natasha jeter
    3-4-2023
    Description: Test program for joining the player and team tables
"""

""" import statements """
import mysql.connector
from mysql.connector import errorcode

""" database config object """
config = {
    "user": "root",
    "password": "Elisea2025!",
    "host": "127.0.0.1",
    "database": "happy",
    "raise_on_warnings": True
}

try:
    """ try/catch block for handling potential MySQL database errors """ 

    db = mysql.connector.connect(**config) 

    cursor = db.cursor()

   
    cursor.execute("SELECT player_id, first_name, last_name, team_name FROM player INNER JOIN team ON player.team_id = team.team_id")

   
    players = cursor.fetchall()

    print("\n  -- DISPLAYING PLAYER RECORDS --")

    
    for player in players:
        print("  Player ID: {}\n  First Name: {}\n  Last Name: {}\n  Team Name: {}\n".format(player[0], player[1], player[2], player[3]))

    input("\n\n  Press any key to continue... ")

except mysql.connector.Error as err:
    """ handle errors """ 

    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("  The supplied username or password are invalid")

    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("  The specified database does not exist")

    else:
        print(err)

finally:
    """ close the connection to MySQL """

    db.close()