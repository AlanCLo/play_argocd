# Notes

Referenced https://collabnix.com/getting-started-with-argocd-on-docker-desktop/

Steps applied:

```bash
# Step 1
kubectl create namespace argocd

# Step 2
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Step 3
kubectl get po -n argocd

# Step 4
kubectl port-forward svc/argocd-server -n argocd 8080:443
## Go to https://localhost:8080 

# Step 5 
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

# Step 6
brew install argocd

# Step 7
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# Step 8
argocd login localhost

# Step 9
argocd account update-password

# Step 10
## Does not work 
argocd cluster add docker-desktop
## Does work with docker-desktop with Kubernetes 12-Jul-2024
argocd cluster add docker-desktop --insecure --in-cluster

# Step 12
argocd app list

# Step 12 (b)
# argocd app create sockshop --repo https://github.com/argoproj/argocd-example-apps.git  --path sock-shop --dest-server https://kubernetes.default.svc --dest-namespace default
```

The argocd-example-apps works nicely and the following examples work:

```bash
argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace default 

argocd app create helm-hooks --repo https://github.com/argoproj/argocd-example-apps.git --path helm-hooks --dest-server https://kubernetes.default.svc --dest-namespace default 

argocd app create pre-post-sync --repo https://github.com/argoproj/argocd-example-apps.git --path pre-post-sync --dest-server https://kubernetes.default.svc --dest-namespace default 

argocd app create sock-shop --repo https://github.com/argoproj/argocd-example-apps.git --path sock-shop --dest-server https://kubernetes.default.svc --dest-namespace default 

```

Note: Apps don't seem to sync automatically and start as OutOfSync, with no resources attemped to be deployed and therefore reporting "missing". To get it to sync, click on app, and use 'Sync' with 'Force' ticked.


To deploy my test app which was drawn from the examples:

```bash
argocd app create hooks-test \
    --repo https://github.com/AlanCLo/play_argocd.git  \
    --path hooks-test \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace default
```

