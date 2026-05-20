# (Troubleshooting Log)
## Day 1: Docker & Python Dependencies
1. **YAML Parsing Error:** Fixed by ensuring correct strict indentation in `docker-compose.yml`.
2. **Dockerfile COPY Error:** Added the missing destination dot (`.`) in the build steps.
3. **Python Indentation:** Corrected strict space indentation in `app.py`.
4. **Dependency Hell (ImportError):** Pinned `Flask==2.2.2` and `Werkzeug==2.2.2` in `requirements.txt` to resolve compatibility issues.

## Day 2: Terraform & AWS EKS Provisioning
5. **AWS Free Tier Instance Limit:** Encountered an `InvalidParameterCombination` error when deploying EKS nodes with `t3.medium`.
   - **Root Cause:** The `t3.medium` instance type is not covered by the AWS Free Tier limitations on this specific account.
   - **Resolution:** Modified the Terraform node group configuration to use `t3.micro` instances and successfully re-applied the state, allowing Terraform to replace only the failed resource without disrupting the underlying VPC.
## Day 3: Kubernetes Deployment & Docker Hub Integration

**6. Docker Image Not Found for Tagging:** Encountered an error `No such image: nanobanana-app:latest` when trying to tag the local image for Docker Hub push.
* **Root Cause:** The local image cache was cleared or the image was built with a different tag previously.
* **Resolution:** Rebuilt the image directly with the target Docker Hub tag using `docker build -t musstapha1/nanobanana-app:v1.0 .` to leverage the build cache and push it seamlessly.

**7. EKS Connection Timeout (no such host):** `kubectl apply` failed with a dial TCP lookup error targeting the AWS EKS endpoint.
* **Root Cause:** The local `kubeconfig` was still pointing to the old (destroyed) cluster from Day 2. When Terraform recreated the EKS cluster, it generated a new endpoint.
* **Resolution:** Updated the local context by running `aws eks update-kubeconfig --region us-east-1 --name nanobanana-cluster`.

**8. Database Connection Failure (Unix domain socket error):** The web app pod was running but the application displayed `CANNOT talk to DB`.
* **Root Cause:** The application was deployed without a database pod in the cluster and lacked the necessary environment variables to route traffic to it.
* **Resolution:** Deployed an official `postgres:15` image using a separate Kubernetes manifest. Updated the app's deployment manifest to inject `PGHOST`, `PGUSER`, `PGPASSWORD`, and `PGDATABASE` via environment variables.

**9. Pod Stuck in `Pending` State (Rolling Update Deadlock):** During the application deployment update, the new pod was stuck in `Pending` while the old pod remained `Running`.
* **Root Cause:** AWS Free Tier `t3.micro` nodes have strict resource limits. Kubernetes' default rolling update strategy prevents terminating the old pod until the new one is ready, but the new pod couldn't be scheduled due to insufficient CPU/Memory slots on the full nodes.
* **Resolution:** Manually intervened by force-deleting the old pod (`kubectl delete pod <old-pod-name>`). This freed up the necessary resources, allowing the scheduler to place and start the new pod successfully.
