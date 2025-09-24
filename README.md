# vmware-site-checker
Automated validation of VMs, templates, and ESXi hosts across multiple vCenters using secure credential loading and site ID matching logic.

# VMware Site Checker

This PowerShell script automates the validation of VMware vSphere resources (VMs, templates, and ESXi hosts) across multiple vCenters using **VMware PowerCLI**. It helps streamline infrastructure audits and deployments by checking naming conventions and site consistency.

## 🔧 Features

- Connects to one or more vCenters using secure credential storage (`Export-Clixml`)
- Iterates through a list of site IDs (e.g. `NYC`, `ATL`, `SFO`)
- For each site:
  - Checks for VMs that start with the site ID
  - Checks for templates in the expected folder
  - Checks for ESXi host existence based on site naming
- Handles missing credentials, folders, or hosts gracefully
- Outputs color-coded results for better visibility

## 🧰 Prerequisites

- PowerShell 5.1+ or PowerShell Core
- [VMware PowerCLI](https://developer.vmware.com/powercli) installed

```powershell
Install-Module -Name VMware.PowerCLI -Scope CurrentUser
Export your vCenter credentials (once per vCenter):

Get-Credential | Export-Clixml -Path "C:\Users\user\vcenterCred1.xml"
Create a sites.txt file with one site ID per line (e.g., NYC, DAL, CHI)

🔐 Export your vCenter credentials (once per vCenter)
Get-Credential | Export-Clixml -Path "C:\Users\user\vcenterCred1.xml"

📝 Create a sites.txt file

Add one site ID per line. Example:

NYC
DAL
CHI


Save this as sites.txt in a data/ folder.
