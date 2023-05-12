FROM confluentinc/cp-base-new as confluent-tools

USER root
RUN curl -O https://packages.confluent.io/archive/7.4/confluent-7.4.0.tar.gz
RUN tar xzf confluent-7.4.0.tar.gz
RUN mv confluent-7.4.0 /usr/local/
ENV PATH="/usr/local/confluent-7.4.0/bin:${PATH}"

FROM confluent-tools as dependencies
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm --assumeyes
RUN yum update --assumeyes && yum install curl gnupg jq vim which cowsay --assumeyes
ENV PATH="/usr/games:${PATH}"

FROM dependencies

COPY ./scripts/ /usr/local/app/bin
RUN chmod +x /usr/local/app/bin/*.sh

ENV PATH="/usr/local/bin:${PATH}"

ENTRYPOINT [ "/bin/bash", "-c", "/usr/local/app/bin/entrypoint.sh" ]