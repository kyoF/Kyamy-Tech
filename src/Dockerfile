ARG PYTHON_ENV=python:3.11-slim
FROM $PYTHON_ENV as build

RUN mkdir -p /src
WORKDIR /src
COPY . /src

RUN apt update; apt -y upgrade
RUN apt-get -y install curl
RUN pip install --upgrade pip
RUN pip install poetry

RUN poetry install

EXPOSE 5000
