+++
title = "Failover"
date = 2020-05-21T23:06:29-04:00
weight = 20
+++


* Open connection to Bastion host using Bastion Host and connect to Database instance using SSMS. You may go back to onf of the previous labs named [Connect to SQL Server using SSMS]({{% siteurl %}}en/lab1/3_clientconnection.html) and try connecting to SQL Server instance.

* Once you are connected to Database Instance using SSMS, click on `New Query`. In query window type or copy the following command and click on `Execute`. Make a note of the SQL Server instance name returned. 

        select @@SERVERNAME
{{% img "failover1.png" "failover" %}}

{{% notice note %}}
This is the name of the primary instance. We will trigger a failover event shortly, and will compare the name of the primary instance with this after the failover.
{{% /notice %}}

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home)

* Navate to Databases section of [RDS](https://console.aws.amazon.com/rds/home#databases:).

* Select the DB Identifier **sqlserver-rdssql** and click on `Action`. From Action click on `Reboot`.
{{% img "reboot-start.png" "failover" %}}

* From **Reboot DB Instance** page select `Reboot with Failover?` option and then click on **Reboot**.  
{{% img "multiaz-reboot.png" "failover" %}}

* The database instance status will change rebooting. This would force the failover.
{{% img "reboot-progress.png" "failover" %}}

* Once the failover process completes, you will notice that the primary and secondary availability zones will switch, see below.
{{% img "failover-validate.png" "failover" %}}

* Switch back to SSMS, click on `New Query` to start a new query window. In query window type or copy the following command and click on `Execute` to run the following query again. Noticed the active SQL Server instance name has changed due to the failover. The old secondary instance now is the primary instance.

        select @@SERVERNAME
{{% img "failover2.png" "failover" %}}

{{% notice note %}}
Please note that you can connect to same endpoint name after failover, RDS would update the DNS to redirect connection to currently active instance.
{{% /notice %}}

