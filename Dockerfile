FROM tehranian/dind-jenkins-slave

RUN curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN curl -O https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.5.1.linux-amd64.tar.gz
RUN rm -rf go1.5.1.linux-amd64.tar.gz
RUN su - jenkins -c 'mkdir -p ~/go'
ADD .bashrc /home/jenkins/.bashrc
RUN apt-get update
RUN apt-get install -y gcc
RUN apt-get install -y mercurial
RUN su - jenkins -c 'source ~/.bashrc;go get github.com/tools/godep;go get github.com/mattes/migrate;  go get bitbucket.org/tebeka/go2xunit'
ADD .gitconfig /home/jenkins/.gitconfig
