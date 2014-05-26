# davmail service
#
#

FROM gondoi/davmail
MAINTAINER SH "saffi@xanedu.com"

WORKDIR       /usr/local/davmail/
ADD fix /usr/local/davmail/
RUN chmod a+x /usr/local/davmail/davmail.sh

ENV DISCOVER caldav:80/tcp, imap:143/tcp, ldap:389/tcp, pop3:110/tcp

EXPOSE        80 143 389 110 25
CMD   ["/usr/local/davmail/davmail.properties"]
ENTRYPOINT    ["/usr/local/davmail/davmail.sh"]


