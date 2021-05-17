FROM python:3.6-alpine
MAINTAINER Mikhail Loginov <sadplumber@gmail.com>
EXPOSE 5000/tcp

COPY /opt /opt/

RUN apk add --no-cache postgresql-dev gcc python3 musl-dev


WORKDIR /opt/python-sample-app/
RUN pip3 install -r requirements.txt

ENV FLASK_APP=app.py
#ENV POSTGRESQL_URL=postgresql://postgres:worker@192.168.1.157/postgres
ENV POSTGRESQL_URL=postgresql://worker:worker@192.168.1.157/app

RUN flask db upgrade

CMD ["flask", "run", "--host=0.0.0.0"]
#CMD: ["/opt/wait-for-it/wait-for-postgres.sh", "worker:192.168.1.157", "--", "python", "app.py"]