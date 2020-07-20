+++
title = "Modifying the DB Instance size for Read Scaling"
date = 2020-04-22T23:10:28-05:00
weight = 30
+++

{{% notice note %}}
Amazon RDS uses the MariaDB, MySQL, Oracle, PostgreSQL, and Microsoft SQL Server DB engines' built-in replication functionality to create a special type of DB instance called a read replica from a source DB instance. Updates made to the source DB instance are asynchronously copied to the read replica. You can reduce the load on your source DB instance by routing read queries from your applications to the read replica. Using read replicas, you can elastically scale out beyond the capacity constraints of a single DB instance for read-heavy database workloads.
{{% /notice  %}}

{{% notice note %}}
Before a DB instance can serve as a source instance for replication, you must enable automatic backups on the source DB instance. To do so, you set the backup retention period to a value other than 0. The source DB instance must be a Multi-AZ deployment with Always On Availability Groups (AGs). Read replicas are only available on the SQL Server Enterprise Edition (EE) engine.

{{% /notice  %}}
* Open the [Amazon RDS  service console](https://us-east-1.console.aws.amazon.com/rds/home?region=us-east-1)  
Click **DB instances** to view the previously created DB instance.
{{% img "_consoledb.png" "Console" %}}


* Next, Select the **DB identifier** with the value `sqlserver` ,  Then click on the **Actions** for a drop down list, In that list click on **Create read replica**. You would see a similar page like below
{{% img "databases_modify.png" "Database_modify" %}}


* Then Choose the instance specifications that you want to use. We recommend that you use the same DB instance class and storage type as the source DB instance for the read replica.  

* Now, Use the vertical scroll bar to scroll until you see the **Settings** Section. For **DB instance identifier**, enter a name for the read replica. ( For Ex: `sqlserver-replica` )
{{% img "databases_modify2.png" "Database_modify2" %}}


* Then use the vertical scroll bar to scroll all the way to the bottom of that page, Click on **Create read replica**
{{% img "databases_modify3.png" "Database_modify3" %}}


* Now, You would be seeing the Databases dashboard, Please note there is a new entry in the **DB Identifier** with the name `sqlserver-replica` with a **Role** of `Replica`,  **Status** of `Creating`.
{{% img "databases_modify4.png" "Database_modify4" %}}


* Now, Please use the **refresh icon** to refresh the value for status until you see the **Status** for the replica is changed to `Available`
{{% img "databases_modify5.png" "Database_modify5" %}}
