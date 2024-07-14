#!/usr/bin/env bash

argocd app create test-app \
    --repo https://github.com/AlanCLo/play_argocd.git  \
    --path test-app \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace default
