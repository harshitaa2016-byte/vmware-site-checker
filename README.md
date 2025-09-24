# VMware Site Checker

This PowerShell script automates the validation of VMware vSphere resources (VMs, templates, and ESXi hosts) across multiple vCenters using **VMware PowerCLI**. It helps streamline infrastructure audits and deployments by checking naming conventions and site consistency.

---

## 🔧 Features

- Connects to one or more vCenters using secure credential storage (`Export-Clixml`)
- Iterates through a list of site IDs (e.g. `NYC`, `ATL`, `SFO`)
- For each site:
  - Checks for VMs that start with the site ID
  - Checks for templates in the expected folder
  - Checks for ESXi host existence based on site naming
- Handles missing credentials, folders, or hosts gracefully
- Outputs color-coded results for better visibility

---

## 🧰 Prerequisites

- PowerShell 5.1+ or PowerShell Core  
- [VMware PowerCLI](https://developer.vmware.com/powercli) installed

### 📦 Install PowerCLI

```powershell
Install-Module -Name VMware.PowerCLI -Scope CurrentUser
🔐 Export your vCenter credentials (once per vCenter)
powershell
Copy code
Get-Credential | Export-Clixml -Path "C:\Users\user\vcenterCred1.xml"
📝 Create a sites.txt file
Add one site ID per line. Example:

nginx
Copy code
NYC
DAL
CHI
Save this as sites.txt inside a data/ folder.

📁 Folder Structure
graphql
Copy code
vmware-site-checker/
├── vcenters_check.ps1         # Main PowerShell script
├── README.md
├── .gitignore                 # (recommended)
└── data/
    └── sites.txt              # List of site IDs to check
▶️ How to Run the Script
Open PowerShell as Administrator

Navigate to the script directory

Run the script:

powershell
Copy code
.\vcenters_check.ps1
✅ Sample Output
sql
Copy code
=== Connecting to vCenter: vc1.company.com ===

--- Checking site: NYC on vc1.company.com ---
VM(s) found starting with 'NYC':
 - NYC-vm01
 - NYC-vm02

Template(s) found in folder 'NYC-xr-srv001...':
 - tca-photon-v1
 - tca-photon-v2

ESXi host found: NYC-xr-srv001...

Disconnected from vc1.company.com
