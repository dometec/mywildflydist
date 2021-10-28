# mywildflydist

A Wildfly distribuition with Eclipse Microprofile using OpenJDK 17.0.1

I created this distribuition using Galleon (4.2.7), following this command:

```
$ ./bin/galleon.sh install wildfly:25.0/final --dir=my-wildfly-dist-3 --default-configs=standalone/standalone.xml --layers=batch-jberet,cloud-server,core-server,cloud-profile,core-tools,ee,jsonp,jsonb,ejb,ejb-dist-cache,elytron-oidc-client,mail,microprofile-platform,web-console
```

The distribuition just installed contains the standalone configurations with microprofile extensions. 

At this point you can create a docker image:

```
$ docker build -t dometec/wildfly:25.0.0.Final-Microprofile .
```
