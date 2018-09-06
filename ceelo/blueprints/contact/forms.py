from flask_wtf import Form
from wtforms import TextAreaField
from wtforms_components import EmailField
from wtforms.validators import DataRequired, Length

class ContactForm(Form):
    email = EmailField("What's your -email adress?", [DataRequired(), Length(3, 254)])
    message = TextAreaField("What's your question or issue?", [DataRequired(), Length(1, 8192)])