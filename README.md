# mywildflydist
A Wildfly distribuition with microprofile and keycloak included

I created this distribuition using Galleon (4.2.6), following this command:

$ ./bin/galleon.sh install wildfly:23.0/final --dir=my-wildfly-dist --default-configs=standalone/standalone.xml

After that, I add the microprofile-platform layer:

$ ./bin/galleon.sh 
[galleon-4.2.6.Final]$ state edit my-wildfly-dist
Feature-packs resolved. 
Feature-packs resolved. 
Feature-packs resolved. 
Entering provisioning edit mode.Use 'add-dependency' command to add feature packs. Call 'leave-state' to leave this state.

[!edit!my-wildfly-dist!/]$ include-layers standalone/standalone.xml --layers=microprofile-platform
Feature-packs resolved.
[!edit!my-wildfly-dist!/]$ provision --dir=my-wildfly-dist
Feature-packs resolved.
Packages installed.
JBoss modules installed.
Configurations generated.
Installation done in /home/dometec/Scaricati/galleon-4.2.6.Final/my-wildfly-dist

[!edit!my-wildfly-dist!/]$ exit

The distribuition just installed contains the standalone configurations with microprofile extensions. 
Now unzip the wildfly keycloak adapter in this folder and start the server.

$ cd my-wildfly-dist
$ unzip keycloak-wildfly-adapter-dist-12.0.4.zip
$ ./bin/standalone.sh

In another shell execute the cli to install keycloak adapter:

$ cd bin
$ ./jboss-cli.sh -c --file=adapter-elytron-install.cli

At this point you can create a docker image:

$ docker build -t dometec/wildfly:23.0.0.Final-Microprofile-Keycloak .
