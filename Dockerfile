FROM google/cloud-sdk:alpine

LABEL name="kubectl"
LABEL version="1.0.0"
LABEL com.github.actions.name="kubectl CLI"
LABEL com.github.actions.description="GitHub action with kubectl command"
LABEL com.github.actions.color="green"
LABEL com.github.actions.icon="cloud"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN gcloud components install kubectl

ENTRYPOINT ["/entrypoint.sh"]