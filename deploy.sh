#!/bin/bash

killTomcat(){
   pid=`ps -ef|grep tomcat|grep java|awk '{print $2}'`
   echo "tomcat id list :$pid"
   if ["$pid"=""]
   then
	echo "no tomcat pid value."
   else
	kill -9 $pid
   fi
}

cd $PROJ_PATH/TestWebProjcet
mvn clean install

killTomcat

rm -rf $TOMCAT_APP_PATH/webapps/TestWebProjcet
rm -rf $TOMCAT_APP_PATH/webapps/TestWebProjcet.war

cp $PROJ_PATH/TestWebProjcet/target/TestWebProjcet.war $TOMCAT_APP_PATH/webapps/

cd $TOMCAT_APP_PATH/
sh bin/startup.sh