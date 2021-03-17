FROM jboss/base-jdk:11

ENV WILDFLY_VERSION 23.0.0.Final
ENV JBOSS_HOME /opt/jboss/wildfly

USER root

COPY --chown=jboss:jboss wildfly_microprofile_keycloak/ ${JBOSS_HOME}/

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

USER jboss

EXPOSE 8080 9990

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
