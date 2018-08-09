#!/bin/sh

cat > deployment.yml <<EOF
---
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: hello-node
  labels:
    app: hello-node
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: hello-node
    spec:
      containers:
      - name: hello-node
        image: ${DOCKER_REPO}:${VERSION}
        imagePullPolicy: Always
        ports:
        - containerPort: 8080
          name: nodejs
          protocol: TCP
      imagePullSecrets:
      - name:  ${IMAGESECRET}
EOF
