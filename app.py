from flask import Flask, render_template, app, request
import mysql.connector

database = mysql.connector.connect(
    host = 'localhost', user = 'root',
    passwd = '', database = 'cs158Afinal')


mycursor = database.cursor()

def Convert(tup, di):
    for a, b in tup:
        di.setdefault(a, []).append(b)
    return di

@app.route('/')
def index():
   mycursor.execute('SELECT * FROM Player')
   playerdata={}
   playerdatatuple = mycursor.fetchall()
   Convert(playerdatatuple, playerdata)
   mycursor.execute('SELECT * FROM Bio')
   biodata={}
   biodatatuple = mycursor.fetchall()
   biodata = Convert(biodatatuple, biodata)
   mycursor.execute('SELECT * FROM Equipment')
   equipmentdata={}
   equipmentdatatuple = mycursor.fetchall()
   Convert(equipmentdatatuple, equipmentdata)
   mycursor.execute('SELECT * FROM Inventory')
   inventorydatatuple = mycursor.fetchall()
   inventorydata={}
   Convert(inventorydatatuple, inventorydata)
   mycursor.execute('SELECT * FROM Class_Spell')
   classspelldata={}
   classspelldatatuple = mycursor.fetchall()
   Convert(classspelldatatuple, classspelldata)

if __name__ == '__main__':
    app.run()