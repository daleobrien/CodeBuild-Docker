FROM amazonlinux
MAINTAINER Dale

RUN echo 'alias ll="ls -la"' > /root/.bashrc
RUN \
   curl https://bootstrap.pypa.io/get-pip.py | python && \
   yum upgrade -y && \
   yum install vim docker -y

COPY requirements.txt .
RUN pip install -r requirements.txt
