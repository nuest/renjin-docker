# Dockerfile with geospatial packages installed...
FROM renjin:builder

RUN apt-get update && \
  apt-get install -y \
    # units
    libudunits2-dev

RUN renjin -e "library('org.renjin.cran:Rcpp'); q()"

WORKDIR /packages/units
RUN wget https://cran.r-project.org/src/contrib/units_0.6-5.tar.gz && \
  tar -xf units_0.6-5.tar.gz

COPY units/pom.xml units/pom.xml
WORKDIR /packages/units/units
#RUN mvn clean install
