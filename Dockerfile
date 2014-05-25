# davmail service
#
# This Dockerfile will build a davmail docker image

FROM gondoi/davmail
MAINTAINER SH "saffi@xanedu.com"

WORKDIR       /usr/local/davmail
ADD fix/ /usr/local/davmail/
CMD           ["chmod", "a+x", "/usr/local/davmail/davmail.sh"]
ENTRYPOINT    ["/usr/local/davmail/davmail.sh", "/usr/local/davmail/davmail.propoerties"]

