from flask import Flask,jsonify
import os
import logging
app = Flask(__name__)

@app.route("/")
def get_root():
    return jsonify(message="Hello World")


if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG, format = f'%(asctime)s %(levelname)s %(name)s %(threadName)s : %(message)s')

    app.logger.info("@@@ start")
    # app.jinja_env.auto_reload = True
    # app.config['TEMPLATES_AUTO_RELOAD'] = True
    port = int(os.getenv("PORT", 8080))
    app.run(host='0.0.0.0', port=port, use_reloader=True,debug=True)