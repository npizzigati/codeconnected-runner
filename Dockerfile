FROM ubuntu:22.04
RUN apt update
RUN apt -y install curl
RUN apt -y install sudo
RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - 
RUN apt -y install nodejs
RUN apt -y install ruby
RUN apt -y install pry
RUN apt -y install nano 
RUN apt -y install vim
RUN apt -y install screen

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN apt -y install postgresql postgresql-contrib

RUN apt -y install locales
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN groupadd codeuser && useradd -m codeuser -g codeuser
WORKDIR /usr/bin 
COPY ./custom-node-launcher ./custom-node-launcher 
RUN chmod +x ./custom-node-launcher
RUN echo 'alias node=/usr/bin/custom-node-launcher' >> /home/codeuser/.bashrc
WORKDIR /home/codeuser
COPY ./pryrc ./.pryrc
WORKDIR /tmp
COPY ./docker-entrypoint.sh . 
# USER codeuser:codeuser

# ENTRYPOINT ["sh", "docker-entrypoint.sh", "su", "-", "codeuser", "-c", "bash"]
ENTRYPOINT ["bash", "docker-entrypoint.sh", "su", "-", "codeuser", "-c"]

