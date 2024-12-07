FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=web.py 
ENV FLASK_ENV=development
EXPOSE 8080/tcp

CMD [ "python", "web.py"]