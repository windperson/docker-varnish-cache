FROM centos:7

RUN yum install -y deltarpm epel-release \
 && yum update -y \
 && rpm --nosignature -i https://repo.varnish-cache.org/redhat/varnish-4.1.el7.rpm \
 && yum install -y varnish \
 && yum clean all

ADD start.sh /start.sh
RUN chmod +x /start.sh

ENV VCL_CONFIG=/etc/varnish/default.vcl CACHE_SIZE=64m VARNISHED_PARAMS="-p default_ttl=3600 -p default_grace=3600"
EXPOSE 80
CMD /start.sh
