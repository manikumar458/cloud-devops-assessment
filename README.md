This project demonstrates deploying a simple web application in a cloud-based Kubernetes cluster with monitoring using Prometheus .
Steps to Deploy :-

Prerequisites - 
- Install Terraform
- Install kubectl 
- Install Docker 
- Install Prometheus

Provision Cloud Infrastructure:
Bash
Copy code
cd terraform/
terraform init
terraform apply
-----------------------------------------------------------
Build and Push Docker Image:
Bash
Copy code
docker build -t  dockerfile /web-app:latest .
docker push manikumar /web-app:latest
-----------------------------------------------------------------
Deploy Kubernetes Resources:
bash
Copy code
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/prometheus/
kubectl apply -f k8s/ingress.yaml
kubectl apply -f k8s/servicemonitor
------------------------------------------------------------------
Verify Application:

Fetch the LoadBalancer URL:
bash
Copy code
kubectl get svc web-app-service
Open the URL in your browser.
Access Monitoring Dashboard:

bash
Copy code
kubectl port-forward svc/prometheus-server 9090:80
kubectl port-forward svc/grafana 3000:80
