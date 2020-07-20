+++
title = "Point In Time Recovery"
date = 2020-05-31T21:15:37-04:00
weight = 20
+++

Point in time recovery restores the entire snapshot as a separate instance. In other words, RDS to setup a new instance and then restores all databases from snapshot image.

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. From list of databases select `sqlserver-rdssql` under **DB identifier**.

* From Actions menu click on `Restore to point in time` option.
{{% img "pitr1.png" "review" %}}

* From **Launch DB Instance** page of Restore to point in time option, select `Latest restorable time` from Restore time option. You may also select custom point to restore in time by select `Custom` option. Select `DB instance class` as **db.t3.2xlarge**.
{{% img "pitr2.png" "review" %}}

* Scroll down to Settings and provide the **Db instance identifier** as `restored-sqlserver-rdssql`.
{{% img "pitr3.png" "review" %}}

* Scroll down to the bottom of page and click on `Launch DB Instance`.
{{% img "pitr4.png" "review" %}}

* From **Databases** page you will see that a new instance `restored-sqlserver-rdssql` is in **creating** state.
{{% img "pitr5.png" "review" %}}

* Once completed, the Status will be changed from **Creating** to **Available**. You may connect to restored instance the same way you were able to connect to the original instance.

* Navigate to [**Databases**](https://console.aws.amazon.com/rds/home?region=us-east-1#databases:) page and select **DB identifier** `restored-sqlserver-rdssql`. Click on **Action** menu and select `Delete`.
{{% img "pitr6.png" "review" %}}

* From Delete database page, uncheck **Create final snapshots** and **Retain automated backups** option. Also Check the Acknowledgement. Confirm the delete and click on **Delete**.
{{% img "pitr7.png" "review" %}}

