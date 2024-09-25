from flask import Flask, render_template
import requests

app = Flask(__name__)

@app.route('/')
def index():
    # 获取随机编程笑话
    response = requests.get('https://v2.jokeapi.dev/joke/Programming?type=single')
    joke = response.json().get('joke')
    return render_template('index.html', joke=joke)

if __name__ == "__main__":
    app.run(debug=True)
