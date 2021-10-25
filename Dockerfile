FROM alpine:3.13

RUN apk --no-cache add bash curl 
#openssh-client 
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x kubectl
RUN mv kubectl /usr/bin
RUN mkdir /root/.kube

ADD run.sh /run.sh

# Security fix for CVE-2016-0777 and CVE-2016-0778
# RUN echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config

ENTRYPOINT ["sh", "-c", "/run.sh"]
