FROM centos:7

MAINTAINER zangchanglong

RUN mkdir /tmp/thinkboxsetup/

COPY ./DeadlineClient-10.*-linux-x64-installer.run /tmp/thinkboxsetup/

RUN yum install -y redhat-lsb libx11  libXext mesa-libGL && \
    /tmp/thinkboxsetup/DeadlineClient-10.*-linux-x64-installer.run \
    --mode unattended \
    --unattendedmodeui minimal \
    --repositorydir /mnt/DeadlineRepository10 \
    --dbsslcertificate /mnt/DeadlineRepository10/Deadline10Client.pfx \
    --noguimode true \
    --restartstalled true  && \
    rm -rf /tmp/thinkboxsetup

COPY ./LNX/* /opt/Thinkbox/Deadline10/bin/

WORKDIR /opt/Thinkbox/Deadline10/bin/
