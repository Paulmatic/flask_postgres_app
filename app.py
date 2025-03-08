from flask import Flask, request, jsonify, render_template, redirect, url_for
import psycopg2
import os

app = Flask(__name__)

# Database connection
conn = psycopg2.connect(
    dbname=os.getenv("POSTGRES_DB", "flaskdb"),
    user=os.getenv("POSTGRES_USER", "postgres"),
    password=os.getenv("POSTGRES_PASSWORD", "password123"),
    host=os.getenv("POSTGRES_HOST", "db"),
    port=os.getenv("POSTGRES_PORT", "5432")
)
cursor = conn.cursor()

@app.route("/")
def index():
    cursor.execute("SELECT * FROM users;")
    users = cursor.fetchall()
    return render_template("index.html", users=users)

@app.route("/add_user", methods=["POST"])
def add_user():
    name = request.form["name"]
    email = request.form["email"]
    cursor.execute("INSERT INTO users (name, email) VALUES (%s, %s) RETURNING *;", (name, email))
    conn.commit()
    return redirect(url_for("index"))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
