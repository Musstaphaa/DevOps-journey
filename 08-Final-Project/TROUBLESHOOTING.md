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
