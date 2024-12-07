FROM python:3.10

RUN mkdir /app
WORKDIR /app
ADD . /app/
RUN pip install -r requirements.txt

# ENV FLASK_APP=application.py
# ENV FLASK_RUN_HOST=localhost
# ENV FLASK_RUN_PORT=8080

EXPOSE 8080
CMD ["python", "main.py"]