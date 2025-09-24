# Load VMware PowerCLI module
Import-Module VMware.PowerCLI

# Define vCenters and their credential file paths
# You can add as many as needed
$vCenters = @(
    @{ Server = "vCeneter name"; CredPath = "C:\Users\user\vcenterCred1.xml" }
    # Add more here
)

# Load site IDs once (assuming all vCenters share the same sites list)
$siteIds = Get-Content -Path "C:\Users\user\scripts\sites.txt"

foreach ($vCenter in $vCenters) {
    $vCenterServer = $vCenter.Server
    $credPath = $vCenter.CredPath

    Write-Host "`n=== Connecting to vCenter: $vCenterServer ===" -ForegroundColor Green

    # Load credentials or prompt if not found
    if (Test-Path $credPath) {
        $vcCredential = Import-Clixml -Path $credPath
    } else {
        Write-Warning "Credential file not found for $vCenterServer. Please enter credentials."
        $vcCredential = Get-Credential -Message "Enter credentials for $vCenterServer"
    }

    try {
        Connect-VIServer -Server $vCenterServer -Credential $vcCredential -ErrorAction Stop

        foreach ($siteId in $siteIds) {
            Write-Host "`n--- Checking site: $siteId on $vCenterServer ---" -ForegroundColor Cyan

            # 1. Check for VMs starting with siteId
            $vms = Get-VM -Name "$siteId*" -ErrorAction SilentlyContinue
            if ($vms) {
                Write-Host "VM(s) found starting with '$siteId':"
                $vms | ForEach-Object { Write-Host " - $($_.Name)" }
            } else {
                Write-Host "No VMs found starting with '$siteId'." -ForegroundColor Yellow
            }

            # 2. Check for templates starting with tca-photon in the folder
            $folderName = "$siteId-FQDN" #add template name
            $folder = Get-Folder -Name $folderName -ErrorAction SilentlyContinue
            if ($folder) {
                $templates = Get-Template -Location $folder -ErrorAction SilentlyContinue | Where-Object { $_.Name -like "tca-photon*" }
                if ($templates.Count -gt 0) {
                    Write-Host "Template(s) found in folder '$folderName':"
                    $templates | ForEach-Object { Write-Host " - $($_.Name)" }
                } else {
                    Write-Host "No templates starting with 'tca-photon' found in folder '$folderName'." -ForegroundColor Yellow
                }
            } else {
                Write-Host "Folder '$folderName' not found." -ForegroundColor Yellow
            }

            # 3. Check if the ESXi host exists
            $esxiHostName = $folderName
            $esxiHost = Get-VMHost -Name $esxiHostName -ErrorAction SilentlyContinue
            if ($esxiHost) {
                Write-Host "ESXi host found: $esxiHostName"
            } else {
                Write-Host "ESXi host $esxiHostName not found." -ForegroundColor Yellow
            }
        }

    } catch {
        Write-Error "Failed to connect or execute commands on $vCenterServer. Error: $_"
    } finally {
        Disconnect-VIServer -Server $vCenterServer -Confirm:$false -ErrorAction SilentlyContinue
        Write-Host "Disconnected from $vCenterServer"
    }
}

Write-Host "`nAll vCenter checks complete." -ForegroundColor Green
