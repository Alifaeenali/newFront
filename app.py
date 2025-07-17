from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/faqs')
def faqs():
    return render_template('faqs.html')

@app.route('/demo')
def demo():
    return render_template('demo-page.html')

if __name__ == "__main__":
    app.run(debug=True)


# HSSMMM04R30Z236Y