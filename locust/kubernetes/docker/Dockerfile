FROM python:3.6.6-alpine3.8

RUN apk --no-cache add g++ \ 
      && apk --no-cache add zeromq-dev \
      && pip install locustio pyzmq

COPY run.sh /locust/run.sh
RUN chmod 755 /locust/run.sh

EXPOSE 8089 5557 5558

ENTRYPOINT ["/locust/run.sh"]