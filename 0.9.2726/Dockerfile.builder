# Need gcc-4.7, see also https://github.com/bedatadriven/renjin/blob/master/Vagrantfile
FROM ubuntu:xenial

ARG RENJIN_VERSION=${RENJIN_VERSION:-0.9.2726}
ENV RENJIN_VERSION=${RENJIN_VERSION}

# https://gist.github.com/akbertram/ed4257989eccc0a18e21f5bd2550e039
# https://github.com/perNyfelt/renjinSamplesAndTests/tree/master/ctsmr
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    build-essential \
    maven \
    openjdk-8-jdk \
    gcc-4.7 g++-4.7 gcc-4.7-plugin-dev gfortran-4.7 gcc-4.7.multilib g++-4.7-multilib \
    unzip \
    curl \
    wget

WORKDIR /opt
RUN curl -L -o renjin.zip -# "https://nexus.bedatadriven.com/service/local/artifact/maven/redirect?r=renjin-release&g=org.renjin&a=renjin-generic-package&v=${RENJIN_VERSION}&e=zip" && \
  unzip renjin.zip && \
  rm renjin.zip
ENV PATH /opt/renjin-$RENJIN_VERSION/bin:$PATH

LABEL org.label-schema.license="https://github.com/bedatadriven/renjin/blob/master/LICENSE.txt" \
  org.label-schema.vendor="BeDataDriven, Dockerfile provided by Daniel Nüst" \
	org.label-schema.name="Renjin" \
	maintainer="Daniel Nüst <daniel.nuest@uni-muenster.de>"

#CMD ["renjin"]
