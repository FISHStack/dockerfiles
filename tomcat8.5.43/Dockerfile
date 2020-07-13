#FROM lypgcs/java8:v192
FROM registry.cn-hangzhou.aliyuncs.com/dragonwell/dragonwell8:8.1.1-GA_alpine_x86_64_8u222-b67
#此镜像使用alpine-glibc系统，精简jdk,只运行java程序，无法编译/构建
MAINTAINER liangyuanpeng:2019/7/13
#ENV VERSION=8.5.43
ENV VERSION=8.5.50
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
# -Xms1g \
# -Xmx1g  \
# -Xss512k \
# -Xmn500m \
ENV CATALINA_OPTS=" \
-XX:MetaspaceSize=128m  \
-XX:MaxMetaspaceSize=512m \
-Xloggc:$CATALINA_HOME/logs/gc.log \
-XX:+PrintGCDetails  \
-XX:+PrintGCDateStamps \
-XX:+PrintPromotionFailure \
-XX:-UseBiasedLocking  \
-XX:AutoBoxCacheMax=20000 \ 
-XX:+AlwaysPreTouch  \
-Djava.security.egd=file:/dev/./urandom \
-XX:+ExplicitGCInvokesConcurrent  \
-XX:+ParallelRefProcEnabled  \
-XX:+UseConcMarkSweepGC  \
-XX:CMSInitiatingOccupancyFraction=75  \
-XX:+UseCMSInitiatingOccupancyOnly  \
-XX:-CMSClassUnloadingEnabled  \
-XX:+CMSScavengeBeforeRemark \
-XX:+HeapDumpOnOutOfMemoryError   \
-XX:HeapDumpPath=$CATALINA_HOME/logs  \
-XX:OnOutOfMemoryError=$CATALINA_HOME/bin/stop.sh  \
-XX:ErrorFile=$CATALINA_HOME/logs/hs_err_%p.log  \
-XX:+PrintCommandLineFlags  \
-XX:+PrintFlagsFinal  \
-XX:-OmitStackTraceInFastThrow \
-Duser.timezone=Asia/Shanghai  \
-Djavax.servlet.request.encoding=UTF-8 \
-Djavax.servlet.response.encoding=UTF-8 \
-Dfile.encoding=UTF-8 \
-Duser.country=CN \
-Duser.language=zh \
-Djava.awt.headless=true \
-Dcom.sun.management.jmxremote.port=1099  \
-Dcom.sun.management.jmxremote.ssl=false  \
-Dcom.sun.management.jmxremote.authenticate=false \
-Djava.rmi.server.hostname=www.tomcat.com"
RUN apk update && apk add tzdata 
RUN apk add --no-cache --virtual=build-dependencies wget
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  \
&& echo "Asia/Shanghai" > /etc/timezone 
RUN apk del tzdata
# RUN wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz \
#RUN wget https://www-eu.apache.org/dist/tomcat/tomcat-8/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz \
RUN wget https://smartoilets.cn/files/apache-tomcat-${VERSION}.tar.gz \
&& tar zxf apache-tomcat-${VERSION}.tar.gz \
&& mv apache-tomcat-${VERSION} $CATALINA_HOME \
&& apk del build-dependencies \
&& rm -rf apache-tomcat-${VERSION}.tar.gz $CATALINA_HOME/webapps/* $CATALINA_HOME/bin/*.bat \
&& mkdir $CATALINA_HOME/webapps/ROOT 
# 处理Tomcat启动慢问题（随机数产生器初始化过慢）
#&& sed -i "s#securerandom.source=file:/dev/random#securerandom.source=file:/dev/./urandom#g" $JAVA_HOME/lib/security/java.security
 
WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh", "run"]
