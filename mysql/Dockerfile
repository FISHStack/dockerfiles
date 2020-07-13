FROM mysql:5.7.28
 
MAINTAINER smartoilets
 
# 数据库名
ENV MYSQL_DATABASE smartoilets
 
# 默认根用户密码
ENV MYSQL_ROOT_PASSWORD smartoilets
 
# 拷贝初始化sql脚本
COPY ./sql-scripts/ /docker-entrypoint-initdb.d/