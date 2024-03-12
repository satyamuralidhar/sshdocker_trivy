FROM ubuntu:14.04
ARG DEBIAN_FRONTEND=noninteractive
LABEL NAME="satyamuralidhar"
LABEL MAIL="muralidhar.peddireddi@gmail.com"
ENV USERNAME satya
ENV PASSWORD satya123
RUN mkdir -p /var/run/sshd; \
    apt-get update && apt-get install -y apt-utils && apt-get install -y openssh-server; \
    useradd -d /home/${USERNAME} -g root -G sudo -m -p $(echo "$PASSWORD" | openssl passwd -1 -stdin) $USERNAME; \
    apt-get install tree -y  && apt-get install -y net-tools && apt-get install nginx -y
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]

# docker build -t muralidhar123/nginxssh:v1 .
# trivy image muralidhar123/nginxssh:latest --format table > scan_vul
# docker container run --name nginx -d -p 31282:22 muralidhar123/nginxssh:v1
# docker tag muralidhar123/nginxssh:v1 muralidhar123/nginxssh:latest
# ssh satya@172.17.0.1 -p 31282




