FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/* 
RUN wget -O- https://aka.ms/install-vscode-server/setup.sh | sh


# COPY --from=builder /usr/local/bin/code-server /usr/local/bin/code-server
EXPOSE 8000
ENV VSCODE_SERVER_DATA_DIR="/var/lib/vscode-server"
ARG VSCODE_SERVER_COMMIT_ID=ee2b180d582a7f601fa6ecfdad8d9fd269ab1884

VOLUME ${VSCODE_SERVER_DATA_DIR}
RUN mkdir -p ${VSCODE_SERVER_DATA_DIR} && chmod 777 ${VSCODE_SERVER_DATA_DIR}

# uses https://update.code.visualstudio.com/api/latest/server-linux-x64-web/stable to get latest version
HEALTHCHECK  --interval=5m --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8000/ || exit 1

# RUN code-server serve-local --without-connection-token --accept-server-license-terms --commit-id=${VSCODE_SERVER_COMMIT_ID} --install-extension=redhat.vscode-yaml

# RUN ["code-server", "serve-local", "--host=localhost", "--without-connection-token", "--accept-server-license-terms", "--port=8000", "--commit-id=${VSCODE_SERVER_COMMIT_ID}", "--install-extension=redhat.vscode-yaml"]
# start with docker run --rm -it -p 8000:8000 vscode-server code-server --help
CMD ["code-server", "serve-local", "--host=0.0.0.0", "--without-connection-token", "--accept-server-license-terms", "--port=8000", "--commit-id=ee2b180d582a7f601fa6ecfdad8d9fd269ab1884"]
# CMD code-server --accept-server-license-terms