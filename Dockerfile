FROM python:3.10-slim-bullseye
WORKDIR /app
COPY . /app

RUN apt-get update -y && apt-get install -y awscli

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python3", "app.py"]

# docker build -t networksecurity .
# docker run -p 8000:8000 --env-file .env networksecurity