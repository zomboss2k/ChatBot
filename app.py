# libraries
import random
import numpy as np
import pickle
import json
from flask import Flask, redirect, url_for, render_template, request, jsonify
from flask_mysqldb import MySQL,MySQLdb
import nltk
from keras.models import load_model
from nltk.stem import WordNetLemmatizer
lemmatizer = WordNetLemmatizer()

app = Flask(__name__)

app.secret_key = "caircocoders-ednalan"
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'data'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)

# Khởi động chát
model = load_model("chatbot_model.h5")
intents = json.loads(open("data.json", encoding="utf-8").read())
words = pickle.load(open("words.pkl", "rb"))
classes = pickle.load(open("classes.pkl", "rb"))

@app.route('/')
def index():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute("SELECT DISTINCT address FROM attraction ORDER BY address ASC")
    attraction = cur.fetchall()  
    return render_template('index.html', attraction = attraction)

@app.route('/search')
def search():
    return render_template('search.html')

@app.route("/ajaxlivesearch", methods=["POST","GET"])
def ajaxlivesearch():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    if request.method == 'POST':
        search_word = request.form['query']
        print(search_word)
        if search_word == '':
            query = "SELECT * from attraction ORDER BY id"
        else:    
            query = "SELECT * from attraction WHERE name LIKE '%{}%' OR money LIKE '%{}%' OR address LIKE '%{}%' ORDER BY id DESC LIMIT 20".format(search_word,search_word,search_word)
        cur.execute(query)
        attraction = cur.fetchall()
    return jsonify({'htmlresponse': render_template('rep.html', attraction=attraction)})

@app.route("/fetchrecords", methods=["POST","GET"])
def fetchrecords():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    if request.method == 'POST':
        query = request.form['query']
        #print(query)
        if query == '':
            cur.execute("SELECT * FROM attraction ORDER BY id DESC")
            attractionlist = cur.fetchall()
            print('all list')
        else:
            search_text = request.form['query']
            print(search_text)
            cur.execute("SELECT * FROM attraction WHERE address IN (%s) ORDER BY id DESC", [search_text])
            attractionlist = cur.fetchall()  
    return jsonify({'htmlresponse': render_template('response.html', attractionlist=attractionlist)})

@app.route('/attraction/<attraction_id>/', methods=['GET'])
def attraction(attraction_id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute(f'SELECT * FROM attraction WHERE id = {attraction_id}')
    attraction = cursor.fetchone()  
    return render_template('./attraction.html', attraction=attraction)

@app.route("/chat")
def home():
    return render_template("./chatbot.html")


@app.route("/get", methods=["POST"])
def chatbot_response():
    msg = request.form["msg"]
    ints = predict_class(msg, model)
    res = getResponse(ints, intents)
    return res

# chức năng chat


def clean_up_sentence(sentence):
    # mã hóa mẫu - chia các từ thành mảng
    sentence_words = nltk.word_tokenize(sentence)
    # gốc từng từ - tạo dạng rút gọn cho từng từ
    sentence_words = [lemmatizer.lemmatize(
        word.lower()) for word in sentence_words]
    return sentence_words

# trả về mảng túi từ: 0 hoặc 1 cho mỗi từ trong túi tồn tại trong câu


def bow(sentence, words, show_details=True):
    # mã hóa mẫu
    sentence_words = clean_up_sentence(sentence)
    # gán 1 nếu từ hiện tại ở vị trí từ vựng
    bag = [0] * len(words)
    for s in sentence_words:
        for i, w in enumerate(words):
            if w == s:
                # assign 1 if current word is in the vocabulary position
                bag[i] = 1
                if show_details:
                    print("found in bag: %s" % w)
    return np.array(bag)


def predict_class(sentence, model):
    # lọc ra các dự đoán
    p = bow(sentence, words, show_details=False)
    res = model.predict(np.array([p]))[0]
    ERROR_THRESHOLD = 0.25
    results = [[i, r] for i, r in enumerate(res) if r > ERROR_THRESHOLD]
    # sắp xếp theo độ mạnh của xác suất
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = []
    for r in results:
        return_list.append({"intent": classes[r[0]], "probability": str(r[1])})
    return return_list


def getResponse(ints, intents_json):
    tag = ints[0]["intent"]
    list_of_intents = intents_json["intents"]
    for i in list_of_intents:
        if i["tag"] == tag:
            responses = i['responses']
            result = {
                "images": responses["images"],
                "messages": random.choice(responses["messages"])
            }
            break
    return result


if __name__ == "__main__":
    app.run(debug=True)
