FROM python:3.8

RUN python3 --version
RUN pip3 --version

WORKDIR /app
COPY ./app /app

RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get install openssl
RUN pip install gunicorn

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]