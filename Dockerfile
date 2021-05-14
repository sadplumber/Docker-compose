FROM ubuntu:18.04
MAINTAINER Mikhail Loginov <sadplumber@gmail.com>
#EXPOSE 80/tcp


# обновляемся и ставим всякое, иногда лишнее, но для отладки нужное, ну и локали
RUN apt-get update && apt-get install -y apt-utils mc telnet curl dialog fontconfig locales iputils-ping apt-transport-https git
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# в соотвествии с заданием
run apt-get install python3

