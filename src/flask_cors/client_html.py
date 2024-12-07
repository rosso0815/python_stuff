from flask import Flask,jsonify,render_template


app = Flask(__name__)

# html='''
# <!DOCTYPE html>
# <html>
# <body>

# <h1>My First Heading</h1>
# <p>My first paragraph.</p>

# </body>
# </html>
# '''

@app.route("/", methods=["GET"])
def get_root():
    # global html
    # response = str(html)
    # response.headers.add("Access-Control-Allow-Origin", "*")
    # return response
    return render_template('index.html')


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8020, debug=True)
