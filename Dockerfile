FROM python:2.7

RUN mkdir /flask-app
WORKDIR /flask-app
COPY app /flask-app
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
EXPOSE 5000
ENTRYPOINT ["python", "web_app.py"]