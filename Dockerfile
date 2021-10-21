FROM alpine:3.13

RUN apk --no-cache add openssh-client bash

ADD run.sh /run.sh

# Security fix for CVE-2016-0777 and CVE-2016-0778
RUN echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config

ENTRYPOINT ["sh", "-c", "/run.sh"]