FROM java:openjdk-8
#FROM openjdk:8-jdk-slim-buster and 8-jdk-stretch do not have java6-runtime, which is needed by renjin-debian-package-...deb

ENV RENJIN_VERSION=0.9.2726

# Switch to archived jessie backports: https://stackoverflow.com/questions/58001628/public-key-is-not-available-no-pubkey-f76221572c52609d
RUN echo 'deb http://archive.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys AA8E81B4331F7F50

# Install requirements and download & install .deb packge for Renjin, ignoring the outdated Jessie sources
WORKDIR /tmp
RUN apt-get -o Acquire::Check-Valid-Until=false update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
        curl \
        # Renjin requirements which are not resolved automatically:
        libblas3 \
        java-wrappers

RUN curl -LO -# https://nexus.bedatadriven.com/service/local/repositories/renjin-release/content/org/renjin/renjin-debian-package/$RENJIN_VERSION/renjin-debian-package-$RENJIN_VERSION.deb
RUN dpkg -i renjin-debian-package-$RENJIN_VERSION.deb

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
    org.renjin.version="0.9.2726" \
    org.label-schema.schema-version="rc1" \
    maintainer="Daniel Nüst <daniel.nuest@uni-muenster.de>"

CMD ["renjin"]
