from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def head():
    return render_template("index.html", number1=48, number2=15)

@app.route("/earnest")
def number():
    num1 = 23
    num2 = 123
    return render_template("body.html", value1=num1, value2=num2, sum=num1+num2)



if __name__== "__main__":
    app.run(debug=True)