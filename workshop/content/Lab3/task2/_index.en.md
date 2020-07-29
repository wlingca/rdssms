+++
title = "Compute Scaling (30 mins)"
date = 2020-04-22T23:10:28-05:00
weight = 20
+++


* Open the [Amazon RDS  service console](https://us-east-1.console.aws.amazon.com/rds/home)  

* Proceed to Databases section of [RDS](https://console.aws.amazon.com/rds/home#databases:)

* Select the DB Identifier **sqlserver-rdssql** and click on `Modify`
{{% img "console.png" "Console" %}}

* On the **Modify DB Instance** page, change the **DB instance class** to **m5.xlarge**, then click on **Modify**.
{{% img "databases_modify.png" "Database_modify" %}}

* Scroll all the way to the bottom of that page, click **CONTINUE**, verify the **summary of modifications** like below, then check the **Apply immediately** option and click on **Modify DB Instance**
{{% img "databases_modify1.png" "Database_modify" %}}

* The **status** of the database is changed to **Modifying**, RDS is applying the new compute values to the instance. This will take about 30 minutes or so, but the database is operational during this time. Please use the **refresh icon** to refresh the value for status
{{% img "databases_modify2.png" "Database_modify" %}}

* Once the value for the column with the name **Status** changed to `Available`, You should see the value for the column with the name **Size** set to `db.m5.xlarge`
{{% img "databases_modify3.png" "Database_modify" %}}


