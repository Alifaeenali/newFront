from flask import Flask, render_template
# from dbConnector import returnDict
import mysql.connector
from dotenv import load_dotenv
import os

def returnDict():

    cols = []
    rows = []

    load_dotenv()
    db = mysql.connector.connect(
    host = os.getenv('DB_HOST'),
    user = os.getenv('DB_USER'),
    password = os.getenv('DB_PASSWORD'),
    database = os.getenv('DB_NAME'),
    )

    cursor = db.cursor()
    
    cursor.execute('select * from navSection')
    cols += [desc[0] for desc in cursor.description]
    rows += cursor.fetchall()[0]
    
    cursor.execute('select * from heroSection')
    cols += [desc[0] for desc in cursor.description]
    rows += cursor.fetchall()[0]

    cursor.execute('select * from clientTrust')
    cols += [desc[0] for desc in cursor.description]
    rows += cursor.fetchall()[0]

    cursor.execute('select * from innovationSection')
    cols += [desc[0] for desc in cursor.description]
    rows += cursor.fetchall()[0]

    cursor.execute('select * from ExperienceSection')
    cols += [desc[0] for desc in cursor.description]
    rows += cursor.fetchall()[0]

    cursor.execute('select * from StatsSection')
    cols += [desc[0] for desc in cursor.description]
    rows += cursor.fetchall()[0]

    cursor.execute('select * from knowSection')
    cols += [desc[0] for desc in cursor.description]
    rows += cursor.fetchall()[0]

    cursor.execute('select * from ExploreSection')
    cols += [desc[0] for desc in cursor.description]
    rows += cursor.fetchall()[0]

    data_dict = dict(zip(cols, rows))
    return data_dict

data_dict = returnDict()

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html', **data_dict)

@app.route('/faqs')
def faqs():
    return render_template('faqs.html')

@app.route('/demo')
def demo():
    return render_template('demo-page.html')




if __name__ == "__main__":
    app.run(debug=True)
# HSSMMM04R30Z236Y