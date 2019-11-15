FROM openjdk:11-jdk-slim-buster

ARG RENJIN_VERSION=${RENJIN_VERSION:-0.8.2413}
ENV RENJIN_VERSION=${RENJIN_VERSION}

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
        curl \
        unzip

WORKDIR /opt
RUN curl -L -o renjin.zip -# "https://nexus.bedatadriven.com/service/local/artifact/maven/redirect?r=renjin-release&g=org.renjin&a=renjin-generic-package&v=${RENJIN_VERSION}&e=zip" && \
  unzip renjin.zip && \
  rm renjin.zip
ENV PATH /opt/renjin-$RENJIN_VERSION/bin:$PATH

# Add image metadata
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE
LABEL org.label-schema.license="https://github.com/bedatadriven/renjin/blob/master/LICENSE.txt" \
    org.label-schema.vendor="BeDataDriven, Dockerfile provided by Daniel Nüst" \
	org.label-schema.name="Renjin" \
	org.label-schema.description="JVM-based interpreter for the R language for the statistical analysis." \ 
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.build-date=$BUILD_DATE \
    org.renjin.version="0.8.2413" \
    org.label-schema.schema-version="rc1" \
    maintainer="Daniel Nüst <daniel.nuest@uni-muenster.de>"

CMD ["renjin"]
