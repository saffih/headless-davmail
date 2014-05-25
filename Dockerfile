# davmail service
#
# This Dockerfile will build a davmail docker image

FROM gondoi/davmail
MAINTAINER SH "saffi@xanedu.com"
EXPOSE        80 143 389 110 25

ADD fix /usr/local/davmail/
CMD           ["cp", "/usr/local/davmail/fix/*", "/usr/local/davmail/"]
CMD           ["chmod", "a-x", "/usr/local/davmail/davmail.properties"]
CMD           ["chmod", "a+x", "/usr/local/davmail/davmail.sh"]
CMD           ["cp", "/usr/local/davmail/fix/davmail.sh", "/usr/local/davmail/fix/davmail.sh"]
ENTRYPOINT    ["/usr/local/davmail/fix/davmail.sh", "/usr/local/davmail/fix/davmail.propoerties"]

