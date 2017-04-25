FROM python:2.7

WORKDIR /crawler

COPY requirements.txt /crawler/requirements.txt
RUN pip install -r requirements.txt

COPY dependencies/python-socket-datacollector_0.1.1-1_all.deb /tmp
RUN dpkg -i /tmp/python-socket-datacollector_*_all.deb && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install softflowd

ADD crawler /crawler

ENTRYPOINT [ "python2.7", "crawler.py" ]
