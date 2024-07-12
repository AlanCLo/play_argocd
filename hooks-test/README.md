# hooks-tests

Just trying out hooks on a local setup in docker desktop/kube/argocd

```bash
argocd app create hooks-test \
    --repo https://github.com/AlanCLo/play_argocd.git  \
    --path hooks-test \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace default
```
