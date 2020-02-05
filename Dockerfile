FROM google/cloud-sdk:alpine

LABEL name="kubectl"
LABEL version="1.0.0"
LABEL com.github.actions.name="kubectl CLI"
LABEL com.github.actions.description="GitHub action with kubectl command"
LABEL com.github.actions.color="green"
LABEL com.github.actions.icon="cloud"

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]