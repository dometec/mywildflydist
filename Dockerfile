FROM openjdk:17.0.1

ENV WILDFLY_VERSION 25.0.0.Final
ENV JBOSS_HOME /opt/jboss/wildfly

RUN groupadd -r jboss -g 1000 && useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss && \
    chmod 755 /opt/jboss

WORKDIR /opt/jboss
    
USER root

COPY --chown=jboss:jboss wildfly_microprofile/ ${JBOSS_HOME}/

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

USER jboss

EXPOSE 8080 9990

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
