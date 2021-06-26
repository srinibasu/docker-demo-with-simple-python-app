FROM python:2.7
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/appCOPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
COPY . /usr/src/app
ENV PORT 8080
EXPOSE $PORT
VOLUME ["/app-data"]
CMD gunicorn -b :$port -c gunicorn.conf.py main:app
