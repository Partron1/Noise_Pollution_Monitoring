python app.py


App.py file
-------------
from flask import Flask, render_template
import pyrebase

config = {
    "apiKey": "YOUR_API_KEY",
    "authDomain": "your-project.firebaseapp.com",
    "databaseURL": "https://your-project.firebaseio.com",
    "storageBucket": "your-project.appspot.com"
}

firebase = pyrebase.initialize_app(config)
db = firebase.database()

app = Flask(__name__)

@app.route('/')
def index():
    noise_level = db.child("noise_level").get().val()
    return render_template("index.html", noise_level=noise_level)

if __name__ == '__main__':
    app.run(debug=True)