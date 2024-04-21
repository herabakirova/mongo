# Kubectl image creation
# Use an official Alpine Linux as a base image
FROM alpine:latest

# Set the environment variables
ENV KUBE_LATEST_VERSION="v1.23.0"

# Install required packages
RUN apk add --no-cache ca-certificates bash git openssh curl

# Install kubectl from the official source
RUN curl -LO "https://dl.k8s.io/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# Verify the installed binary
RUN kubectl version --client

# Optional: Add a non-root user
RUN adduser -D kubectluser
USER kubectluser

# Set the working directory in the container
WORKDIR /home/kubectluser

# The command the container executes by default when you launch the built image.
CMD ["kubectl", "--help"]
