FROM rockylinux:8.6


RUN sed -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e 's|^#baseurl=http://dl.rockylinux.org/$contentdir|baseurl=https://mirrors.sdu.edu.cn/rocky|g' \
    -i.bak \
    /etc/yum.repos.d/[Rr]ocky*.repo &&\
    dnf makecache &&\

    dnf install -y epel-release &&\
    sed -e 's!^metalink=!#metalink=!g' \
    -e 's!^#baseurl=!baseurl=!g' \
    -e 's!//download\.fedoraproject\.org/pub!//mirrors.tuna.tsinghua.edu.cn!g' \
    -e 's!//download\.example/pub!//mirrors.tuna.tsinghua.edu.cn!g' \
    -e 's!http://mirrors!https://mirrors!g' \
    -i /etc/yum.repos.d/epel*.repo &&\
    dnf makecache


RUN  mkdir /tmp/thinkboxsetup/
COPY DeadlineClient-10.*-linux-x64-installer.run /tmp/thinkboxsetup/


RUN dnf install -y redhat-lsb libX11  libXext mesa-libGL supervisor && \
    chmod +x /tmp/thinkboxsetup/DeadlineClient-10.*-linux-x64-installer.run && \
    /tmp/thinkboxsetup/DeadlineClient-10.*-linux-x64-installer.run \
    --mode unattended \
    --unattendedmodeui minimal \
    --repositorydir /mnt/DeadlineRepository10 \
    --dbsslcertificate /mnt/DeadlineRepository10/Deadline10Client.pfx \
    --noguimode true \
    --restartstalled true  && \
    rm -rf /tmp/thinkboxsetup

