# psas

FROM centos:7

MAINTAINER Yury Kavaliou <yury_kavaliou@epam.com>

ENV NGINX_WWW /usr/share/nginx/html

RUN yum update
RUN yum -y install wget

WORKDIR /tmp
RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install ./epel-release-latest-*.noarch.rpm

RUN yum -y install \
    python \
    python-devel \
    build-base \
    linux-headers \
    pcre-devel \
    python-pip \
    nginx \
    gcc

RUN yum -y install ncurses-devel; yum clean all
RUN yum -y install ldb-tools; yum clean all
RUN yum -y install libdb-devel
RUN updatedb; yum clean all

RUN wget http://packages.psychotic.ninja/7/base/x86_64/RPMS/psychotic-release-1.0.0-1.el7.psychotic.noarch.rpm
RUN rpm -Uvh psychotic-release*rpm
RUN yum -y --enablerepo=psychotic install open-cobol

RUN pip install --upgrade pip
RUN pip install uwsgi flask supervisor

RUN mkdir ${NGINX_WWW}/logs
RUN mkdir ${NGINX_WWW}/app
RUN mkdir /var/log/uwsgi

COPY ./files/nginx.conf /etc/nginx/nginx.conf
COPY ./files/nginx-psas.conf /etc/nginx/conf.d/
COPY ./files/supervisord.conf /etc/supervisord.conf

COPY ./files/app ${NGINX_WWW}/app

WORKDIR ${NGINX_WWW}/app

EXPOSE 80

CMD ["/usr/bin/supervisord"]