# Nano-Banana DevOps Journey 🚀

A comprehensive End-to-End DevOps project taking a Python web application from local development to a highly available AWS EKS cluster, using Docker, Terraform, and Kubernetes.

---

## Phase 1: Containerization (Docker)

**Objective:** Containerize the Python web application and prepare the local development environment.

### What I Did:
* Wrote a `Dockerfile` to package the Python application with its required dependencies safely.
* Created a `docker-compose.yml` file to orchestrate and run both the web application and a PostgreSQL database simultaneously.
* Successfully tested the application locally to ensure seamless communication between the app container and the database container.

**Proof of Execution:**
![App Running Locally](images/Live-local-app.png)

---

## Phase 2: Infrastructure as Code (Terraform & AWS EKS)

**Objective:** Automate the provisioning of a robust and scalable cloud infrastructure on AWS to host the application.

### What I Did:
* Used **Terraform** to write modular infrastructure code (`main.tf`, `variables.tf`, `outputs.tf`).
* Provisioned a custom AWS Virtual Private Cloud (VPC), Subnets, and an Elastic Kubernetes Service (**EKS**) cluster.
* Successfully deployed AWS resources and connected the local `kubectl` to the new cluster.

**Proof of Execution:**
![Terraform Success & EKS Nodes](images/terraform-applying-kubernetes-over-aws-succ.png)

---

## Phase 3: Production Deployment with Kubernetes (AWS EKS)

**Objective:** Deploying the fully-dockered Nano-Banana application and PostgreSQL database on a live AWS EKS cluster with high availability and external access.

### What I Did:
* Pushed the containerized application to **Docker Hub** to be pulled by the EKS nodes.
* Configured Kubernetes Manifests (`Deployments` & `Services`) for both the web app and the database.
* Handled sensitive database credentials securely using **Environment Variables**.
* Exposed the web application to the public internet using an AWS Elastic Load Balancer (ELB).

### Proof of Execution:

**1. Application Image Pushed to Docker Hub:**
![Docker Hub Artifact](images/Dockerhub-app.png)

**2. Deploying Manifests to Kubernetes:**
![Applying Manifests](images/project-kubernetes-from-dockerhub.png)

**3. Application Live on AWS ELB connecting to Database:**
*(Check the live AWS `.amazonaws.com` URL in the previously uploaded screenshot)*
