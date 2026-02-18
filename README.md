<div align="center">
  <img 
    src="images/4lGkkWCm_400x400.jpg" 
    alt="Excalidraw Logo" 
    width="230" 
    height="230"
  />
  <h1 style="font-size: 2.5em;">Excalidraw Whiteboard Deployed on EKS</h1>
<p>
    <a href="#"><img src="https://img.shields.io/badge/Cloud-%20AWS-FF9900?logo=amazon-aws&logoColor=white" alt="Amazon AWS"></a>
    <a href="#"><img src="https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform" alt="Terraform"></a>
    <a href="#"><img src="https://img.shields.io/badge/Orchestration-Kubernetes-326CE5?logo=kubernetes&logoColor=white" alt="Kubernetes"></a>
    <a href="#"><img src="https://img.shields.io/badge/Container-Docker-2496ED?logo=docker" alt="Docker"></a>
    <a href="#"><img src="https://img.shields.io/badge/CI/CD-GitHub_Actions-2088FF?logo=github-actions" alt="CI/CD"></a>
  
  <br>
  <p>
    <a href="#"><img src="https://img.shields.io/badge/Package%20Manager-Helm-0F1689?logo=helm&logoColor=white" alt="Helm"></a>
    <a href="#"><img src="https://img.shields.io/badge/GitOps-ArgoCD-EF7B4D?logo=argo&logoColor=white" alt="Argo CD"></a>
    <a href="#"><img src="https://img.shields.io/badge/Monitoring-Grafana-F46800?logo=grafana&logoColor=white"></a>
    <a href="#"><img src="https://img.shields.io/badge/Monitoring-Prometheus-E6522C?logo=prometheus&logoColor=white"></a>
    
  </p>
</div>

---

## Introduction
This project is a scalable, production grade deployment of the Excalidraw whiteboarding app on an EKS cluster. The deployment is distributed across multiple AZ's for high availability and utilises EKS Managed Node Groups with auto-scaling capabilities. Infrastructure is fully automated using Terraform, while the application is containerised with Docker and delivered via GitHub Actions CICD pipelines that feeds into ArgoCD for GitOps deployment. The application is packaged and deployed using Helm, with NGINX Ingress for traffic management.

### Why Excalidraw
This application serves as a critical tool for secure visual collaboration. It allows technical teams to map out complex cloud architectures and system flows within a sovereign, self hosted environment. By keeping these diagrams private rather than using public SaaS alternatives, clients ensure strict data governance and prevent sensitive intellectual property from leaving their controlled infrastructure. I designed the architecture diagram below using the actual I application deployed on this repo at exd.tahirbajramselita.co.uk

## Architecture diagram on Excalidraw (deployed on exd.tahirbajramselita.co.uk)

<div align="center">
  <img 
    src="images/arch.png" 
    alt="aws arch" 
    width="1000" 
    height="1000"
  />
  </div>
