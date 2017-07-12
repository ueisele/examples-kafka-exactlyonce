#
# Copyright 2016 Confluent Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM confluentinc/cp-base:latest

ARG COMMIT_ID=unknown
LABEL io.confluent.docker.git.id=$COMMIT_ID
ARG BUILD_NUMBER=-1
LABEL io.confluent.docker.build.number=$BUILD_NUMBER

ENV SCALA_VERSION="2.12"
ENV CONFLUENT_MAJOR_VERSION="3"
ENV CONFLUENT_MINOR_VERSION="3"

ENV CONFLUENT_PATCH_VERSION="0"
ENV CONFLUENT_VERSION="$CONFLUENT_MAJOR_VERSION.$CONFLUENT_MINOR_VERSION.$CONFLUENT_PATCH_VERSION"
ENV CONFLUENT_DEB_VERSION="1"

ENV KAFKA_VERSION="0.11.0.0"

MAINTAINER partner-support@confluent.io
LABEL io.confluent.docker=true

ENV COMPONENT=kafka

# primary
EXPOSE 9092

WORKDIR opt

RUN echo "===> installing ${COMPONENT}..." \
    && wget http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && tar -xf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    \
    && echo "===> clean up ..."  \
    && rm kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    \
	&& echo "===> Setting up ${COMPONENT} dirs..." \
   	&& mkdir -p /var/lib/${COMPONENT}/data /etc/${COMPONENT}/secrets\
   	&& chmod -R ag+w /etc/${COMPONENT} /var/lib/${COMPONENT}/data /etc/${COMPONENT}/secrets


VOLUME ["/var/lib/${COMPONENT}/data", "/etc/${COMPONENT}/secrets"]

COPY include/etc/confluent/docker /etc/confluent/docker

CMD ["/etc/confluent/docker/run"]
