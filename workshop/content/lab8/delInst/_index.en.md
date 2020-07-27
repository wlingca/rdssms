+++
title = "Delete Database Instance"
date = 2020-07-26T16:32:57-07:00
weight = 5
+++

Follow steps to remove any read replica or database instance(s) created in the workshop.

#### Delete any read replica instance

1. Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. From list of databases, select read replica database instance to delete, for example `sqlserver-replica`. Choose **Delete** from the **Actions** dropdown menu.  
{{% img "delinst1.png" "delinst" %}}

2. Type `delete me` in the textbox to confirm deletion of the read replica, then press the **Delete** button.
{{% img "delinst2.png" "delinst" %}}

3. **Status** of the replica instance will change to **Deleting**. You may click on the **Refresh icon** to get the latest status of the operation.
{{% img "delinst3.png" "delinst" %}}

4. Repeat steps for any additional read replica instance(s).

#### Delete database instance

1. Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. From list of databases, select the database instance to delete, for example `sqlserver-rdssql`. Choose **Delete** from the **Actions** dropdown menu.  
{{% img "delinst4.png" "delinst" %}}

2. On the **Delete instance** page, uncheck the **Create final snapshot?** and **Retain automated backups** options. Select option for **I acknowledge that upon instance deletion, automated backups, including system snapshots and point-in-time recovery, will no longer be available**. Type `delete me` in the textbox to confirm deletion of the database instance, then press the **Delete** button.
{{% img "delinst5.png" "delinst" %}}

3. **Status** of the replica instance will change to **Deleting**. You may click on the **Refresh icon** to get the latest status of the operation.
{{% img "delinst3.png" "delinst" %}}

4. Repeat steps for any additional database instance(s) created.
