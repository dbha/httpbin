FROM harborapp.dha-tkgdemo.net/library/ubuntu:18.04

LABEL name="httpbin"
LABEL version="0.9.2"
LABEL description="A simple HTTP service."
LABEL org.kennethreitz.vendor="Kenneth Reitz"

RUN apt-get update -y && apt-get install python3-pip -y

EXPOSE 8080

ADD . /httpbin

RUN pip3 install --no-cache-dir gunicorn /httpbin

CMD ["gunicorn", "-b", "0.0.0.0:8080", "httpbin:app", "-k", "gevent"]
