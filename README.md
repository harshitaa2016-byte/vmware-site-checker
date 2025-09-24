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
Save this as sites.txt in a data/ folder.

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
🔒 Security Notes
Do not commit real credential files (*.xml) or sensitive sites.txt data to GitHub.

Use a .gitignore to exclude them from version control.

📄 License
This project is licensed under the MIT License.
Feel free to fork, modify, and use — just don't forget to give credit.

yaml
Copy code

---

## ✅ What to Do Next

1. Go to your GitHub repo: [vmware-site-checker](https://github.com/harshitaa2016-byte/vmware-site-checker)
2. Click on `README.md`
3. Click the **pencil icon (✏️)** to edit
4. Replace the content with the one above
5. Scroll down and **commit changes**

---

Let me know if you want help:

- Renaming the script file for clarity
- Adding sample `sites.txt`
- Setting up `.gitignore`
- Improving the script itself

You're close to having a solid portfolio-ready project!


You said:
vmware-site-checker
/README.md
harshitaa2016-byte
harshitaa2016-byte
Update README.md
8c8bde2
 · 
now

Preview

Code

Blame
43 lines (29 loc) · 1.52 KB
vmware-site-checker
Automated validation of VMs, templates, and ESXi hosts across multiple vCenters using secure credential loading and site ID matching logic.

VMware Site Checker
This PowerShell script automates the validation of VMware vSphere resources (VMs, templates, and ESXi hosts) across multiple vCenters using VMware PowerCLI. It helps streamline infrastructure audits and deployments by checking naming conventions and site consistency.

🔧 Features
Connects to one or more vCenters using secure credential storage (Export-Clixml)
Iterates through a list of site IDs (e.g. NYC, ATL, SFO)
For each site:
Checks for VMs that start with the site ID
Checks for templates in the expected folder
Checks for ESXi host existence based on site naming
Handles missing credentials, folders, or hosts gracefully
Outputs color-coded results for better visibility
🧰 Prerequisites
PowerShell 5.1+ or PowerShell Core
VMware PowerCLI installed
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

ChatGPT said:
Thanks for sharing the updated README.md — it's definitely coming together! 👏

But currently, the formatting is broken due to:

Missing code blocks (you’re showing PowerShell commands inline without backticks)

Unformatted headings or lists

Redundant or repeated sections

Lack of consistent markdown structure (this affects how your GitHub page renders it)

✅ Here's a Polished Version of Your README.md (Fully Fixed)
You can copy-paste this directly into your GitHub README editor.

markdown
Copy code
# VMware Site Checker

Automated validation of VMs, templates, and ESXi hosts across multiple vCenters using secure credential loading and site ID matching logic.

This PowerShell script automates the validation of VMware vSphere resources (VMs, templates, and ESXi hosts) across multiple vCenters using **VMware PowerCLI**. It helps streamline infrastructure audits and deployments by checking naming conventions and site consistency.

---

## 🔧 Features

- Connects to one or more vCenters using secure credential storage (`Export-Clixml`)
- Iterates through a list of site IDs (e.g., `NYC`, `ATL`, `SFO`)
- For each site:
  - Checks for VMs that start with the site ID
  - Checks for templates in the expected folder
  - Checks for ESXi host existence based on site naming
- Handles missing credentials, folders, or hosts gracefully
- Outputs color-coded results for better visibility

---

## 🧰 Prerequisites

- PowerShell 5.1+ or PowerShell Core
- [VMware PowerCLI](https://developer.vmware.com/powercli)

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

▶️ How to Run
powershell
Copy code
.\vcenters_check.ps1
This script will:

Connect to each vCenter defined in the $vCenters array

Loop through all site IDs from sites.txt

Print results for:

VMs starting with the site ID.

Templates starting with tca-photon* in expected folders

ESXi hosts matching the naming pattern.

📁 Folder Structure
bash
Copy code
vmware-site-checker/
├── vcenters_check.ps1         # Main script
├── README.md
├── .gitignore                 # (optional but recommended)
└── data/
    └── sites.txt              # List of site IDs
