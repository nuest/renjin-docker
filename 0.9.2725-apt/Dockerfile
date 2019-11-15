#FROM java:openjdk-8
FROM openjdk:8-jdk-stretch

#root@81e2dbc1c754:/# apt policy renjin
#renjin:
#  Installed: (none)
#  Candidate: 0.9.2725

# https://github.com/bedatadriven/renjin/#debian-and-ubuntu
RUN apt-key adv --keyserver hkp://packages.renjin.org:80 --recv-keys EB2514FC345926E9 && \
  echo deb http://packages.renjin.org/repo/apt stable main | tee /etc/apt/sources.list.d/renjin.list && \
  apt-get update && \
  apt-get install -y --no-install-recommends --fix-missing renjin

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
  org.renjin.version="0.9.2725-apt" \
  org.label-schema.schema-version="rc1" \
  maintainer="Daniel Nüst <daniel.nuest@uni-muenster.de>"

CMD ["renjin"]
