FROM python:2.7-alpine
LABEL maintainer="Joe clark"

ENV INSTALL_PATH /ceelo
RUN mkdir -p ${INSTALL_PATH}

WORKDIR ${INSTALL_PATH}

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "ceelo.app:create_app()"
