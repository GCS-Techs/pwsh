# Get-DhcpServerv4Scope | Get-DhcpServerv4Lease -EA SilentlyContinue -ClientId 00-0c-29-dc-a5-3b"

function mainMenu {
    $mainMenu = 'X'
    $Title = 'NetTools Script'
    $introString = ' 
        NetTools Script 0.10 
        Script will ONLY run if run as admin and on a DHCP server or domain joined host with RSAT tools installed  
        '
    while($mainMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t $introString`n"
        Start-Sleep -Seconds 1
        Write-Host "`n`t`t ================ $Title ================`n"
        Write-Host -ForegroundColor Cyan "Main Menu"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " MAC Menu"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " IP Menu"
        $mainMenu = Read-Host "`nSelection (leave blank to quit)"
        # Launch macmenu
        if($mainMenu -eq 1){
            macMenu
        }
        # Launch ipmenu
        if($mainMenu -eq 2){
            ipMenu
        }
    }
}

function macMenu {
    $macMenu = 'X'
    while($macMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t ================ $Title ================`n"
        Write-Host -ForegroundColor Cyan "MAC Menu"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Show Device MAC Addresses"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Say goodbye"
        $macMenu = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
        # Option 1
        if($macMenu -eq 1){
            Write-Host 'Get-NetAdapter | Select-Object Name, MacAddress'
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($macMenu -eq 2){
            Write-Host 'Goodbye!'
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function ipMenu {
    $ipMenu = 'X'
    while($ipMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t ================ $Title ================`n"
        Write-Host -ForegroundColor Cyan "IP Menu"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Show processes"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Show PS Version"
        $ipMenu = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
        # Option 1
        if($ipMenu -eq 1){
            Get-Process
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($ipMenu -eq 2){
            $PSVersionTable.PSVersion
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

mainMenu