#!/bin/bash

docker login
DOCKER_BUILDKIT=1 docker build -t java-goof .
docker tag java-goof ${DOCKER_USERNAME}/java-goof:latest
docker push ${DOCKER_USERNAME}/java-goof:latest

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  annotations:
    service.alpha.kubernetes.io/tolerate-unready-endpoints: "true"
  name: java-goof
  labels:
    app: java-goof
spec:
  type: LoadBalancer
  ports:
  - port: 8080
    protocol: TCP
    targetPort: 9000
  selector:
    app: java-goof
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: java-goof
  name: java-goof
spec:
  replicas: 1
  selector:
    matchLabels:
      app: java-goof
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  template:
    metadata:
      labels:
        app: java-goof
    spec:
      containers:
      - name: java-goof
        image: omearaj/java-goof
        imagePullPolicy: Always
        env:
        - name: TREND_AP_KEY
          value: ${TREND_AP_KEY}
        - name: TREND_AP_SECRET
          value: ${TREND_AP_SECRET}
        ports:
        - containerPort: 9000
      restartPolicy: Always
EOF
