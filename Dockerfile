FROM amazonlinux:2018.03

WORKDIR /app
RUN yum groupinstall -y "Development Tools"
RUN yum install -y kernel-devel kernel-headers
RUN yum install -y shadow-utils
RUN yum install -y sudo
RUN yum install -y vim emacs
RUN yum install -y git
RUN git clone https://github.com/tagomoris/xbuild.git
RUN xbuild/perl-install 5.26.1 ~/perl-5.26.1/
RUN curl -L https://cpanmin.us | perl - App::cpanminus
RUN cpanm LWP::UserAgent
CMD /bin/bash
