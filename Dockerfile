FROM rockylinux:8.6


MAINTAINER zangchanglong


RUN mkdir /tmp/thinkboxsetup/ &&\
    sed -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e 's|^#baseurl=http://dl.rockylinux.org/$contentdir|baseurl=https://mirrors.nju.edu.cn/rocky|g' \
    -i.bak \
    /etc/yum.repos.d/Rocky-*.repo &&\
    dnf makecache


COPY ./DeadlineClient-10.*-linux-x64-installer.run /tmp/thinkboxsetup/


RUN dnf install -y redhat-lsb libX11  libXext mesa-libGL && \
    chmod +x /tmp/thinkboxsetup/DeadlineClient-10.*-linux-x64-installer.run && \
    /tmp/thinkboxsetup/DeadlineClient-10.*-linux-x64-installer.run \
    --mode unattended \
    --unattendedmodeui minimal \
    --repositorydir /mnt/DeadlineRepository10 \
    --dbsslcertificate /mnt/DeadlineRepository10/Deadline10Client.pfx \
    --noguimode true \
    --restartstalled true  && \
    rm -rf /tmp/thinkboxsetup


#COPY ./LNX/* /opt/Thinkbox/Deadline10/bin/


HEALTHCHECK --interval=300s --timeout=3s \
	    CMD curl -fs http://127.0.0.1:8082 || exit 1


WORKDIR /opt/Thinkbox/Deadline10/bin/

