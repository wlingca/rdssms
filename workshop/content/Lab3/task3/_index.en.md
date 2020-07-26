+++
title = "Read Scale Out with Read Replica (20 mins)"
date = 2020-04-22T23:10:28-05:00
weight = 30
+++

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. From list of databases click on `sqlserver-rdssql` under **DB identifier**. Then click on the **Actions** for a drop down list, In that list click on **Create read replica**. You would see a similar page like below
{{% img "databases_modify.png" "Database_modify" %}}


* Then Choose the instance specifications that you want to use. We recommend that you use the same DB instance class and storage type as the source DB instance for the read replica.  

* Now, Use the vertical scroll bar to scroll until you see the **Settings** Section. For **DB instance identifier**, enter a name for the read replica. ( For Ex: `sqlserver-replica` )
{{% img "databases_modify2.png" "Database_modify2" %}}


* Then use the vertical scroll bar to scroll all the way to the bottom of that page, Click on **Create read replica**
{{% img "databases_modify3.png" "Database_modify3" %}}

{{% notice note %}}
Before a DB instance can serve as a source instance for replication, you must enable automatic backups on the source DB instance. To do so, you set the backup retention period to a value other than 0. The source DB instance must be a Multi-AZ deployment with Always On Availability Groups (AGs). Read replicas are only available on the SQL Server Enterprise Edition (EE) engine.
{{% /notice  %}}

* Now, You would be seeing the Databases dashboard, Please note there is a new entry in the **DB Identifier** with the name `sqlserver-replica` with a **Role** of `Replica`,  **Status** of `Creating`.
{{% img "databases_modify4.png" "Database_modify4" %}}

* It takes about 20 minutes for the operation to complete. The **Status** for the replica is changed to `Available` once it's done. You may use the **refresh icon** to check on the latest **Status**.
{{% img "databases_modify5.png" "Database_modify5" %}}

* Once the replica is created and available, you can connect to the replica using endpoint information. Click on `sqlserver-replica` from the list of  database instances, select the **Connectivity and security** tab retrieve the endpoint from  **Endpoint & port** section.
{{% img "replica2.png" "replica" %}}

{{% notice note %}}
Deployment with read replica does not support native restores. However, you may remove all read replicas, perform a native restore, and recreate the read replicas.
{{% /notice  %}}