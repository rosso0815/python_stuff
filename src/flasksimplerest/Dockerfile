FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=app.py 
ENV FLASK_PORT=8080
ENV FLASK_ENV=development

EXPOSE 8080/tcp

CMD [ "python3", "app.py"]
