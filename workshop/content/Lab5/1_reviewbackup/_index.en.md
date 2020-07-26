+++
title = "Review backup options and take a manual snapshot"
date = 2020-05-30T17:17:11-04:00
weight = 10
+++

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. From list of databases click on `sqlserver-rdssql` under **DB identifier**.
{{% img "review1.png" "review" %}}

* Click on `Maintenance and backups` tab and scroll down to **Backup** and **Snapshots** sections. 

* In **Backup** section you will notice Automated Backup Enabeld for 7 days and the Backup window. Under Snapshot you may see any snapshots if any taken so far, otherwise you won't see any snapshots.
{{% img "review2.png" "review" %}}

* From **Snapshots** section click on `Take snapshot`.
{{% img "review3.png" "review" %}}

* From **Take DB Snapshot** provide **Snapshot name**: `snapshot-sqlserver-rdssql` and click on `Take Snapshot`.
{{% img "review4.png" "review" %}}

* Under **Snapshots**, click on `Manual` tab and notice the Snapshot you have just taken in the last step. It would take about 20 minutes for the operation to complete and Snapshot creation time to appear. You may move on with the rest of the labs and come back to check on the status later.
{{% img "review5.png" "review" %}}

* Optionally you may view all snapshtos by clicking on **Snapshots** section. To see automatic snapshots, click on **System** tab.
{{% img "review6.png" "review" %}}