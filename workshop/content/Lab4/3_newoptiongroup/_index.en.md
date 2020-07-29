+++
title = "Create new Option group"
date = 2020-05-26T23:45:43-04:00
weight = 30
+++

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home). From the left pane click on the **Option groups**, then click on `Create group` from  **Option groups** page.
{{% img "newoption1.png" "New Option" %}}

{{% notice tip %}} 
The option groups are specific to RDS SQL Server Version and Edition. In the initial Lab the SQL Server was created with SQL Server Enterprise Edition 2017. These options should be selected here.
{{% /notice %}}

* In the Create option group page enter the details as below

    * **Name**: `sql-2017-enable-native-backup-audit-tde`.

    * **Description**: `Enable native backup, auditing and TDE for SQL Server 2017`.

    * **Engine**: `sqlserver-ee`.

    * **Major Engine Version**: `14.00`.

* Click on **Create**.
{{% img "newoption2.png" "New Option" %}}

* Once created you should see the option in the list as below
{{% img "newoption3.png" "New Option" %}}

{{% notice info %}} 
Please note that we have not turned on any options with this option group. We will be adding options  to the option group in the upcoming labs.
{{% /notice %}}