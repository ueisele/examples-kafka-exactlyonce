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

# Builds a docker image for the Confluent Schema Registry.

FROM confluentinc/cp-base

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

ENV COMPONENT=schema-registry

# Default listener
EXPOSE 8081

WORKDIR opt
COPY src /opt/schema-registry

RUN echo "===> installing ${COMPONENT}..." \
    && echo "===> Setting up ${COMPONENT} dirs" \
    && mkdir -p /etc/${COMPONENT}/secrets\
    && chmod -R ag+w /etc/${COMPONENT} /etc/${COMPONENT}/secrets

VOLUME ["/etc/${COMPONENT}/secrets"]

COPY include/etc/confluent/docker /etc/confluent/docker

CMD ["/etc/confluent/docker/run"]
