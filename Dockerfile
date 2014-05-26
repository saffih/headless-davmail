# davmail service
#
# This Dockerfile will build a davmail docker image

FROM gondoi/davmail
MAINTAINER SH "saffi@xanedu.com"
#EXPOSE        80 143 389 110 25

ADD fix/ /usr/local/davmail/
RUN chmod a+x /usr/local/davmail/davmail.sh
#RUN chmod 777 /usr/local/davmail/davmail.properties
#ADD fix/davmail.properties /usr/local/davmail/davmail.properties

CMD           ["/usr/local/davmail/davmail.properties"]
#ENV DISCOVER caldav:80/tcp, imap:143/tcp, ldap:389/tcp, pop3:110/tcp
EXPOSE      25  80 143 389 110 1025  1080 1143 1389 1110
ENTRYPOINT    ["/usr/local/davmail/davmail.sh"]
#ENTRYPOINT    ls -la /usr/local/davmail/
