import os
import psycopg2
from flask import Flask

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        host=os.environ.get('DB_HOST'),
        database=os.environ.get('DB_NAME'),
        user=os.environ.get('DB_USER'),
        password=os.environ.get('DB_PASSWORD')
    )
    return conn

def init_db():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('CREATE TABLE IF NOT EXISTS tasks (id SERIAL PRIMARY KEY, title TEXT NOT NULL, completed BOOLEAN DEFAULT FALSE);')
    conn.commit()
    cur.close()
    conn.close()

@app.route('/')
def hello():
    try:
        init_db()
        return "<h1>Project Nano-Banana To-Do App is running! talking to DB.</h1>"
    except Exception as e:
        return f"<h1>App is running, but CANNOT talk to DB. Error: {e}</h1>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
