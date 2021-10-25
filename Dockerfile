FROM alpine:3.13

RUN apk --no-cache add bash curl 
#openssh-client 
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x kubectl
RUN mv kubectl /usr/bin
RUN mkdir /root/.kube

ADD run.sh /run.sh`

ENTRYPOINT ["sh", "-c", "/run.sh"]
