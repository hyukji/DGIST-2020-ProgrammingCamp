#pip install install flask-mysql 

from flask import Flask, render_template,request
from flaskext.mysql import MySQL

app =Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '1234'
app.config['MYSQL_DATABASE_DB'] = 'test'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql = MySQL()
mysql.init_app(app)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/write", methods=['GET','POST'])
def write():
    if request.method == 'GET':
        return render_template("writeform.html")
    else:
        title = request.form['title']
        writer = request.form['writer']
        content = request.form['content']
        vals=(title, content, writer)
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("insert into board(title,content,writer) values(%s,%s,%s)",vals)
        conn.commit()
        conn.close()
        print(vals)
        return 'ok'

@app.route("/list")
def list():
    return "list"


if  __name__ == "__main__":
    app.run(debug=True)