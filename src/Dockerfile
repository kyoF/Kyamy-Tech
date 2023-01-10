ARG PYTHON_ENV=python:3.11-slim

FROM $PYTHON_ENV as build

ENV PATH="/opt/poetry/bin:$PATH"

RUN mkdir -p /src
WORKDIR /src

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        curl

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

COPY poetry.lock pyproject.toml ./

RUN poetry install

COPY . /src

CMD ["poetry", "run", "python", "run.py"]

EXPOSE 5000
