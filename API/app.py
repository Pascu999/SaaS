from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = "mariadb+pymysql://test:test123@0.0.0.0:49154/my_database"
app.debug = True
db = SQLAlchemy(app)


class kokoro(db.Model):
    __tablename__ = 'kokoro'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    age = db.Column(db.Integer, nullable=False)
    sex = db.Column(db.Integer())
    cp = db.Column(db.Integer())
    trestbps = db.Column(db.Integer)
    chol = db.Column(db.Integer)
    fbs = db.Column(db.Integer)
    restecg = db.Column(db.Integer)
    thalach = db.Column(db.Integer)
    exang = db.Column(db.Integer)
    oldpeak = db.Column(db.Float)
    slope = db.Column(db.Integer)
    ca = db.Column(db.Integer)
    thal = db.Column(db.Integer)
    target = db.Column(db.Integer)

    def __init__(self, age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak,
                 slope, ca, thal, target):
        self.age = age
        self.sex = sex
        self.cp = cp
        self.trestbps = trestbps
        self.chol = chol
        self.fbs = fbs
        self.restecg = restecg
        self.thalach = thalach
        self.exang = exang
        self.oldpeak = oldpeak
        self.slope = slope
        self.ca = ca
        self.thal = thal
        self.target = target


@app.route('/kokoro', methods=['GET'])
def gkokoro():  # put application's code here
    all_entries = kokoro.query.all()
    output = []
    for entry in all_entries:
        cur_entry = {}
        cur_entry['id'] = entry.id
        cur_entry['age'] = entry.age
        cur_entry['sex'] = entry.sex
        cur_entry['cp'] = entry.cp
        cur_entry['trestbps'] = entry.trestbps
        cur_entry['chol'] = entry.chol
        cur_entry['fbs'] = entry.fbs
        cur_entry['restecg'] = entry.restecg
        cur_entry['thalach'] = entry.thalach
        cur_entry['exang'] = entry.exang
        cur_entry['oldpeak'] = entry.oldpeak
        cur_entry['slope'] = entry.slope
        cur_entry['ca'] = entry.ca
        cur_entry['thal'] = entry.thal
        cur_entry['target'] = entry.target
        output.append(cur_entry)
    return jsonify(output)


@app.route('/kokoro', methods=['POST'])
def pkokoro():
    kokoro_data = request.get_json()
    for data in kokoro_data:
        entry = kokoro(
            age=data['age'],
            sex=data['sex'],
            cp=data['cp'],
            trestbps=data['trestbps'],
            chol=data['chol'],
            fbs=data['fbs'],
            restecg=data['restecg'],
            thalach=data['thalach'],
            exang=data['exang'],
            oldpeak=data['oldpeak'],
            slope=data['slope'],
            ca=data['ca'],
            thal=data['thal'],
            target=data['target']
        )
        db.session.add(entry)
        db.session.commit()

    return jsonify(kokoro_data)

@app.route('/')
def hello_world():  # put application's code here
    return 'Hello World!'




if __name__ == '__main__':
    app.run()