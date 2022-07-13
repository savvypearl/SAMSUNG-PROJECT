# Samsung Electronics America (SEA), North America Service Business Organization (NASBO) Devops Test

## Project Structure Overview
- `terraform`: contains all infra related code
- `app`: contains all the javascript related files
- `docker`: contains Dockerfile for the app to be dockerized
- `k8s`: contains all kubernets manifests, helm charts for the app and other components if they needs to be deployed as dependency

## tools needed
- docker
- terraform
- helm
- gitlab runner

## Tasks
1. Dockerize the application in [app](app) folder in an optimal way by completing the Dockerfile in [docker](docker)
2. Complete [.gitlab-ci.yml](.gitlab-ci.yml) with test and docker build stages pushing to gitlab registry.
3. Complete the infra components in [terraform](terraform/README.md)

## Bonus Task
1. Complete the helm chart in [k8s/app](k8s/app) folder to deploy the app built in task 2 with 4 load balanced replicas
2. Complete gitlab deploy pipeline

---
> **_NOTE:_** 
> * Above tasks does not need to be deployed in any cloud environment
> * Please give us [scratch pad commands](scratch.txt) which might give an idea on how 
normal / bonus task can be done using [commands, comments ...](scratch.txt) or a gitlab deploy pipeline.
---


## submission
execute ./submit.sh like below to submit all your responses
```shell
  ./submit.sh firstname_lastname
```

