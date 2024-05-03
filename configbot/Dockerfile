FROM confluentinc/cp-base-new as confluent-tools

USER root
RUN curl -O https://packages.confluent.io/archive/7.6/confluent-7.6.1.tar.gz
RUN tar xzf confluent-7.6.1.tar.gz
RUN mv confluent-7.6.1 /usr/local/
ENV PATH="/usr/local/confluent-7.6.1/bin:${PATH}"

FROM confluent-tools as dependencies
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm --assumeyes
RUN yum update --assumeyes && yum install curl gnupg jq vim which cowsay --assumeyes
ENV PATH="/usr/games:${PATH}"

FROM dependencies

COPY ./scripts/ /usr/local/app/bin

## Remove these, these are just examples
COPY ./sample/ /usr/local/app/sample

RUN chmod +x /usr/local/app/*/*.sh

ENV PATH="/usr/local/bin:${PATH}"

ENTRYPOINT [ "/bin/bash", "-c", "/usr/local/app/bin/entrypoint.sh" ]
