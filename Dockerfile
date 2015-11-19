FROM tehranian/dind-jenkins-slave

RUN curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN curl -O https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.5.1.linux-amd64.tar.gz
RUN rm -rf go1.5.1.linux-amd64.tar.gz
RUN su - jenkins -c 'mkdir -p ~/go; echo "export GOPATH=$HOME/go" >> ~/.bashrc;echo "export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin" >> ~/.bashrc'

RUN su - jenkins -c 'export GOPATH=$HOME/go; export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin;go get github.com/tools/godep'
