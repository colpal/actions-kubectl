#!/bin/sh

set -e

if [ -z "${GCP_CREDENTIALS-}" ]; then
    echo "GCP_CREDENTIALS not found. Exiting."
    exit 1
fi
if [ -z "${GCP_PROJECT-}" ]; then
    echo "GCP_PROJECT not found. Exiting."
    exit 1
fi
if [ -z "${GKE_CLUSTER_NAME-}" ]; then
    echo "GKE_CLUSTER_NAME not found. Exiting."
    exit 1
fi

echo "$GCP_CREDENTIALS" | base64 -d > /tmp/service_account.json

gcloud auth activate-service-account --key-file=/tmp/service_account.json

gcloud config set project "$GCP_PROJECT"

CZONE=$(gcloud container clusters list --format="get(location)" --filter="name=$GKE_CLUSTER_NAME")

gcloud container clusters get-credentials $GKE_CLUSTER_NAME --zone $CZONE --project $GCP_PROJECT
gcloud components install kubectl

sh -c "kubectl $*"