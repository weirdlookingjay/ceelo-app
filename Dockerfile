FROM python:2.7-alpine
LABEL maintainer="Joe clark"

RUN apk update && apk add build-base postgresql-dev

ENV INSTALL_PATH /ceelo
RUN mkdir -p ${INSTALL_PATH}

WORKDIR ${INSTALL_PATH}

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
RUN pip install --editable .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "ceelo.app:create_app()"
