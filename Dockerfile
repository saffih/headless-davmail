# davmail service
#
# This Dockerfile will build a davmail docker image

FROM gondoi/davmail
MAINTAINER SH "saffi@xanedu.com"
EXPOSE        80 143 389 110 25

ADD ./fix/ /usr/local/davmail/
ADD ./fix /usr/local/davmail/
WORKDIR       /usr/local/davmail
RUN cp /usr/local/davmail/fix/davmail.sh /usr/local/davmail/
RUN cp /usr/local/davmail/fix/davmail.properties /usr/local/davmail/

CMD           ["chmod", "a+x", "/usr/local/davmail/davmail.sh"]
ENTRYPOINT    ["/usr/local/davmail/davmail.sh", "/usr/local/davmail/davmail.propoerties"]

