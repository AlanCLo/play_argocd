#!/usr/bin/env bash

argocd app create test_app \
    --repo https://github.com/AlanCLo/play_argocd.git  \
    --path test_app \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace default
