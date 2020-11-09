from flask import Flask
import mysql.connector
app = Flask(__name__)
app.config.from_pyfile('./config/prod.cfg')

mydb = mysql.connector.connect(
    host = app.config['DBHOST'],
    database = app.config['DBNAME'],
    user = app.config['DBUSER'],
    password = app.config['DBPASS']
)

@app.route("/")

def hello():
    cur = mydb.cursor()
    cur.execute("SELECT word from hello_world")
    rows = cur.fetchall()
    
    return "{} {}".format(rows[0][0], rows[1][0])

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)
