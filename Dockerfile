# AWS cli Executor image
#
# VERSION               0.0.1

FROM       quay.io/nuxeoio/iobase
MAINTAINER Nuxeo <contact@nuxeo.com>

RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
  unzip awscli-bundle.zip && \
  rm awscli-bundle.zip && \
  apt-get install -y groff
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/bin/aws
ADD write-awscli-conf.sh /bin/write-awscli-conf.sh
ADD awscli.sh /bin/awscli.sh

ENTRYPOINT ["awscli.sh"]
