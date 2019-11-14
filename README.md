# renjin-docker

 [![](https://images.microbadger.com/badges/image/nuest/renjin.svg)](https://microbadger.com/images/nuest/renjin "Get your own image badge on microbadger.com") [![Docker Automated build](https://img.shields.io/docker/automated/nuest/renjin.svg)]()

Dockerfiles for automatic builds on Docker Hub for **[Renjin](https://en.wikipedia.org/wiki/Renjin)** ([https://www.renjin.org/](https://www.renjin.org/)), an interpreter for [R](https://en.wikipedia.org/wiki/R_(programming_language)) built on the [Java Virtual Machine](https://en.wikipedia.org/wiki/Java_virtual_machine).

Images on Docker Hub: [https://hub.docker.com/r/nuest/renjin](https://hub.docker.com/r/nuest/renjin)

## Run Renjin in container

By default, the image is set up to [use Renjin interactively](http://docs.renjin.org/en/latest/interactive/index.html) and an R session is automatically started.

```bash
docker run -it --rm nuest/renjin
> R.version
> q()
```

Stopping the session also stops the container.

You can also start renjin manually and see how R packages are automatically loaded when using `library(..)` and installed into `~/.m2/repository/org/renjin/cran/`.

```
$ docker run -it nuest/renjin /bin/bash
# renjin

> library("dplyr")
> mtcars$amfactor <- factor(mtcars$am, labels = c("automatic", "manual"))
> summary(lm(mpg ~ factor(amfactor), data = mtcars))$coef
> quit()

# ls /root/.m2/repository/org/renjin/cran/
# exit
```

(Demo code based on based https://rpubs.com/davoodastaraky/mtRegression.)

## Local build

Go into the version directory, then:

```bash
docker build --tag renjin .
docker run -it renjin
```

## Versions

Different Renjin versions are supported as tags.
The most recent version is taken from the [Renjin Nexus](https://nexus.bedatadriven.com/#view-repositories;public~browsestorage~org.renjin), see `org.renjin.renjin-debian-package`.
You can pull all tags to your local machine to get a list of available versions:


```bash
docker pull -a nuest/renjin
docker images | grep nuest/renjin
```

## License

Renjin is available under the GPLv2 (or higher) license, see LICENSE for the full text of the license.

Code files in this repository are published under GPLv2 (or higher) and are Copyright (C) 2017 Daniel Nüst.
