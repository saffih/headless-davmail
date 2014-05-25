#!/bin/sh
# Ubuntu setup instructions :
# install java :
# sudo apt-get install default-jre
# launch davmail
BASE=`dirname $0`
for i in $BASE/lib/*; do export CLASSPATH=$CLASSPATH:$i; done
# -Djava.awt.headless=true
TOEXE="exec java -Xmx512M
 -Dsun.net.inetaddr.ttl=60 -cp $BASE/davmail.jar:$CLASSPATH davmail.DavGateway $1"
PROPS=$1
echo ============= call ==============
echo $TOEXE
echo ============= props =============
cat $PROPS
echo =================================
$TOEXE
echo =================================

