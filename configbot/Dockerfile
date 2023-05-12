FROM confluentinc/cp-base-new

## we're professional
USER root

## basics
RUN yum update --assumeyes && yum install curl gnupg jq vim which --assumeyes
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm --assumeyes
RUN yum update && yum install cowsay --assumeyes

## confluent stuff
RUN curl -O https://packages.confluent.io/archive/7.4/confluent-7.4.0.tar.gz
RUN tar xzf confluent-7.4.0.tar.gz
RUN mv confluent-7.4.0 /usr/local/

COPY ./scripts/ /usr/local/app/bin
RUN chmod +x /usr/local/app/bin/*.sh

ENV PATH="/usr/local/bin:/usr/local/confluent-7.4.0/bin:/usr/games:${PATH}"

ENTRYPOINT [ "/bin/bash", "-c", "/usr/local/app/bin/entrypoint.sh" ]