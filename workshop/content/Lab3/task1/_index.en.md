+++
title = "Storage Scaling (30 mins)"
date = 2020-04-22T23:10:28-05:00
weight = 10
+++


* Open the [Amazon RDS  service console](https://us-east-1.console.aws.amazon.com/rds/home)  

* Proceed to Databases section of [RDS](https://console.aws.amazon.com/rds/home#databases:)

* Select the DB Identifier **sqlserver-rdssql** and click on `Modify`
{{% img "console.png" "Console" %}}

* On the **Modify DB Instance** page, scroll down to change the **Storage type** to **Provisioned IOPS (SSD)**, change the value for **Allocated storage** to **100 GIB** , change the value for **Provisioned IOPS** to **5000**
{{% img "databases_modify1.png" "Database_modify" %}}

* Scroll all the way to the bottom of that page, click **CONTINUE**, verify the **summary of modifications** like below, then check the **Apply immediately** option and click on **Modify DB Instance**
{{% img "databases_modify2.png" "Database_modify" %}}

* The **status** of the database is changed to **Modifying**, RDS is applying the new storage values to the instance. This would take a few minutes. You may use the **refresh icon** to refresh the value for **status**
{{% img "databases_modify3.png" "Database_modify" %}}

* Once the value for **status** changed to **Available**, click on the DB Identifier **sqlserver-rdssql** to verify the changes. Select the **Configure** tab on database instance information page, verify information on the storage section.
{{% img "databases_modify4.png" "Database_modify" %}}
