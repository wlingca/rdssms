+++
title = "Enable Native Backup and Restore"
date = 2020-05-31T23:27:22-04:00
weight = 30
+++

In this section, an S3 will be created. Then Backup and Restore option will be enabled and access will be granted to S3 bucket where native backup will be stored.

#### ***Create S3 Bucket***
Navigate to the [AWS S3 Console](https://s3.console.aws.amazon.com/s3/home)

* Click on Create Bucket.
{{% img "s3-0.png" "BackupRestore" %}}

* On **Create bucket** page enter the details as below:

    * **Bucket Name**: `mysqlbackup-2020` (Please replace 2020 with some unique number or append your initials in order to have a unique bucket name)

    * **Region**: `US East (N. Virginia)`

* Click on `Create`.
{{% img "s3-1.png" "BackupRestore" %}}

* Bucket should be created as shown below:
{{% img "s3-2.png" "BackupRestore" %}}

#### ***Backup and Restore Options***

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home). Once you are database page, follow this sequence:

    * Click on `Option groups` on left pane.
    * Select Option group `sql-2017-enable-native-backup-audit-tde` from **Option groups** section. 
    * Click on `Add option`.
{{% img "bakrest1.png" "BackupRestore" %}}

* On **Add option** page provide the details as below.

    * **Option name**: `SQLSERVER_BACKUP_RESTORE`

    * **IAM role**: `Create a new role`

    * **IAM role name**: `SQL-S3-ROLE`

    * **S3 bucket**: `mysqlbackup-2020` (Select the name of the bucket you created above.)

    * **Encryption**: `Leave default`

    * **Scheduling**: `Immediately`

* Click on `Add option`.
{{% img "s3-3.png" "BackupRestore" %}}

* Database status will change to **Modify** while changes being applied and wait until the status changes back to **Available**.