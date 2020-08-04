+++
title = "Create new Parameter group"
date = 2020-05-26T23:22:20-04:00
weight = 20
pre = "<b>3.2 </b>"
+++

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home). From the left pane click on **Parameter groups** and then click on `Create parameter group` from  **Parameter groups** page.
{{% img "newparam1.png" "New Parameter" %}}

{{% notice tip %}} 
The parameter groups are specific to RDS SQL Server Version and Edition. In the initial Lab the SQL Server was created with SQL Server Enterprise Edition 2017. These options should be selected here.
{{% /notice %}}

* In the Create parameter group page enter the details as below

    * **Parameter group family**: `sqlserver-ee-14.0` (SQL Server Enterprise Edition 14.0 compatible).

    * **Group name**: `sql-2017-force-ssql-enable-clr`.

    * **Description**: `Force SSL on SQL 2017 and enable CLR`.

* Click on **Create**.
{{% img "newparam2.png" "New Parameter" %}}

* Once created you should see the parameter in the list as below
{{% img "newparam3.png" "New Parameter" %}}

* Click on the parameter group `sql-2017-force-ssl-enable-clr`. From **Parameters** page, click on `Edit parameters`.
{{% img "clr_2.png" "CLR" %}}

* From the **Filter parameters** type `CLR Enabled`.

* From the list, change Value for **clr enabled** to 1.

* Click on **Save changes**.
{{% img "clr_3.png" "CLR" %}}

