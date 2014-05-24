# davmail service
#
# This Dockerfile will build a davmail docker image

FROM gondoi/davmail
MAINTAINER SH

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025

EXPOSE        80
EXPOSE        143
EXPOSE        389
EXPOSE        110
EXPOSE        25

WORKDIR       /usr/local/davmail
ADD davmail /usr/local/davmail/

#CMD  ["cp", "davmail/davmail.sh", "."]
CMD  ["chmod", "a+x", "davmail.sh"]
CMD  ["cp", "davmail/davmail.properties", "."]
#run cp davmail/davmail.properties .
# ADD davmail/davmail.properties /usr/local/davmail/
#CMD           ["/etc/davmail/davmail.properties"]
#ENTRYPOINT    ["/usr/local/davmail/davmail.sh", "/usr/local/davmail/davmail.properties"]