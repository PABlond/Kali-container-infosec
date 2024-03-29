FROM kalilinux/kali-rolling

LABEL maintainer="Pierre-Alexis Blond <pierre-alexis.blond@live.fr>"

# Install Kali (minimal version)
RUN rm -fR /var/lib/apt-get/ && \
    apt-get clean && \
    apt-get update -y && \
    apt-get install -y software-properties-common --fix-missing && \
    echo 'VERSION_CODENAME=kali-rolling' >> /etc/os-release

# Some system tools
RUN apt-get install -y git vim curl telnet less build-essential iputils-ping wget python3-setuptools virtualenv net-tools golang

# Some hacking tools
RUN apt-get install -y nmap netcat nikto tcpdump traceroute arp-scan exploitdb hping3
RUN apt-get install -y wfuzz hydra-gtk gobuster
RUN apt-get install -y sqlmap wpscan metasploit-framework

# Add SecLists
RUN echo 'Downloading danielmiessler/SecLists ...' && \
    git clone https://github.com/danielmiessler/SecLists /usr/share/seclists

# Clean'up!
RUN apt-get autoremove -y && \
    apt-get clean

WORKDIR /root/

RUN virtualenv -p python3 env

CMD ["/bin/bash", "--init-file", "/etc/profile"]
