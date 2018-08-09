#!/bin/sh

cat > Dockerfile <<EOF
FROM $OCIR_DOCKER_REPO/node:4.4
EXPOSE 8080
COPY server.js .
CMD node server.js
EOF

