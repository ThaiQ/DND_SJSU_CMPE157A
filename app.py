from flask import Flask, render_template, app, request, jsonify
import mysql.connector
app = Flask(__name__)

database = mysql.connector.connect(
    host = 'localhost', user = 'test',
    passwd = '1', database = 'cs158afinal')


mycursor = database.cursor()

def Convert(tup, di):
    for a, b in tup:
        di.setdefault(a, []).append(b)
    return di


def retList():
   list = []
   for i in range(0, 10):
      list.append(i)
   return list


@app.route('/')
def index():
   mycursor.execute('SELECT * FROM Player')
   playerdatatuple = mycursor.fetchall()
   mycursor.execute('SELECT * FROM Bio')
   biodatatuple = mycursor.fetchall()
   mycursor.execute('SELECT * FROM Equipment')
   equipmentdatatuple = mycursor.fetchall()
   mycursor.execute('SELECT * FROM Inventory')
   inventorydatatuple = mycursor.fetchall()
   mycursor.execute('SELECT * FROM Class_Spells')
   classspelldatatuple = mycursor.fetchall()
   mycursor.execute('SELECT * FROM Class')
   classdatatuple = mycursor.fetchall()
   mycursor.execute('SELECT * FROM Item')
   itemdatatuple = mycursor.fetchall()
   mycursor.execute('SELECT * FROM Proficient_Skill')
   proficientskilldatatuple = mycursor.fetchall()
   mycursor.execute('SELECT * FROM Spells')
   spelldatatuple = mycursor.fetchall()
   return jsonify(playerdatatuple + biodatatuple + equipmentdatatuple + inventorydatatuple + classspelldatatuple + classdatatuple + itemdatatuple + proficientskilldatatuple + spelldatatuple)
   # return jsonify(
   #    player=playerdatatuple
   # )

if __name__ == '__main__':
    app.run()