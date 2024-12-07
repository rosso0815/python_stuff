FROM python:3.8.6-slim-buster as base
MAINTAINER Peter Mooring peterpm@xs4all.nl peter@petermooring.com

FROM base as builder

# get requirements.txt for this container
ARG REQUIREMENTS_TXT

RUN apt-get update \
    && apt-get install gcc -y \
    && apt-get clean

WORKDIR /

COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip

RUN pip install -r /requirements.txt

FROM base

RUN apt-get update -y

COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages/
COPY --from=builder /usr/local/bin /usr/local/bin/

# create and set working directory
RUN mkdir -p /home/flask/project
WORKDIR /home/flask/project

COPY . ./

ENTRYPOINT ["python3"]
CMD ["run.py"]
