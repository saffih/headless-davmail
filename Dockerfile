# davmail service
#
# This Dockerfile will build a davmail docker image
# todo base 9n orig davmailimage
FROM ubuntu:12.04
MAINTAINER saffi

RUN           apt-get update
RUN           apt-get install -y default-jre wget
RUN           apt-get clean
RUN           mkdir /usr/local/davmail
RUN           wget -O - http://downloads.sourceforge.net/project/davmail/davmail/4.3.3/davmail-linux-x86_64-4.3.3-2146.tgz | tar -C /usr/local/davmail --strip-components=1 -xvz

# Cleanup for a smaller image
RUN apt-get clean
RUN rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/*

#VOLUME        /etc/davmail
EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
# headless start heare
EXPOSE        80
EXPOSE        143
EXPOSE        389
EXPOSE        110
EXPOSE        25

WORKDIR       /usr/local/davmail
ADD davmail /usr/local/davmail/

RUN chmod  a+x davmail/davmail.sh
RUN cp davmail/davmail.sh .
RUN chmod a+x davmail.sh
RUN cp davmail/davmail.properties .
#run cp davmail/davmail.properties .
# ADD davmail/davmail.properties /usr/local/davmail/
CMD           ["/etc/davmail/davmail.properties"]
ENTRYPOINT    ["/usr/local/davmail/davmail.sh", "/usr/local/davmail/davmail.properties"]
