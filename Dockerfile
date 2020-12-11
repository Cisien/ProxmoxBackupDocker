FROM debian:buster

#Install dependencies
RUN apt-get update
RUN apt-get install wget sudo ca-certificates -y

#Add repository
RUN echo deb "http://download.proxmox.com/debian/pbs buster pbs-no-subscription" > /etc/apt/sources.list.d/pbs-no-subscription.list
RUN wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg

#Install packages
RUN apt-get update
RUN apt-get install proxmox-backup-server -y

#start!
EXPOSE 8007
COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh
STOPSIGNAL SIGINT
ENTRYPOINT ["/entrypoint.sh"]
