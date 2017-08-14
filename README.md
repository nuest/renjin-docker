# renjin-docker

Dockerfiles for automatic builds on Docker Hub for Renjin, an interpreter for R built on the Java Virtual Machine.

For more information on **Renjin**, please visit http://www.renjin.org.

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

# based on https://rpubs.com/davoodastaraky/mtRegression
> mtcars$amfactor <- factor(mtcars$am, labels = c("automatic", "manual"))
> summary(lm(mpg ~ factor(amfactor), data = mtcars))$coef

                                Estimate        Std. Error           t value          Pr(>|t|)
           (Intercept) 17.14736842105263  1.12460254124398 15.24749215139154                 0
factor(amfactor)manual  7.24493927125506   1.7644216316428  4.10612698310069  0.00028502074394
> quit()

# ls /root/.m2/repository/org/renjin/cran/
# exit
```

## Local build

Go into the version directory, then:

```bash
docker run --tag renjin .
```

## License

Renjin is available under the GPLv2 (or higher) license, see LICENSE for the full text of the license.

Code files in this repository are published under GPLv2 (or higher) and are Copyright (C) 2017 Daniel Nüst.
