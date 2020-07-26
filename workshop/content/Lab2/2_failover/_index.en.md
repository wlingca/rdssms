+++
title = "Test Failover"
date = 2020-05-21T23:06:29-04:00
weight = 20
+++

* Open remote desktop connection to the bastion host. You may go back to onf of the previous labs named [Connect to SQL Server using SSMS](../lab1/3_clientconnection.html) for instructions.

* From the bastion host, launch a Powershell session from the Start menu. 
{{% img "ps1.png" "failover" %}}

* Copy the following script to notepad, find and replace **[listener endpoint]** with the **Listener endpoint** information you saved in the previous lab. Then copy and paste the script to **Powershell** to run the script.

      
        $i=1
        $InstanceName="[listener endpoint]"
        do {
        try {
                Invoke-Sqlcmd -ServerInstance $InstanceName -Database TempDB -Query "SELECT @@SERVERNAME as ServerName, GetDate() as CurrentTime" -ErrorAction Stop
        }
        catch {
                Write-host "Connection interrupted, retrying..."
        }
        Start-Sleep -Seconds 1
        }while($i -ne 0)

* The script checks the name of the Primary instance every second. Take a note of the current Primary instance name. We will trigger a manual failover, and come back to this to check on the Primary instance name after the failover.
{{% img "ps2.png" "failover" %}}

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on  [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane

* Select the DB Identifier `sqlserver-rdssql` and click on `Action`. From **Actions** dropdown list, select `Reboot`
{{% img "reboot-start.png" "failover" %}}

* On the **Reboot DB Instance** page select `Reboot with Failover?` option and then click on `Reboot`.  
{{% img "multiaz-reboot.png" "failover" %}}

* The database instance status will change to **Rebooting**. This would force a failover.
{{% img "reboot-progress.png" "failover" %}}

* Now switch back to the **Powershell** window to monitor the failover. Notice that a Primary instance failure occurred at 12:42:57 AM, triggers a database instance failover. During the failover, connection was interrupted. Database instance failover completed 21 seconds later at 12:43:18 AM. The old Secondary instance became the new Primary instance.
{{% img "ps3.png" "failover" %}}

* Switch to the RDS  service console, you will notice that the primary and secondary availability zones have switched, see below.
{{% img "failover-validate.png" "failover" %}}


