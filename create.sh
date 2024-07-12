#!/bin/sh

argocd app create hooks-test \
    --repo https://github.com/AlanCLo/play_argocd.git  \
    --path hooks-test \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace default
