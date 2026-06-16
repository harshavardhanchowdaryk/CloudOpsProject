# CloudOpsProject

## Project Title
Cloud Infrastructure, Automation & Deployment Ecosystem

## Client/Company
Coratia Technologies

## Project Overview
This project demonstrates cloud infrastructure setup, application deployment, Docker containerization, CI/CD automation, Terraform infrastructure code, and Kubernetes deployment files.

## Technologies Used
- AWS EC2
- Ubuntu Linux
- Python Flask
- Docker
- Git and GitHub
- GitHub Actions
- Terraform
- Kubernetes

## Features
- Created AWS EC2 cloud server
- Deployed Flask app on AWS
- Installed Docker
- Created Docker image and container
- Opened app in browser using public IP and port 5000
- Pushed project code to GitHub
- Added Terraform code
- Added GitHub Actions CI pipeline
- Added Kubernetes deployment and service files

## Project Structure
- app.py
- Dockerfile
- README.md
- terraform/main.tf
- kubernetes/deployment.yaml
- kubernetes/service.yaml
- .github/workflows/deploy.yml

## Output
CloudOps Project Running

## Docker Commands
sudo docker build -t cloudops-app .
sudo docker run -d -p 5000:5000 --name cloudops-container cloudops-app
sudo docker ps

## Conclusion
This project gives practical exposure to AWS, Docker, GitHub Actions, Terraform, and Kubernetes basics.
