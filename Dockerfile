FROM chatwork/helmfile:0.140.0

# Install the toolset.
RUN apk update \
    && pip install awscli \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
    
COPY deploy.sh /usr/local/bin/deploy

CMD deploy