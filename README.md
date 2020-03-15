# nautilus cluster guide
In general, we have two steps to start to use our cluster
1. *(New user only)* Apply for storage to store our files and data
2. create a pods and run your programe. A Kubernetes pod is a group of containers that are deployed together on the same host. If you frequently deploy single containers, you can generally replace the word "pod" with "container" and accurately understand the concept.

There are generally two types of pods under our situation. 
1. An independent pods is limited to exit for 6 hours
2. Pods controlled by jobs. A Job creates one or more Pods and ensures that a specified number of them successfully terminate. As pods successfully complete, the Job tracks the successful completions. When a specified number of successful completions is reached, the task (ie, Job) is complete. Deleting a Job will clean up the Pods it created.

So you can choose one of them based on your type of task.

## How to get the permanent storage:
This is sample to apply for storage. However there are several other situation. Official documents https://kubernetes.io/docs/concepts/storage/persistent-volumes/
```bash
kubectl apply -f storage.yaml
```
## How to get an interactive shell:
Use the "Pod". For pods we can use **args: ["sleep", "infinity"]**, since it will be automaticly deleted after 6 hours.
Pods can maximally exist for 6 hours. For long time use, you should create a job.
Create "Pod"
```
kubectl create -n ecepxie -f login.yaml
```
You can also manually clean you pods when it is done.
```
kubectl delete pods ${POD_NAME}
```
## How to depoloy a job
Use the "Job". For Job **Please never use args: ["sleep", "infinity"]**. This command will occupy the resources forever and can not be cleaned if your are done.

```
kubectl apply -f job.yaml
```
You can also manually clean you job when it is done.
```
kubectl delete job ${JOB_NAME}
```

## How to observe the situation of your task?
1. Get pods/job name and status
```
kubectl get pods/job
```
2. See why the pods creation is pending
```
kubectl describe pods ${POD_NAME}
```
