FROM ubuntu:18.04
MAINTAINER Mikhail Loginov <sadplumber@gmail.com>
EXPOSE 5000/tcp


# обновляемся и ставим всякое, иногда лишнее, но для отладки нужное, ну и локали
RUN apt-get update && apt-get install -y apt-utils mc telnet curl dialog fontconfig locales iputils-ping apt-transport-https wget ca-certificates
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# в соотвествии с заданием
RUN apt-get install python3

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

COPY /apt /etc/apt/sources.list.d/
RUN apt-get update && apt-get install -y postgresql-11

COPY /opt /opt/
RUN pip install -r /opt/python-sample-app/requirements.txt

ENV FLASK_APP=app.py
ENV POSTGRESQL_URL=postgresql://worker:worker@localhost/app

RUN flask db upgrade

ENTRYPOINT ["python3", "app.py"]
 