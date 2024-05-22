# ArgoCD-Backupper

This docker image allows you to easily backup your argocd cluster on kubernetes. 
The script connects to the cluster via ***ServiceAccount*** and performs the **`argocd admin export`** operation, which saves the entire ArgoCD cluster configuration to a file in the **`/home/argocd/backups/`** directory. We can then pull this file from the container using PVC. 

In the directory with the example was used CronJob, which executes every hour.