# 🚀 Azure API Deployment with AWX, NGINX, and Flask

## 📌 Overview

This project demonstrates a full end-to-end cloud deployment pipeline using:

- **Terraform** for infrastructure provisioning
- **AWX (Ansible Automation Platform)** for configuration management
- **NGINX** as a reverse proxy
- **Flask** as a backend API
- **Let’s Encrypt (Certbot)** for HTTPS
- **Azure** as the cloud platform

This lab was designed as an **ephemeral cloud environment**. Infrastructure was provisioned, configured, validated, and then **destroyed after testing** to minimize cost and reduce unnecessary public exposure.

---

## 🧱 Architecture


Client (Browser / curl)
↓
DNS (api.sharodallen.it.com)
↓
Azure Public IP
↓
Network Security Group (NSG)
↓
NGINX (Reverse Proxy + TLS Termination)
↓
Flask API (localhost:5000)


---

## 🌐 Endpoint Model

The API endpoint was deployed temporarily for validation and testing, then destroyed.

Example endpoint used during testing:


https://api.sharodallen.it.com/api


---

## ⚙️ Technologies Used

| Component | Purpose |
|----------|--------|
| Terraform | Deploy Azure VM and networking |
| AWX | Automate configuration and deployment |
| Ansible | Configure NGINX and Flask |
| NGINX | Reverse proxy and TLS termination |
| Flask | Backend API service |
| Certbot | Free SSL certificates (Let’s Encrypt) |
| Azure NSG | Firewall rules and traffic control |

---

## 🔄 Deployment Workflow


GitHub → AWX → Ansible Playbook → Azure VM → Validation → Teardown


1. Code pushed to GitHub  
2. AWX pulls playbooks  
3. Ansible configures VM  
4. NGINX + Flask deployed  
5. API validated (DNS, HTTPS, routing)  
6. Infrastructure destroyed  

---

## 🔐 Security Features

- ✅ HTTPS using Let’s Encrypt  
- ✅ HTTP → HTTPS redirect  
- ✅ Backend service bound to localhost only  
- ✅ NSG restricts inbound traffic (SSH limited to home IP)  
- ✅ NGINX restricts access to only `/api` endpoint  
- ✅ Environment destroyed after validation to reduce exposure  

---

## 🔁 Reverse Proxy Configuration

NGINX routes external requests to the internal Flask service:

```nginx
location = /api {
    proxy_pass http://127.0.0.1:5000/api;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}
🧪 API Response Example
{
  "status": "ok",
  "message": "Hello from Sharod's real Flask backend",
  "service": "flask",
  "automation": "AWX + Ansible"
}
🛠️ Challenges & Troubleshooting
🔹 DNS Resolution Issue (UniFi)
Problem: Domain did not resolve locally
Root Cause: UniFi router caching DNS
Fix: Switched to public DNS (8.8.8.8 / 1.1.1.1)
🔹 Azure NSG Blocking Traffic
Problem: API not reachable externally
Root Cause: Port 80/443 restrictions
Fix: Updated NSG rules to allow HTTP/HTTPS
🔹 NGINX Misconfiguration
Problem: HTTP returned 404 instead of redirect
Fix: Implemented proper HTTP → HTTPS redirect
🔹 HTTPS Connectivity Issue
Problem: HTTPS requests failed after certificate deployment
Root Cause: Port 443 not open in NSG
Fix: Added NSG rule for HTTPS
📚 Key Concepts Demonstrated
Infrastructure as Code (IaC)
Configuration Management
Reverse Proxy Architecture
TLS Termination
DNS Troubleshooting (local vs global resolution)
Cloud Network Security (NSG)
Automation Pipelines (Git → AWX → Ansible)
🚀 Future Enhancements
Deploy Flask using Gunicorn (production server)
Implement API authentication (JWT / API keys)
Add rate limiting (NGINX)
Route multiple services via NGINX
Integrate Azure API Gateway / WAF
Add monitoring and logging
🧠 Lessons Learned
DNS operates at multiple layers (local vs public resolution)
Cloud firewalls (NSGs) are a common root cause of access issues
Reverse proxies are critical for secure application architecture
Automation enables fast, repeatable deployments
Ephemeral environments reduce cost and improve security posture
👊 Author

Sharod Allen
Cloud / Security / Automation Enthusiast

⭐ Final Thoughts

This project demonstrates a real-world cloud deployment pattern combining:

Automation
Security
Networking
Application delivery

The environment was intentionally designed to be repeatable and temporary, reflecting modern cloud engineering practices focused on automation, validation, and teardown.